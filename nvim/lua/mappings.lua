require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Copilot

-- Accept Copilot suggestion
map("i", "<C-j>", function() require("copilot.suggestion").accept() end, { desc = "Accept Copilot suggestion" })

-- Dismiss Copilot suggestion
map("i", "<C-k>", function() require("copilot.suggestion").dismiss() end, { desc = "Dismiss Copilot suggestion" })

-- Show Copilot panel
map("n", "<leader>cp", "<cmd>Copilot panel<CR>", { desc = "Open Copilot panel" })
