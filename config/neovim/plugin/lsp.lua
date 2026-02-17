local on_attach = function(_, bufnr)
	local bufmap = function(keys, func)
		vim.keymap.set('n', keys, func, { buffer = bufnr })
	end

	bufmap('<leader>r', vim.lsp.buf.rename)
	bufmap('<leader>a', vim.lsp.buf.code_action)

	bufmap('gd', vim.lsp.buf.definition)
	bufmap('gD', vim.lsp.buf.declaration)
	bufmap('gi', vim.lsp.buf.implementation)
	bufmap('<leader>D', vim.lsp.buf.type_definition)

	bufmap('gr', require('telescope.builtin').lsp_references)
	bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
	bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

	bufmap('K', vim.lsp.buf.hover)

	bufmap('<leader>i', function()
		vim.lsp.buf.format { async = true }
	end)

	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require("neodev").setup({
	override = function(root_dir, library)
		if root_dir:find("/home/francisco/Nixos", 1, true) == 1 then
			library.enabled = true
			library.plugins = true
		end
	end,
})
-- lspconfig
vim.lsp.enable({
	servers = {
		"lua_ls",
		"clangd",
		"nil_ls",
		"pyright",
		"gopls",
		"ts_ls",
	},
})

-- lua_ls: Lua
vim.lsp.config("lua_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = function()
		return vim.loop.cwd()
	end,
	cmd = { "lua-language-server" },
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	}
})

-- clangd: C
vim.lsp.config("clangd", {
	capabilities = capabilities,
	on_attach = on_attach
})

-- nil_ls: Nix
vim.lsp.config("nil_ls", {
	capabilities = capabilities,
	on_attach = on_attach
})

-- pyright: Python
vim.lsp.config("pyright", {
	capabilities = capabilities,
	on_attach = on_attach
})
-- gopls: Go
vim.lsp.config("gopls", {
	capabilities = capabilities,
	on_attach = on_attach
})

-- tsserver: Typescript
vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	on_attach = on_attach
})