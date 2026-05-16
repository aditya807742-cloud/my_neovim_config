-- lua/plugins/rose-pine.lua
return {
	"rose-pine/neovim",
--	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme habamax")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.cmd [[
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE
]]
	end
}
