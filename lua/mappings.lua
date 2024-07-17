require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "n", "n nzzzv", { desc = "Keeps highlighted word in the middle" })
map("n", "N", "N Nzzzv", { desc = "Keeps highlighted word in the middle" })

map("n", "<leader>s", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Select and replace all words" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted lines one down" })

map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted lines one up" })

map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Add breakpoint to line" })
map("n", "<leader>dr", "<cmd>DapContinue<CR>", { desc = "Start or continue the debugger" })

map({ "v", "n", "i" }, "<C-c>", "<Esc>", { noremap = true, silent = true, desc = "Cancel - does the same as Esc" })
map("n", "<C-a>", "ggVG", { desc = "Select all" })

map("n", ":", "<cmd>FineCmdline<CR>", { desc = "CMD enter command mode" })

-- The commented-out mapping for saving files
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>gl", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Line Diagnostics" })
