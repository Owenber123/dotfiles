return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    local copilot = require("copilot")
    copilot.setup({
      suggestion = {
        enabled = true,
        auto_trigger = true
      },
      panel = { enabled = true },
    })
    -- Create a toggle function
    local copilot_status = true
    function ToggleCopilot()
      copilot_status = not copilot_status
      copilot.setup({
        suggestion = {
          enabled = copilot_status,
          auto_trigger = copilot_status,
        },
        panel = { enabled = copilot_status },
      })
      if copilot_status then
        print("Copilot Enabled")
      else
        print("Copilot Disabled")
      end
    end

    -- Map a keybinding to toggle Copilot
    vim.api.nvim_set_keymap(
      "n", -- Normal mode
      "<leader>ct", -- Your desired keybinding (e.g., <leader>ct for "Copilot Toggle")
      ":lua ToggleCopilot()<CR>",
      { noremap = true, silent = true }
    )
  end,
}
