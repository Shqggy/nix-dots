{
  programs.lapce = {
    enable = true;
    channel = "stable";
    keymaps = [ ];
    settings = {
      core = {
        modal = true; # vi keys
        color-theme = "Lapce Dark";
      };
      editor = {
        font-family = "Maplemono NF, monospace";
        font-size = 14;
        line-height = 1.5;
        tab-width = 4;
        cursor-surrounding-lines = 5;
        bracket-pair-colorization = true;
        highlight-matching-brackets = true;
        render-whitespace = "boundary";
        format-on-save = true;
        auto-closing-matching-pairs = true;
      };
      ui = {
        font-family = "MapleMono NF, monospace";
        font-size = 13;
      };
    };
  };
}
