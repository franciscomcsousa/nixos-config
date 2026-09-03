{ configDir, pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      comment-nvim
      neo-tree-nvim
      telescope-nvim
      lualine-nvim
      bufferline-nvim
      vim-tmux-navigator
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      gitsigns-nvim
      git-blame-nvim
      nvim-web-devicons
      alpha-nvim
      luasnip
      nvim-cmp
      cmp_luasnip
      cmp-nvim-lsp
      friendly-snippets
      neodev-nvim
      nvim-autopairs
      lazygit-nvim
      yazi-nvim
      plenary-nvim
      auto-session
      which-key-nvim
      telescope-fzf-native-nvim
      nvim-notify
    ];

    initLua = ''
      ${builtins.readFile "${configDir}/neovim/options.lua"}
      ${builtins.readFile "${configDir}/neovim/keymaps.lua"}

      ${builtins.readFile "${configDir}/neovim/plugin/notify.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/comment.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/lualine.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/bufferline.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/lsp.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/git-blame.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/git-signs.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/navigator.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/neo-tree.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/telescope.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/treesitter.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/web-icons.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/alpha.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/cmp.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/autopairs.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/lazygit.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/yazi.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/auto-session.lua"}
      ${builtins.readFile "${configDir}/neovim/plugin/which-key.lua"}
    '';

    extraPackages = with pkgs; [
      lazygit
      lua-language-server
      clang-tools
      nil
      pyright
      gopls
      typescript
      typescript-language-server
      rust-analyzer
    ];
  };
}
