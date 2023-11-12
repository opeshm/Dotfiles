local coq = require('coq')

vim.g.coq_settings = {
  auto_start = true,
}

vim.cmd("COQnow --shut-up")
