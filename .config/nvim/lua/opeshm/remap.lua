local nnoremap = require("opeshm.keymap").nnoremap
local vnoremap = require("opeshm.keymap").vnoremap
local tnoremap = require("opeshm.keymap").tnoremap

-- Plugins
nnoremap("<leader>ft", "<cmd>:NvimTreeToggle<CR>")
nnoremap("<leader>ff", "<cmd>Telescope find_files hidden=true<cr>")

-- File
nnoremap("<leader>fs", "<cmd>:w<CR>")
nnoremap("<leader>wq", "<cmd>:q<CR>")

-- Windows
nnoremap("<leader>wh", "<C-W>h")
nnoremap("<leader>wj", "<C-W>j")
nnoremap("<leader>wk", "<C-W>k")
nnoremap("<leader>wl", "<C-W>l")
nnoremap("<leader>w|", ":vsplit<CR>")
nnoremap("<leader>w-", ":split<CR>")

-- Buffers
nnoremap("<leader>bn", "<cmd>:bnext<CR>")
nnoremap("<leader>bp", "<cmd>:bprevious<CR>")
nnoremap("<leader>bd", "<cmd>:bp<cr>:bd #<cr>")
nnoremap("<leader>1", "1gt")
nnoremap("<leader>2", "2gt")
nnoremap("<leader>3", "3gt")
nnoremap("<leader>4", "4gt")
nnoremap("<leader>5", "5gt")
nnoremap("<leader>6", "6gt")
nnoremap("<leader>7", "7gt")
nnoremap("<leader>8", "8gt")
nnoremap("<leader>9", "9gt")
nnoremap("<leader>0", "<cmd>:tablast<CR>")

-- Codding
vnoremap("<leader>fc", ":fo<CR>")
vnoremap("<leader>fo", ":foldo<CR>")

-- Terminal
nnoremap("<leader>to", "<cmd>:split term://bash<CR>")
tnoremap("<esc>", '<C-\\><C-n>')

