local function remap_on_attach(bufnr)
  local api = require('nvim-tree.api')
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  api.config.mappings.default_on_attach(bufnr)
  -- your removals and mappings go here
  vim.keymap.set('n', '<C-a>',     api.tree.close,                        opts('Close'))
end

return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup({
      on_attach = remap_on_attach
    })

  end,
}
