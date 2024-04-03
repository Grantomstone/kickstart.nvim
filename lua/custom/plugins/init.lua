-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    {
        "kdheepak/lazygit.nvim",
        name = "lazygit",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
        keys = {
            { "<leader>gc", "<cmd>LazyGit<cr>", desc = "[G]it [C]ommit" }
        },
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            create_autocmd = false,
        },
        config = function()
            require("barbecue.ui").toggle(true)

            vim.api.nvim_create_autocmd({
                    "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
                    "BufWinEnter",
                    "CursorHold",
                    "InsertLeave",

                    -- include this if you have set `show_modified` to `true`
                    "BufModifiedSet",
                },
                {
                    group = vim.api.nvim_create_augroup("barbecue.updater", {}),
                    callback = function()
                        require("barbecue.ui").update()
                    end,
                })
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        keys = {
            { "<leader>ta", function() require("trouble").toggle() end,                        desc = "[T]oggle [A]ll Diagnostics" },
            { "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end, desc = "[T]oggle [W]orkspace Diagnostics" },
            { "<leader>td", function() require("trouble").toggle("document_diagnostics") end,  desc = "[T]oggle [D]ocuemnt Diagnostics" },
            { "<leader>tq", function() require("trouble").toggle("quickfix") end,              desc = "[T]oggle [Q]uickfixes" },
            { "<leader>tl", function() require("trouble").toggle("loclist") end,               desc = "[T]oggle [L]ocallist" },
            { "<leader>cr", function() require("trouble").toggle("lsp_references") end,        desc = "[C]ode [R]eference below cursor" },
        },
    },
    {
        "folke/neodev.nvim",
        opts = {},
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                -- Customize or remove this keymap to your liking
                "<leader>fb",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "",
                desc = "[F]ormat [B]uffer",
            },
        },
        -- Everything in opts will be passed to setup()
        opts = {
            -- Define your formatters
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                c = { "clang-format" },
                cpp = { "clang-format" },
            },
            -- Set up format-on-save
            format_on_save = { timeout_ms = 500, lsp_fallback = true },
            -- Customize formatters
            formatters = {
                shfmt = {
                    prepend_args = { "-i", "2" },
                },
            },
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>fo", "<cmd>Neotree position=current<cr>", desc = "[F]iletree [O]pen" },
            { "<leader>fc", "<cmd>Neotree close<cr>",            desc = "[F]iletree [C]lose" },
        },
    },
    {
        'akinsho/git-conflict.nvim',
        version = "1.*",
        config = true,
    },
}
