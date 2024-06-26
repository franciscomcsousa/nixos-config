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
          plugin = tokyonight-nvim;
          config = "colorscheme tokyonight-night";
        }

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
      ];

      extraLuaConfig = ''
        ${builtins.readFile "${configDir}/neovim/options.lua"}
      '';
    };
}
