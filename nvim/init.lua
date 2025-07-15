vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

vim.o.clipboard = "unnamedplus"

-- Relative Line Numbers
vim.opt.relativenumber = true
-- Ensure current line is displayed
vim.opt.number = true

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
vim.api.nvim_set_hl(0, "TabLine", { bg = "none", fg = "#a6adc8" }) -- inactive tabs
vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none", fg = "#1e1e2e", bold = true }) -- selected tab
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" }) -- background filler space

local colors = dofile(vim.g.base46_cache .. "colors")
-- Define custom highlight groups for each markdown heading level
vim.api.nvim_set_hl(0, "@markdown.heading.1", { fg = colors.teal, bold = true })
vim.api.nvim_set_hl(0, "@markdown.heading.2", { fg = colors.vibrant_green, bold = true })
vim.api.nvim_set_hl(0, "@markdown.heading.3", { fg = colors.orange, bold = true })
vim.api.nvim_set_hl(0, "@markdown.heading.4", { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, "@markdown.heading.5", { fg = colors.purple, bold = true })
vim.api.nvim_set_hl(0, "@markdown.heading.6", { fg = colors.pink, bold = true })

-- Link the custom highlight groups to Treesitter's markdown heading captures
vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { link = "@markdown.heading.1" })
vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { link = "@markdown.heading.2" })
vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { link = "@markdown.heading.3" })
vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { link = "@markdown.heading.4" })
vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { link = "@markdown.heading.5" })
vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { link = "@markdown.heading.6" })

-- vim.api.nvim_set_hl(0, "@text.markdown", { fg = colors.purple }) -- or any color from your palette
-- vim.api.nvim_set_hl(0, "@markup", { fg = colors.purple }) -- global markup
-- vim.api.nvim_set_hl(0, "@markup.inline.markdown", { fg = colors.purple }) -- markdown-specific
vim.api.nvim_set_hl(0, "@spell", { fg = colors.purple })

require("options")
require("nvchad.autocmds")

require("configs/lspconfig")
vim.lsp.handlers.signature_help = function() end

vim.schedule(function()
    require("mappings")
end)

-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd("FileType", {
--     pattern = "go",
--     callback = function()
--         local root_dir = vim.fs.dirname(
--             vim.fs.find({ 'go.mod', 'go.work', '.git' }, { upward = true })[1]
--         )
--         local client = vim.lsp.start({
--             name = 'gopls',
--             cmd = { 'gopls' },
--             root_dir = root_dir,
--         })
--         vim.lsp.buf_attach_client(0, client)
--     end
-- })
--
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- local luasnip = require 'luasnip'
--   local servers = {
--     "lua_ls"
-- }
--     for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     -- on_attach = my_custom_on_attach,
--     capabilities = capabilities,
--   }
-- end
--

--
