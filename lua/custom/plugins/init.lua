-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    {
        "kdheepak/lazygit.nvim",
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
	    vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', {desc = 'Lazy[g]it inte[g]ration'})
        end,
    },

}
