{
  config,
  configDir,
  lib,
  pkgs,
  user,
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
      '';

      extraPackages = with pkgs;
      [
        lua-language-server
      ];
    };
}
