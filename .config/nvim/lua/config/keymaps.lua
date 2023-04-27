local legendary = require('legendary')
local lazy = require('legendary.toolbox').lazy

local gs = require('gitsigns')

legendary.keymaps({
  -- Tab Keys
	{'<leader>t', '<Cmd>tabnew<CR>', mode = { 'n', 'x' }, opts = { remap = true }, description='Open new tab'},
	{'tt', '<Cmd>tabnew<CR>', mode = { 'n', 'x' }, opts = { remap = true }, description='Open new tab'},
	{'L', '<Cmd>BufferNext<CR>', mode = { 'n' }, opts = { remap = true }, description='Move to next open tab'},
	{'ty', '<Cmd>BufferNext<CR>', mode = { 'n' }, opts = { remap = true }, description='Move to next open tab'},
	{'<C-S-Right>', '<Cmd>BufferNext<CR>', mode = { 'n' }, opts = { remap = true }, description='Move to next open tab'},
	{'H', '<Cmd>BufferPrevious<CR>', mode = { 'n' }, opts = { remap = true }, description='Move to previous open tab'},
	{'tr', '<Cmd>BufferPrevious<CR>', mode = { 'n' }, opts = { remap = true }, description='Move to previous open tab'},
	{'<C-S-Left>', '<Cmd>BufferPrevious<CR>', mode = { 'n' }, opts = { remap = true }, description='Move to previous open tab'},
	{ 'qq', '<Cmd>BufferClose<CR>', description = 'Exit' },
	{ 'tq', '<Cmd>BufferClose<CR>', description = 'Exit' },

  -- Navigation
	{ 'n', 'nzz', description = 'Go to next occurrence and center' },
	{ 'N', 'Nzz', description = 'Go to previous occurrence and center' },
  { '<S-Up>', '<PageUp>zz', description = 'Page up and center'},
  { '<S-Down>', '<PageDown>zz', description = 'Page down and center'},

  -- Selection
	{ '<', '<gv', mode = { 'x' }, description = 'Shift left and keep selection' },
	{ '>', '>gv', mode = { 'x' }, description = 'Shift right and keep selection' },

  { '<F3>', '/', description = 'Start search' },

	{
		'dd',
		function()
			return vim.api.nvim_get_current_line():match('^%s*$') and '"_dd' or 'dd'
		end,
		mode = { 'n' },
		opts = { expr = true },
		description = 'Same as dd but uses the black hole register for empty lines',
	},

  -- Save / Quit
	{ '<Leader>w', '<Cmd>wa<CR>', description = 'Write all changed buffers' },
	{ '<Leader>qx', '<Cmd>xa<CR>', description = 'Write all changed buffers and exit' },
	{ '<Leader>qq', '<Cmd>qa<CR>', description = 'Exit' },
	{ '<Leader>Q', '<Cmd>qa!<CR>', description = 'Exit without writing' },
	{
		'gx',
		function()
			vim.loop.spawn('xdg-open', { args = { vim.fn.expand('<cfile>') }, detached = true })
		end,
		description = 'Open the URL under the cursor',
	},
	{
		'<Leader>f',
		function()
			return vim.lsp.buf.format()
		end,
		mode = { 'n' },
		description = 'Format file'
	},

  -- Diagnostic
	{ '<leader>xx', '<cmd>TroubleToggle<cr>', mode = { 'n' }, opts = { remap = true }},
	{ '<Leader>k', vim.diagnostic.open_float, description = 'Open diagnostic window for current line' },
	{ '[d', vim.diagnostic.goto_prev, description = 'Go to previous diagnostic' },
	{ '<F1>', vim.diagnostic.goto_prev, description = 'Go to previous diagnostic' },
	{ ']d', vim.diagnostic.goto_next, description = 'Go to next diagnostic' },
	{ '<F2>', vim.diagnostic.goto_next, description = 'Go to next diagnostic' },
	{
		'[e',
		lazy(vim.diagnostic.goto_prev, { severity = vim.diagnostic.severity.ERROR }),
		description = 'Go to previous diagnostic error',
	},
	{
		']e',
		lazy(vim.diagnostic.goto_next, { severity = vim.diagnostic.severity.ERROR }),
		description = 'Go to next diagnostic error',
	},

  -- Tree
  { '<C-a>', '<cmd>NvimTreeFocus<cr>', description = 'Focus File Tree'},

  -- Telescope
  { '<C-S-N>', '<cmd>Telescope find_files<cr>', description = 'Find files'},
  { '<C-S-F>', '<cmd>Telescope live_grep<cr>', description = 'Find files'},

  -- Insert lines
  { 'op' , 'o<Esc>k', mode = {'n'}, description = "Add empty line below" },
  { 'oi' , 'O<Esc>j', mode = {'n'}, description = "Add empty line above" },
  { 'oo' , 'A<CR>', mode = {'n'}, description = "Add empty line below and insert" },

  -- Nice remaps
  { 'tc', ':!', mode = {'n'}, description = "Run command inside vi"},
  { '<Leader>c', ':noh<cr>', mode = {'n'}, description = "Run command inside vi"},

  -- Split
  { 'th', ':split<CR>', mode = {'n'}, description = "Slipt horizontal"},
  { 'tv', ':vsplit<CR>', mode = {'n'}, description = "Slipt vertical"},
  { '<C-h>', '<C-w>h', mode = {'n'}, description = "Go to left split"},
  { '<C-j>', '<C-w>j', mode = {'n'}, description = "Go to down split"},
  { '<C-k>', '<C-w>k', mode = {'n'}, description = "Go to up split"},
  { '<C-l>', '<C-w>l', mode = {'n'}, description = "Go to right split"},

  -- Git
  { '<C-S-B>', gs.toggle_current_line_blame, description = "Toggle Git Blame"},
  { '<C-S-H>', gs.preview_hunk, description = "Show Hunk Preview"},
  { '<C-S-D>', gs.diffthis, description = "Show diff"},
  { '<F13>', gs.prev_hunk, description = "Previous Hunk Preview"},
  { '<F14>', gs.next_hunk, description = "Next Hunk Preview"},
})


