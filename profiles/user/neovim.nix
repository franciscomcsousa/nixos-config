{
  configDir,
  pkgs,
  ...
}:
{
  programs.neovim =
    {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      plugins = with pkgs.vimPlugins; [

        comment-nvim
				neo-tree-nvim
        telescope-nvim
        lualine-nvim
        vim-tmux-navigator
				nvim-lspconfig
        nvim-treesitter.withAllGrammars
        gitsigns-nvim     
        nvim-web-devicons   
        alpha-nvim
				luasnip
				nvim-cmp
				cmp_luasnip
				cmp-nvim-lsp
				friendly-snippets
				neodev-nvim
				];

      extraLuaConfig = ''
        ${builtins.readFile "${configDir}/neovim/options.lua"}

        ${builtins.readFile "${configDir}/neovim/plugin/comment.lua"}
				${builtins.readFile "${configDir}/neovim/plugin/lualine.lua"}
				${builtins.readFile "${configDir}/neovim/plugin/lsp.lua"}
        ${builtins.readFile "${configDir}/neovim/plugin/git-signs.lua"}
        ${builtins.readFile "${configDir}/neovim/plugin/navigator.lua"}
				${builtins.readFile "${configDir}/neovim/plugin/neo-tree.lua"}
        ${builtins.readFile "${configDir}/neovim/plugin/telescope.lua"}
        ${builtins.readFile "${configDir}/neovim/plugin/treesitter.lua"}
        ${builtins.readFile "${configDir}/neovim/plugin/web-icons.lua"}
        ${builtins.readFile "${configDir}/neovim/plugin/alpha.lua"}
        ${builtins.readFile "${configDir}/neovim/plugin/cmp.lua"}
      '';

			extraPackages = with pkgs;
			[
				lua-language-server
				clang-tools
				nil
				pyright
			];
		};
}
