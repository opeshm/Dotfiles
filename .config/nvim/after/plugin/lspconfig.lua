local coq = require('coq')
local lspconfig = require('lspconfig')

vim.g.coq_settings = {
  auto_start = true,
  clients = {
    tabnine = {
      enabled = true,
    }
  }
}

vim.cmd("COQnow --shut-up")

lspconfig.pyright.setup {coq.lsp_ensure_capabilities()}
lspconfig.tsserver.setup {coq.lsp_ensure_capabilities()}
lspconfig.bashls.setup {coq.lsp_ensure_capabilities()}
lspconfig.terraformls.setup {coq.lsp_ensure_capabilities()}
