return {
	"nvim-lualine/lualine.nvim",
	config= function()
	require('lualine').setup({
        options = {
    theme = 'onedark',
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
    },
	})
	end
}
