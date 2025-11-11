-- Load NvChad defaults (lua_ls etc.)
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require("nvchad.configs.lspconfig")

-- LS servers with default config
local servers = { "html", "cssls", "ts_ls", "gopls", "zls" }

for _, server in ipairs(servers) do
    vim.lsp.config(server, {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    })

    -- enable globally for this server
    vim.lsp.enable(server)
end

-- C++: clangd
vim.lsp.config("clangd", {
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
                "-I/opt/homebrew/include",
                "-I/opt/homebrew/opt/boost/include",
                "-I/opt/homebrew/opt/boost/include/boost",
            },
        },
    },
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        nvlsp.on_attach(client, bufnr)
    end,
    capabilities = nvlsp.capabilities,
})

vim.lsp.enable("clangd")
