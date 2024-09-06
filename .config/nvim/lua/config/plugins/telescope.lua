return {
  'nvim-telescope/telescope.nvim',
  config = function()
    require("telescope").setup {
      file_ignore_patterns = {"node_modules/"}
    }
  end,
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' }
}
