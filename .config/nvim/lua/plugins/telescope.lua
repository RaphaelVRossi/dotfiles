return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("telescope").setup {
            file_ignore_patterns = { "node_modules/", ".git/" },
            defaults = {
                prompt_prefix = "🔍",
            },
        }
    end,
}
