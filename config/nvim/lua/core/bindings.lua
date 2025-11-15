local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Tools 
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

-- Copy - Paste
vim.keymap.set("v", "<C-c>", '"+yI')
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("i", "<C-v>", '<ESC>"+pI', { noremap = true, silent = true })

-- Selections
vim.keymap.set("n", "<S-Left>", "v<Left>")
vim.keymap.set("i", "<S-Left>", "<Esc>v<Left>")
vim.keymap.set("v", "<S-Left>", "<Left>")
vim.keymap.set("n", "<S-Right>", "v<Right>")
vim.keymap.set("i", "<S-Right>", "<Esc>v<Right>")
vim.keymap.set("v", "<S-Right>", "<Right>")
vim.keymap.set("n", "<S-Up>", "v<Up>")
vim.keymap.set("i", "<S-Up>", "<Esc>v<Up>")
vim.keymap.set("v", "<S-Up>", "<Up>")
vim.keymap.set("n", "<S-Down>", "v<Down>")
vim.keymap.set("i", "<S-Down>", "<Esc>v<Down>")
vim.keymap.set("v", "<S-Down>", "<Down>")

-- Save
vim.keymap.set({ "n", "v" }, "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>i")

-- Undo - Redo
map("n", "<C-z>", "u", opts)
map("i", "<C-z>", "<Esc>ua", opts)
map("v", "<C-z>", "<Esc>ugv", opts)
map("n", "<C-y>", "<C-r>", opts)
map("i", "<C-y>", "<Esc><C-r>a", opts)
map("v", "<C-y>", "<Esc><C-r>gv", opts)

-- Delete Per Kata
map("i", "<C-BS>", "<C-w>", opts)
map("i", "<C-H>", "<C-w>", opts)
map("i", "<C-Del>", "<C-o>dw", opts)

-- Move selected
map("n", "<A-Up>", ":m .-2<CR>==", opts)
map("n", "<A-Down>", ":m .+1<CR>==", opts)
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", opts)

