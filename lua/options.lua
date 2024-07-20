require "nvchad.options"

vim.g.loaded_python3_provider = true
vim.opt.colorcolumn = "80"
vim.opt.relativenumber = true
vim.opt.termguicolors = true

local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  command = ":silent !kitty @ set-spacing padding=0 margin=0",
})

autocmd("VimLeavePre", {
  command = ":silent !kitty @ set-spacing padding=20 margin=10",
})

autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})
