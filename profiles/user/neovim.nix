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
      ];

      extraLuaConfig = ''
        ${builtins.readFile "${configDir}/neovim/options.lua"}
      '';
    };
}
