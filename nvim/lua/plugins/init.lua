return {
    {
        "stevearc/conform.nvim",
        -- event = "BufWritePre", -- uncomment for format on save
        opts = require("configs.conform"),
    },

    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "InsertEnter",
    --   opts = {
    --     bind = true,
    --     handler_opts = {
    --       border = "rounded"
    --     }
    --   },
    --   config = function(_, opts) require'lsp_signature'.setup(opts) end
    -- },
    --   {
    --   "neovim/nvim-lspconfig",
    --   config = require("configs/lspconfig")
    -- }
    -- {
    --     "neovim/nvim-lspconfig",
    --     dependencies = {
    --         { "williamboman/mason.nvim", build = ":MasonUpdate" },
    --         { "williamboman/mason-lspconfig.nvim" },
    --         { "ray-x/lsp_signature.nvim" },
    --     },
    --     config = require("configs/lspconfig"),
    -- },

    -- Autocomplete and snippets

    {
        "onsails/lspkind.nvim", -- for completion icons
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                    "saadparwaiz1/cmp_luasnip",
                },
            },
        },
        config = require("configs/cmp"),
    },

    -- Git decorations
    {
        "lewis6991/gitsigns.nvim",
        config = require("configs/gitsigns"),
    },

    -- Wrapper around `git` command
    -- { "tpope/vim-fugitive" },

    -- Interactive git diff and staging tool
    -- {
    --   "sindrets/diffview.nvim",
    --   dependencies = {
    --     "nvim-lua/plenary.nvim",
    --   },
    --   config = require("diffview"),
    -- },

    {
        "RRethy/vim-illuminate",
        -- config = require("vim_illuminate"),
    },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "OXY2DEV/markview.nvim" },
        lazy = false,
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "go",
                "bash",
                "c",
                "cpp",
                "css",
                "go",
                "html",
                "javascript",
                "lua",
                "python",
                "ruby",
                "rust",
                "zig",
                "sql",
                "typescript",
                "yaml",
                "bash",
                "json",
                "markdown",
                "markdown_inline",
                "latex",
                "typst",
                -- "query",
                -- "regex",
                -- "tsx",
                "yaml",
            },
        },
    },

    -- Floating Command Line
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                signature = {
                    enabled = false,
                },
            },
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        -- conf = require("configs/noice")
    },
    -- Zig Language Server
    {
        "ziglang/zig.vim",
        ft = "zig",
        config = function()
            -- Configure zls if needed (check zls documentation for specific options)
            -- Example: vim.g.zig_lamp_zls_auto_install = true
        end,
    },
}
