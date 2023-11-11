-- Plugins
--- Telescope
vim.keymap.set("n", "<leader>ft", "<cmd>:NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope buffers<CR>")

--- NvimTree
vim.keymap.set("n", "<leader>trl", ":NvimTreeResize +5<CR>")
vim.keymap.set("n", "<leader>trh", ":NvimTreeResize -5<CR>")
vim.keymap.set("n", "<leader>tR", ":NvimTreeRefresh<CR>")

--- VimSpector
vim.keymap.set("n", "<Leader>di", "<Plug>VimspectorBalloonEval")
vim.keymap.set("x", "<Leader>di", "<Plug>VimspectorBalloonEval")

-- File
vim.keymap.set("n", "<leader>fs", "<cmd>:w<CR>")
vim.keymap.set("n", "<leader>wq", "<cmd>:q<CR>")

-- View
vim.keymap.set("n", "<leader>vs", "<cmd>:mkview<CR>")
vim.keymap.set("n", "<leader>vl", "<cmd>:loadview<CR>")

-- Windows
vim.keymap.set("n", "<leader>wh", "<C-W>h")
vim.keymap.set("n", "<leader>wj", "<C-W>j")
vim.keymap.set("n", "<leader>wk", "<C-W>k")
vim.keymap.set("n", "<leader>wl", "<C-W>l")
vim.keymap.set("n", "<leader>w|", "<cmd>:vsplit<CR>")
vim.keymap.set("n", "<leader>w-", "<cmd>:split<CR>")
vim.keymap.set("n", "<leader>me", "<cmd>:set mouse=a<CR>")
vim.keymap.set("n", "<leader>md", "<cmd>:set mouse=<CR>")

-- Buffers
vim.keymap.set("n", "<leader>bn", "<cmd>:bnext<CR>")
vim.keymap.set("n", "<leader>bp", "<cmd>:bprevious<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>:bp<CR>:bd #<CR>")
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")
vim.keymap.set("n", "<leader>0", "<cmd>:tablast<CR>")

-- Tabs
vim.keymap.set("n", "<leader>tc", "<cmd>:tabnew<CR>")
vim.keymap.set("n", "<leader>tn", "<cmd>:tabnext<CR>")
vim.keymap.set("n", "<leader>tp", "<cmd>:tabprevious<CR>")
vim.keymap.set("n", "<leader>tx", "<cmd>:tabclose<CR>")

-- Codding
vim.keymap.set("v", "<leader>fc", ":fo<CR>")
vim.keymap.set("v", "<leader>fo", ":foldo<CR>")

-- Terminal
vim.keymap.set("n", "<leader>to", "<cmd>:tabnew term://bash<CR>")
vim.keymap.set("t", "<esc>", '<C-\\><C-n>')