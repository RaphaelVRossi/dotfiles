local wk = require("which-key")
wk.add({
  -- Telescope
  { "<C-p>", ":Telescope find_files<cr>", desc = "Find File", mode = "n" },

  -- Nvim Tree
  { "<leader>a", ":NvimTreeFindFileToggle<cr>", desc = "Open file tree with file selected", mode = "n"},
  { "<leader>s", ":NvimTreeFocus<cr>", desc = "Focus on file tree", mode = "n"},

  -- Bufferline (tabs)
  { "<leader>n", ":bn<cr>", desc = "Next buffer"},
  { "<leader>p", ":bp<cr>", desc = "Previous buffer"},
  { "<leader>x", ":bd<cr>", desc = "Close buffer"},
  
  -- Nice remaps
  { "J", "mzJ`z", desc = "Join all selected lines", mode = "n" },
  { "<C-d>", "<C-d>zz", desc = "Keep cursor in place while moving down page", mode = "n" },
  { "<C-u>", "<C-u>zz", desc = "Keep cursor in place while moving up page", mode = "n" },
  { "n", "nzzzv", desc = "Center screen when looping search results",  mode = "n" },
  { "N", "Nzzzv", desc = "Center screen when looping search results",  mode = "n" },
  { "<leader>r", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], desc = "Replace all instances under cursor", mode = "n"},
  { "<leader>cx", ":!chmod +x $<cr>", desc = "Make file executable", mode = "n"},

  {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>q", ":q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    { "<leader>w", ":w<cr>", desc = "Write" },
    { "<leader>c", ":noh<cr>", desc = "Clear selection"},
    { "<leader>y", [["+y]], desc = "Yank to clipboard"},
  }
})
