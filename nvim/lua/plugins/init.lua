return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
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
                "sql",
                "typescript",
                "yaml",
                -- "html",
                -- "css",
                -- "bash",
                -- "html",
                -- "javascript",
                -- "json",
                -- "markdown",
                -- "markdown_inline",
                -- "python",
                -- "query",
                -- "regex",
                -- "tsx",
                -- "typescript",
                -- "yaml",
            },
        },
    },

    -- Floating Command Line
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
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
}
