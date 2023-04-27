local g = vim.g
g.mapleader = ' ' -- space as the leader key

g.mouse = nil

local wo = vim.wo
wo.number = true

local o = vim.o
o.termguicolors = true

local opt = vim.opt

-- Global Configuration

opt.mouse = nil
-- column
opt.colorcolumn = '80'
opt.signcolumn = 'yes'

-- tab indent
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2

-- search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- scroll
opt.scrolloff = 8

-- cmd
opt.cmdheight = 2

opt.encoding = 'utf-8'

-- split
opt.splitright = true
opt.splitbelow = true

opt.autoread = true

-- disable backup / swap
opt.swapfile = false
opt.backup = false
opt.writebackup = false


opt.updatetime = 100
