{ ... }: {
  programs.yazi = {
    enable = true;
    settings = {
      opener = {
        edit = [{
          run = ''nvim "$@"'';
          block = true;
        }];
        open = [{
          run = ''xdg-open "$@"'';
          desc = "Open";
        }];
      };
    };
    keymap = {
      manager = {
        prepend_keymap = [{
          on = [ "t" ];
          run = ''shell "tmux split-window nvim $0" --confirm'';
          desc = "Open file in new tmux pane";
        }];
      };
    };
  };
}
