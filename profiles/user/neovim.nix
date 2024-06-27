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

        {
          plugin = comment-nvim;
          type = "lua";
          config = "require(\"Comment\").setup()";
        }

        {
          plugin = telescope-nvim;
          type = "lua";
          config = builtins.readFile "${configDir}/neovim/plugin/telescope.lua";
        }


        {
          plugin = lualine-nvim;
          type = "lua";
          config = ''  
            require("lualine").setup({
            icons_enabled = true
            })
          '';
        }

        {
          plugin = vim-tmux-navigator;
          type = "lua";
					config = ''
            lazy = false

            vim.keymap.set({ 'n', 't' }, '<A-h>', '<CMD>TmuxNavigateLeft<CR>')
            vim.keymap.set({ 'n', 't' }, '<A-l>', '<CMD>TmuxNavigateRight<CR>')
            vim.keymap.set({ 'n', 't' }, '<A-k>', '<CMD>TmuxNavigateUp<CR>')
            vim.keymap.set({ 'n', 't' }, '<A-j>', '<CMD>TmuxNavigateDown<CR>')
            vim.keymap.set({ 'n', 't' }, '<A-p>', '<CMD>TmuxNavigatePrevious<CR>')
					'';
        }

        {
          plugin = nvim-treesitter.withAllGrammars;
          type = "lua";
          config = builtins.readFile "${configDir}/neovim/plugin/treesitter.lua";
        }
        
      ];

      extraLuaConfig = ''
        ${builtins.readFile "${configDir}/neovim/options.lua"}
      '';
    };
}
