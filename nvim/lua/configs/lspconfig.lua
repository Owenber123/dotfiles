-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "gopls", "zls" }
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    })
end

-- require'lspconfig'.gopls.setup {
--   on_attach = function(client, bufnr)
--     client.server_capabilities.signatureHelpProvider = false
--     on_attach(client, bufnr)
--   end,
--   capabilities = capabilities
-- }

local nvim_lsp = require("lspconfig")

-- C++
nvim_lsp.clangd.setup({
    cmd = { "clangd", "--background-index", "--compile-commands-dir=build" },
    init_options = {
        clangdFileStatus = true,
        clangdSemanticHighlighting = true,
    },
    filetypes = { "c", "cpp", "cxx", "cc" },
    root_dir = function()
        return vim.fn.getcwd()
    end,
    settings = {
        ["clangd"] = {
            compilationDatabasePath = "build",
            fallbackFlags = {
                "-std=c++23",
                "-I/opt/homebrew/include", -- macOS Homebrew installs
                "-I/opt/homebrew/opt/boost/include", -- Boost Headers
                "-I/opt/homebrew/opt/boost/include/boost",
            },
        },
    },
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false -- ⛔ disables signature popup
        nvlsp.on_attach(client, bufnr) -- preserve NvChad features like formatting and keymaps
    end,
    capabilities = nvlsp.capabilities,
})
