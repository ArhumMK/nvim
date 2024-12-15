return { 
    -- Current colour theme, nightfox 
    "EdenEast/nightfox.nvim",
	
	-- ensure it's the first thing loaded and no lazy loading
    lazy = false,
    priority = 1000,
	
    config = function()
	
        -- Configure the nightfox theme
        require('nightfox').setup({
            options = {
                styles = {
                    comments = "italic",
                    keywords = "bold",
                    types = "italic,bold",
                },
            },
        })
        
        -- Apply the nightfox colorscheme on startup
        vim.cmd('colorscheme nightfox')
    end
}
