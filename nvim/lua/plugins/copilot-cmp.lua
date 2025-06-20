return {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    event = { "InsertEnter", "LspAttach" },
    fix_pairs = true,
    config = function()
        require("copilot_cmp").setup()
        -- attach cmp source whenever copilot attaches
        -- fixes lazy-loading issues with the copilot cmp source
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local buffer = args.buf ---@type number
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client and (not "copilot" or client.name == "copilot") then
                    return require("copilot_cmp")._on_insert_enter(client, buffer)
                end
            end,
        })
        local cmp = require("cmp")
        local current_sources = cmp.get_config().sources or {}
        table.insert(current_sources, {
            name = "copilot",
            priority = 100,
        })
        cmp.setup({
            sources = current_sources,
        })
    end,
}
