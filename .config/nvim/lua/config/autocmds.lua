local lazy = require('legendary.toolbox').lazy
require('legendary').autocmds({
	{
		name = 'Custom',
		clear = true,
		{ 'FocusLost', 'silent! wa' },
		{ 'TextYankPost', lazy(vim.highlight.on_yank, { higroup = 'TextYank', timeout = 150 }) },
		{ 'VimResized', lazy(vim.api.nvim_command, 'wincmd =') },
		{
			{ 'BufEnter', 'BufWritePost' },
			function(args)
				local bufinfo = vim.fn.getbufinfo(args.buf)
				if #bufinfo ~= 1 then
					return
				end

				local buffer = bufinfo[1]
				if buffer.listed == 0 then
					return
				end

				local name = ''
				local directory = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
				if buffer.name == '' then
					name = '[No Name]'
				else
					name = vim.fn.fnamemodify(buffer.name, ':t')
				end
				vim.opt.titlestring = string.format('%s - %s', name, directory)
			end,
		},
	},
})

vim.api.nvim_create_autocmd('BufRead', {
  callback = function(opts)
    vim.api.nvim_create_autocmd('BufWinEnter', {
      once = true,
      buffer = opts.buf,
      callback = function()
        local ft = vim.bo[opts.buf].filetype
        local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
        if
          not (ft:match('commit') and ft:match('rebase'))
          and last_known_line > 1
          and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
        then
          vim.api.nvim_feedkeys([[g`"]], 'x', false)
        end
      end,
    })
  end,
})
