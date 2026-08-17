{ ... }:
{
  programs.lazygit = {
    enable = true;

    settings.git.pagers = [
      {
        colorArg = "always";
        pager = "delta --dark --paging=never --side-by-side";
      }
      {
        colorArg = "always";
        pager = "delta --dark --paging=never";
      }
    ];
  };
}
