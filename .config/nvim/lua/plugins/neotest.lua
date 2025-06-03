return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        dap = { justMyCode = false },
                        runner = "pytest",
                        python = ".venv/bin/python",
                    }),
                    require("neotest-vim-test")({
                        ignore_file_types = { "python", "rust" },
                    }),
                },
            })
        end,
    },
    {
        "nvim-neotest/neotest-python",
        dependencies = { "nvim-neotest/neotest" },
    },
    {
        "nvim-neotest/neotest-vim-test",
        dependencies = { "nvim-neotest/neotest" },
    },
}
