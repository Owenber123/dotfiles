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

require("options")
require("nvchad.autocmds")
require("configs/lspconfig")

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
