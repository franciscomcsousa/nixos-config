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
    let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      plugins = with pkgs.vimPlugins; [
        {
            plugin = comment-nvim;
            config = toLua "require(\"Comment\").setup()";
        }
      ];

      extraLuaConfig = ''
        ${builtins.readFile "${configDir}/neovim/lua/options.lua"}
      '';
    };
}
