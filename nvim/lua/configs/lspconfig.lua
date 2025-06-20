-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "ts_ls", "gopls" }
local nvlsp = require("nvchad.configs.lspconfig")

require("lspconfig").rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = false,
            },
        },
    },
})
local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities

require("lspconfig").clangd.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
})

-- require'lspconfig'.gopls.setup {
--   on_attach = function(client, bufnr)
--     client.server_capabilities.signatureHelpProvider = false
--     on_attach(client, bufnr)
--   end,
--   capabilities = capabilities
-- }

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    })
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--

local nvim_lsp = require("lspconfig")

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
                "-std=c++20",
                "-I/opt/homebrew/include", -- macOS Homebrew installs
                "-I/opt/homebrew/opt/boost/include", -- Boost Headers
                "-I/opt/homebrew/opt/boost/include/boost",
            },
        },
    },
})
