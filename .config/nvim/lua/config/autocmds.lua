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


vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopePreviewerLoaded",
    callback = function(args)
        vim.wo.number = true
        vim.wo.wrap = false
    end,
})

require('lspconfig').lua_ls.setup { -- Or lspconfig.sumneko_lua.setup if you're using an older name
    settings = {
        Lua = {
            -- Make the server aware of Neovim runtime files
            runtime = {
                -- Tell the language server which version of Lua you're using (Neovim uses LuaJIT)
                version = 'LuaJIT',
                -- Setup your lua path as per your OS and Neovim setup
                -- path = vim.split(package.path, ';'), -- You might not need this if using 'workspace.library'
            },
            diagnostics = {
                -- Get rid of warnings about undefined globals
                globals = { 'vim' }, -- Add 'vim' here
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                -- or specifically for Neovim Lua development:
                -- library = {
                --   [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                --   [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                --   -- Add any other paths to your Neovim Lua plugins or stdpaths
                --   -- [vim.fn.stdpath('config') .. '/lua'] = true,
                -- },
                checkThirdParty = false, -- Can sometimes help, but 'library' is more direct
            },
            -- This is deprecated but some older configs might use it.
            -- It's better to use 'workspace.library' and 'diagnostics.globals'.
            -- completion = {
            --   callSnippet = "Replace"
            -- },
            -- telelemetry = {
            --   enable = false,
            -- },
        },
    },
    -- on_attach, capabilities, etc. as you have them
}
