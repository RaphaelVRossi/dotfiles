return {
  "johnfrankmorgan/whitespace.nvim",
  config = function()
    require("whitespace-nvim").setup {
      -- configuration options and their defaults

      -- `highlight` configures which highlight is used to display
      -- trailing whitespace
      highlight = 'DiffDelete',

      -- `ignored_filetypes` configures which filetypes to ignore when
      -- displaying trailing whitespace
      ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help' },

      -- `ignore_terminal` configures whether to ignore terminal buffers
      ignore_terminal = true,
    }
  end
}
