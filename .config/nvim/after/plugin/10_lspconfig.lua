local lspconfig = require('lspconfig')

lspconfig.pyright.setup {coq.lsp_ensure_capabilities()}
--lspconfig.tsserver.setup {coq.lsp_ensure_capabilities()}
lspconfig.bashls.setup {coq.lsp_ensure_capabilities()}
lspconfig.terraform_lsp.setup{coq.lsp_ensure_capabilities()}
--lspconfig.angularls.setup{coq.lsp_ensure_capabilities()}

