-- plugins/lsp.lua

return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- Setup mason-lspconfig
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd" }, -- Mason uses old names
				automatic_installation = true,
			})

			-- Capabilities for nvim-cmp
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			if cmp_ok then
				capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
			end

			-- on_attach function
			local on_attach = function(_, bufnr)
				local map = function(mode, lhs, rhs)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
				end

				map("n", "gd", vim.lsp.buf.definition)
				map("n", "K", vim.lsp.buf.hover)
				map("n", "<leader>rn", vim.lsp.buf.rename)
				map("n", "<leader>ca", vim.lsp.buf.code_action)
				map("n", "gr", vim.lsp.buf.references)
				map("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end)
			end

			-- Setup servers using new API
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
				ts_ls = {}, -- New name for tsserver
				pyright = {},
				clangd = {},
       basedpyright = {},
			}

			for name, config in pairs(servers) do
				config.on_attach = on_attach
				config.capabilities = capabilities
				vim.lsp.config(name, config)
				vim.lsp.enable(name)
			end
		end,
	},
}
