local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()

require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")



-- local cmp = require("cmp")
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
--
lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
end)

mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls", "tsserver", "rust_analyzer", "angularls", "ansiblels",
		"bashls", "cssls", "dockerls", "docker_compose_language_service",
		"eslint", "gopls", "html", "jsonls", "nginx_language_server",
		"pyright", "sqlls", "tailwindcss", "volar", "zls"
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
		["lua_ls"] = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "Lua 5.1" },
						diagnostics = {
							globals = { "vim", "it", "describe", "before_each", "after_each" },
						}
					}
				}
			}
		end,
	}
})

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function (args)
			require("luasnip").lsp_expand(args.body)
		end
	},
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({select = false})
	}),
})
