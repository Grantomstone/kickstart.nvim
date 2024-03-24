-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    {
        "kdheepak/lazygit.nvim",
        name ="lazygit",
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
	lazy = false,
	config = function()
            require("telescope").load_extension("lazygit")
	    vim.keymap.set('n', '<leader>gc', '<cmd>LazyGit<cr>', {desc = '[G]it [C]ommit'})
        end,
    },
        {
        "SmiteshP/nvim-navic",
        name = "nvim-navic",
        dependencies = {
            "neovim/nvim-lspconfig"
        },
        config = function()
            local navic = require("nvim-navic")
            local on_attach = function(client, bufnr)
            if client.server_capabilities.documentSymbolProvider then
                navic.attach(client, bufnr)
            end
            end

        require("lspconfig").clangd.setup {
            on_attach = on_attach
        }
        end,
    },
        {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
        },
        config = function()
            require("barbecue.ui").toggle()
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

}
