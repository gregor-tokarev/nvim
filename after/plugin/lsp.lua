require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")

local servers = {
    "lua_ls", "tsserver", "rust_analyzer", "angularls", "ansiblels",
    "bashls", "cssls", "dockerls", "docker_compose_language_service",
    "eslint", "gopls", "html", "jsonls", "nginx_language_server",
    "pyright", "sqlls", "tailwindcss", "volar", "zls"
}

mason_lspconfig.setup({
    ensure_installed = servers
})

local lspconfig = require("lspconfig")
for _, ls in ipairs(servers) do
    lspconfig[ls].setup{}
end

