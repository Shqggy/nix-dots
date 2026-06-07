{ ... }:
{
  programs.nvf = {
    enable = true;

    settings.vim = {
      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
      };

      # Basics
      lineNumberMode = "relNumber";

      # LSP
      lsp = {
        enable = true;
        formatOnSave = true;
      };

      # Language support — add whatever you need
      languages = {
        nix.enable = true;
        python.enable = true;
        # etc.
      };

      # Treesitter
      treesitter.enable = true;

      # Statusline, telescope, etc.
      statusline.lualine.enable = true;
      telescope.enable = true;
      filetree.nvimTree.enable = true;

      # Any raw Lua config
      luaConfigRC.extraConfig = ''
        -- your custom lua here
      '';
    };
  };
}
