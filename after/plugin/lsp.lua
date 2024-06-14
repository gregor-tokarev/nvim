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
	}
})

local cmp = require("cmp")

cmp.setup({
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({select = false})
	})
})
