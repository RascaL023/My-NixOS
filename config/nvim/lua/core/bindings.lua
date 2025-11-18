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
vim.keymap.set("i", "<C-v>", '<ESC>"+pI', opts)
vim.keymap.set("i", "<C-c>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>yyi", true, false, true), "n", true)
end, opts)
vim.keymap.set("i", "<C-v>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>p==i", true, false, true), "n", true)
end, opts)

-- Selections
-- vim.keymap.set("n", "<S-Left>", "v<Left>")
-- vim.keymap.set("n", "<S-Right>", "v<Right>")
-- vim.keymap.set("n", "<S-Up>", "v<Up>")
-- vim.keymap.set("n", "<S-Down>", "v<Down>")
-- vim.keymap.set("i", "<S-Left>", "<Esc>v<Left>")
-- vim.keymap.set("i", "<S-Right>", "<Esc>v<Right>")
-- vim.keymap.set("i", "<S-Up>", "<Esc>v<Up>")
-- vim.keymap.set("i", "<S-Down>", "<Esc>v<Down>")
vim.keymap.set("n", "<S-Left>",  "gh<Left>")
vim.keymap.set("n", "<S-Right>", "gh<Right>")
vim.keymap.set("n", "<S-Up>",    "gh<Up>")
vim.keymap.set("n", "<S-Down>",  "gh<Down>")
vim.keymap.set("i", "<S-Left>",  "<Esc>gh<Left>")
vim.keymap.set("i", "<S-Right>", "<Esc>gh<Right>")
vim.keymap.set("i", "<S-Up>",    "<Esc>gh<Up>")
vim.keymap.set("i", "<S-Down>",  "<Esc>gh<Down>")
vim.keymap.set("v", "<S-Left>", "<Left>")
vim.keymap.set("v", "<S-Right>", "<Right>")
vim.keymap.set("v", "<S-Up>", "<Up>")
vim.keymap.set("v", "<S-Down>", "<Down>")
vim.keymap.set({ "n", "i" }, "<S-End>", "<Esc>v<End>")
vim.keymap.set({ "n", "i" }, "<S-Home>", "<Esc>v<Home>")
vim.keymap.set({ "n", "i" }, "<C-a>", function()
  vim.cmd("normal! ggVG")
end, opts)
vim.keymap.set("n", "<leader>a", "ggVG\"+y", opts) -- select all + copy

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

-- Comment toggle
vim.keymap.set({ "n", "i" }, "<C-/>", function()
  require("Comment.api").toggle.linewise.current()
end, {})

vim.keymap.set("v", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>i", {})

-- Close active
-- map("n", "<leader>w", ":q<CR>", opts)
vim.keymap.set("n", "<leader>w", function()
  if vim.bo.modified then
    local input = vim.fn.input("Save before quit? (y/n): ")
    if input == "y" then
      vim.cmd("w | q")
    elseif input == "n" then
      vim.cmd("q!")
    end
  else
    vim.cmd("q")
  end
end)


-- Switch file
-- vim.keymap.set("n", "<C-Tab>", "<Cmd>bnext<CR>", { silent = true })
-- vim.keymap.set("n", "<C-S-Tab>", "<Cmd>bprevious<CR>", { silent = true })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

-- Window Switcher
vim.keymap.set("n", "<A-Left>", "<C-w>h")
vim.keymap.set("n", "<A-Down>", "<C-w>j")
vim.keymap.set("n", "<A-Up>", "<C-w>k")
vim.keymap.set("n", "<A-Right>", "<C-w>l")

-- Indent & unindent 
vim.keymap.set("v", "<Tab>", ">gv", { silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { silent = true })

