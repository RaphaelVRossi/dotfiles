local wk = require("which-key")
wk.add({
    -- Telescope
    { "<C-p>",      ":Telescope find_files<cr>",                                            desc = "Find File",                                   mode = "n" },
    { "<C-{>",      ":Telescope lsp_document_symbols symbols=function symbol_width=80<cr>", desc = "Show functions",                              mode = "n" },
    { "<leader>R",  ":Telescope lsp_references<cr>",                                        desc = "Show all references",                         mode = "n" },
    { "<leader>G",  ":Telescope live_grep<cr>",                                             desc = "Live grep",                                   mode = "n" },

    -- Nvim Tree
    { "<leader>a",  ":NvimTreeFindFileToggle<cr>",                                          desc = "Open file tree with file selected",           mode = "n" },
    { "<leader>s",  ":NvimTreeFocus<cr>",                                                   desc = "Focus on file tree",                          mode = "n" },

    -- Bufferline (tabs)
    { "<leader>n",  ":bn<cr>",                                                              desc = "Next buffer",                                 mode = "n" },
    { "<leader>p",  ":bp<cr>",                                                              desc = "Previous buffer",                             mode = "n" },
    { "<leader>x",  ":bd<cr>",                                                              desc = "Close buffer",                                mode = "n" },

    -- Nice remaps
    { "J",          "mzJ`z",                                                                desc = "Join all selected lines",                     mode = "n" },
    { "<C-d>",      "<C-d>zz",                                                              desc = "Keep cursor in place while moving down page", mode = "n" },
    { "<C-u>",      "<C-u>zz",                                                              desc = "Keep cursor in place while moving up page",   mode = "n" },
    { "n",          "nzzzv",                                                                desc = "Center screen when looping search results",   mode = "n" },
    { "N",          "Nzzzv",                                                                desc = "Center screen when looping search results",   mode = "n" },
    { "<leader>r",  [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]],                           desc = "Replace all instances under cursor",          mode = "n" },
    { "<leader>cx", ":!chmod +x $<cr>",                                                     desc = "Make file executable",                        mode = "n" },

    { "<leader>t>", ":tabnew<cr>",                                                          desc = "Open new tab",                                mode = "n" },

    -- Diagnostic keys
    {
        '[d',
        function()
            vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN })
        end,
        desc = 'Go to previous warn'
    },
    { '<F1>', '[d', desc = 'Go to previous diagnostic', remap = true },
    {
        ']d',
        function()
            vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN })
        end,
        desc = 'Go to next warn'
    },
    { '<F2>', ']d', desc = 'Go to previous diagnostic', remap = true },
    {
        '[e',
        function()
            vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
        end,
        desc = 'Go to previous error',
    },
    {
        ']e',
        function()
            vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
        end,
        desc = 'Go to next error',
    },
    { '<F3>',  ']e',                      desc = 'Go to next error',          mode = "n",    remap = true, },
    {
        "<leader>dk",
        function()
            vim.diagnostic.open_float()
        end,
        mode = "n"
    },

    -- Copilot
    { "<M-.>", ":Copilot suggestion<cr>", desc = "Toggle Copilot suggestion", mode = { "n" } },


    {
        -- Nested mappings are allowed and can be added in any order
        -- Most attributes can be inherited or overridden on any level
        -- There's no limit to the depth of nesting
        mode = { "n", "v" },                         -- NORMAL and VISUAL mode
        { "<leader>q",  ":q<cr>",   desc = "Quit" }, -- no need to specify mode since it's inherited
        { "<leader>ww", ":w<cr>",   desc = "Write" },
        { "<leader>w",  "<C-w>",    desc = "Alias for ctrl - w" },
        { "<leader>c",  ":noh<cr>", desc = "Clear selection" },
        { "<leader>y",  [["+y]],    desc = "Yank to clipboard" },
    }
})
