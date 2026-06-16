{pkgs, ...}: {
  programs.nvf = {
    enable = true;

    settings.vim = {
      # aliases
      viAlias = false;
      vimAlias = true;

      # main vim options
      lineNumberMode = "relNumber";
      syntaxHighlighting = true;
      clipboard = {
        enable = true;
        providers.wl-copy.enable = true;
      };

      opts = {
        scrolloff = 999;
        cursorline = true;
        shiftwidth = 4;
        tabstop = 4;
        expandtab = true;
        wrap = false;
        undofile = true;
      };

      globals.mapleader = " ";

      # theming
      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
        transparent = true;
      };

      statusline.lualine = {
        enable = true;
        theme = "auto";
      };

      dashboard.startify.enable = true;

      telescope.enable = true;
      navigation.harpoon.enable = true;

      languages = {
        enableTreesitter = true;
        enableFormat = true;
        enableExtraDiagnostics = true;

        lua.enable = true;
        nix.enable = true;
        bash.enable = true;
        python.enable = true;
        rust.enable = true;
        markdown.enable = true;
      };

      lsp = {
        enable = true;
        formatOnSave = true;
        lightbulb.enable = true;
        lspSignature.enable = true;
        trouble.enable = true;
        lspsaga.enable = false;
      };

      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;
      autopairs.nvim-autopairs.enable = true;

      visuals = {
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        fidget-nvim.enable = true;
        highlight-undo.enable = true;
        indent-blankline.enable = true;
        nvim-scrollbar.enable = false;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false;
        neogit.enable = true;
      };

      binds.whichKey.enable = true;

      extraPlugins = {
        fugitive = {
          package = pkgs.vimPlugins.vim-fugitive;
          setup = "";
        };

        colorizer = {
          package = pkgs.vimPlugins.nvim-colorizer-lua;
          setup = ''require("colorizer").setup()'';
          after = ["tokyonight-nvim"];
        };

        undotree = {
          package = pkgs.vimPlugins.undotree;
          setup = "";
        };
      };

      # keybinds

      maps = {
        # -- general (normal) -------------------------------------------------
        normal = {
          "<leader>cd" = {
            action = "<cmd>Ex<CR>";
            desc = "Open netrw";
            silent = true;
          };
          "Q" = {
            action = "<nop>";
            desc = "Disable Ex mode";
            silent = true;
          };
          "<C-c>" = {
            action = "<Esc>";
            desc = "Exit insert alt";
            silent = true;
          };

          # centred scrolling
          "<C-d>" = {
            action = "<C-d>zz";
            desc = "Scroll down centred";
            silent = true;
          };
          "<C-u>" = {
            action = "<C-u>zz";
            desc = "Scroll up centred";
            silent = true;
          };

          # centred search navigation
          "n" = {
            action = "nzzzv";
            desc = "Next result centred";
            silent = true;
          };
          "N" = {
            action = "Nzzzv";
            desc = "Prev result centred";
            silent = true;
          };

          # join lines without moving cursor
          "J" = {
            action = "mzJ\`z";
            desc = "Join lines keep cursor";
            silent = true;
          };

          # quickfix list
          "<C-k>" = {
            action = "<cmd>cnext<CR>zz";
            desc = "Quickfix next";
            silent = true;
          };
          "<C-j>" = {
            action = "<cmd>cprev<CR>zz";
            desc = "Quickfix prev";
            silent = true;
          };

          # location list
          "<leader>k" = {
            action = "<cmd>lnext<CR>zz";
            desc = "LocList next";
            silent = true;
          };
          "<leader>j" = {
            action = "<cmd>lprev<CR>zz";
            desc = "LocList prev";
            silent = true;
          };

          # make file executable
          "<leader>x" = {
            action = "<cmd>!chmod +x %<CR>";
            desc = "chmod +x";
            silent = true;
          };

          # reload config
          "<leader>rl" = {
            action = "<cmd>source $MYVIMRC<CR>";
            desc = "Reload config";
            silent = true;
          };

          # source current file
          "<leader><leader>" = {
            action = "<cmd>source %<CR>";
            desc = "Source file";
            silent = true;
          };

          # replace word under cursor on current line
          "<leader>s" = {
            action = '':%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>'';
            desc = "Replace word on line";
          };

          # undotree
          "<leader>u" = {
            action = "<cmd>UndotreeToggle<CR>";
            desc = "Undotree";
            silent = true;
          };

          # LSP keybinds (set here for discoverability; LspAttach block below
          # does the actual buffer-local mapping so they only fire with a server)
          "K" = {
            action = "<cmd>lua vim.lsp.buf.hover()<CR>";
            desc = "Hover docs";
            silent = true;
          };
          "gd" = {
            action = "<cmd>lua vim.lsp.buf.definition()<CR>";
            desc = "Go to definition";
            silent = true;
          };
          "gD" = {
            action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
            desc = "Go to declaration";
            silent = true;
          };
          "gi" = {
            action = "<cmd>lua vim.lsp.buf.implementation()<CR>";
            desc = "Go to impl";
            silent = true;
          };
          "go" = {
            action = "<cmd>lua vim.lsp.buf.type_definition()<CR>";
            desc = "Go to type def";
            silent = true;
          };
          "gr" = {
            action = "<cmd>lua vim.lsp.buf.references()<CR>";
            desc = "References";
            silent = true;
          };
          "gs" = {
            action = "<cmd>lua vim.lsp.buf.signature_help()<CR>";
            desc = "Signature help";
            silent = true;
          };
          "gl" = {
            action = "<cmd>lua vim.diagnostic.open_float()<CR>";
            desc = "Diagnostic float";
            silent = true;
          };
          "<F2>" = {
            action = "<cmd>lua vim.lsp.buf.rename()<CR>";
            desc = "Rename symbol";
            silent = true;
          };
          "<F3>" = {
            action = "<cmd>lua vim.lsp.buf.format()<CR>";
            desc = "Format";
            silent = true;
          };
          "<F4>" = {
            action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
            desc = "Code action";
            silent = true;
          };
        };

        # -- visual (v) -------------------------------------------------------
        visual = {
          "J" = {
            action = ":m '>+1<CR>gv=gv";
            desc = "Move block down";
            silent = true;
          };
          "K" = {
            action = ":m '<-2<CR>gv=gv";
            desc = "Move block up";
            silent = true;
          };

          "<leader>y" = {
            action = ''"+y'';
            desc = "Yank to clipboard";
            silent = true;
          };

          # <F3> format in visual/select mode
          "<F3>" = {
            action = "<cmd>lua vim.lsp.buf.format()<CR>";
            desc = "Format";
            silent = true;
          };
        };

        # -- visual-only / x mode (paste without clobbering register) ---------
        visualOnly = {
          "<leader>p" = {
            action = ''"_dP'';
            desc = "Paste no clobber";
            silent = true;
          };
        };

        # -- insert ------------------------------------------------------------
        insert = {
          "<C-c>" = {
            action = "<Esc>";
            desc = "Exit insert";
            silent = true;
          };
        };
      };

      # ── Lua config for plugins that need closure-style setup ───────────────
      # Appended verbatim after all nvf-generated Lua. Order matters:
      # extraPlugins load before luaConfigRC runs.
      luaConfigRC = {
        # ---- telescope keybinds --------------------------------------------
        telescope-keybinds =
          /*
          lua
          */
          ''
            local tb = require("telescope.builtin")

            vim.keymap.set("n", "<leader>ff", tb.find_files,                        { desc = "Find files" })
            vim.keymap.set("n", "<leader>fg", tb.git_files,                         { desc = "Git files" })
            vim.keymap.set("n", "<leader>fr", tb.oldfiles,                          { desc = "Recent files" })
            vim.keymap.set("n", "<leader>fq", tb.quickfix,                          { desc = "Quickfix" })
            vim.keymap.set("n", "<leader>fh", tb.help_tags,                         { desc = "Help tags" })
            vim.keymap.set("n", "<leader>fb", tb.buffers,                           { desc = "Buffers" })
            vim.keymap.set("n", "<leader>fs", tb.grep_string,                       { desc = "Grep word" })
            vim.keymap.set("n", "<leader>fc", function()
              tb.live_grep({ default_text = vim.fn.fnamemodify(vim.fn.expand("%"), ":t:r") })
            end, { desc = "Grep filename" })
          '';

        # ---- harpoon keybinds ----------------------------------------------
        harpoon-keybinds =
          /*
          lua
          */
          ''
            local harpoon = require("harpoon")

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
              { desc = "Harpoon add" })
            vim.keymap.set("n", "<leader>fa", function()
              harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Harpoon menu" })
            vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end,
              { desc = "Harpoon prev" })
            vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end,
              { desc = "Harpoon next" })
          '';
      };

      luaConfigRC.extraConfig = ''
        -- your custom lua here
      '';
    };
  };
}
