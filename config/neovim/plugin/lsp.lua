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

	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, {})
end

require("neodev").setup({
  override = function(root_dir, library)
    if root_dir:find("/home/francisco/Nixos", 1, true) == 1 then
      library.enabled = true
      library.plugins = true
    end
  end,
})
-- lspconfig
local lspconfig = require('lspconfig')

-- lua_ls: Lua
lspconfig.lua_ls.setup {
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
}

-- clangd: C
lspconfig.clangd.setup {}

-- nil_ls: Nix
lspconfig.nil_ls.setup{}

-- pyright: Python
lspconfig.pyright.setup{}

-- gopls: Go
lspconfig.gopls.setup{}

-- tsserver: Typescript
lspconfig.tsserver.setup{}
