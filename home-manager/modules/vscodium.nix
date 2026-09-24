{pkgs, ...}: {
  programs.vscodium = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # ── Themes ────────────────────────────────────────
        enkia.tokyo-night
        # ── Python / Jupyter ──────────────────────────────
        ms-python.python
        ms-python.debugpy
        detachhead.basedpyright
        ms-toolsai.jupyter

        # ── Rust ──────────────────────────────────────────
        rust-lang.rust-analyzer

        # ── C / C++ ──────────────────────────────────────
        llvm-vs-code-extensions.vscode-clangd

        # ── Nix ───────────────────────────────────────────
        jnoortheen.nix-ide

        # ── Vim ───────────────────────────────────────────
        vscodevim.vim

        # ── General ───────────────────────────────────────
        yzhang.markdown-all-in-one
      ];

      userSettings = {
        # ── Keyboard ──────────────────────────────────────
        "keyboard.dispatch" = "keyCode";

        # ── Editor ────────────────────────────────────────
        "editor.fontFamily" = "MapleMonoNF";
        "editor.fontLigatures" = true;
        "editor.fontSize" = 14;
        "editor.tabSize" = 4;
        "editor.lineNumbers" = "relative";
        "editor.insertSpaces" = true;
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "editor.wordWrap" = "on";
        "editor.smoothScrolling" = false;
        "editor.cursorSurroundingLines" = 20;

        # ── Vim ───────────────────────────────────────────
        "vim.vimrc.enable" = false;
        "vim.useSystemClipboard" = true;
        "vim.handleKeys" = {
          "<C-j>" = false;
          "<C-k>" = false;
          "<C-l>" = false;

          "<C-p>" = false;
          "<C-o>" = false;

          "<C-f>" = false;

          "<C-S-p>" = false;

          "<C-`>" = false;

          "<C-b>" = false;

          "<C-s>" = false;

          "<C-w>" = false;

          "<C-y>" = false;

          "<C-g>" = false;
        };

        # ── Files ─────────────────────────────────────────
        "files.autoSave" = "afterDelay";
        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;

        # ── Python ────────────────────────────────────────
        "python.analysis.typeCheckingMode" = "basic";

        # ── Jupyter ───────────────────────────────────────
        "jupyter.askForKernelRestart" = false;

        # ── Git ───────────────────────────────────────────
        "git.autofetch" = true;
        "git.confirmSync" = false;

        # ── Workbench ─────────────────────────────────────
        "workbench.colorTheme" = "Tokyo Night";
        "workbench.startupEditor" = "none";
        "workbench.editor.enablePreview" = false;

        # ── Terminal ──────────────────────────────────────
        "terminal.integrated.scrollback" = 10000;
        "terminal.integrated.fontFamily" = "'MapleMonoNF'";
        "terminal.integrated.fontSize" = 14;
        "terminal.integrated.lineHeight" = 1.2;
        "terminal.integrated.fontLigatures.enables" = true;

        "terminal.integrated.cursorStyle" = "block";
        "terminal.integrated.cursorBlinking" = false;
        "terminal.integrated.curesorStyleInactive" = "line";

        # ── Keystrokes ────────────────────────────────────
        "vim.leader" = " ";

        "vim.normalModeKeyBindingsNonRecursive" = [
          # ─────────────────────────────────────────────
          # Files
          # ─────────────────────────────────────────────

          {
            before = ["<leader>" "f" "f"];
            commands = ["workbench.action.quickOpen"];
          }

          {
            before = ["<leader>" "f" "s"];
            commands = ["workbench.action.findInFiles"];
          }

          {
            before = ["<leader>" "f" "b"];
            commands = ["workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup"];
          }

          # ─────────────────────────────────────────────
          # Symbols
          # ─────────────────────────────────────────────

          {
            before = ["<leader>" "s" "s"];
            commands = ["workbench.action.gotoSymbol"];
          }

          {
            before = ["<leader>" "s" "w"];
            commands = ["workbench.action.showAllSymbols"];
          }

          # ─────────────────────────────────────────────
          # LSP / Code navigation
          # ─────────────────────────────────────────────

          {
            before = ["<leader>" "d"];
            commands = ["editor.action.revealDefinition"];
          }

          {
            before = ["<leader>" "r"];
            commands = ["editor.action.goToReferences"];
          }

          {
            before = ["<leader>" "i"];
            commands = ["editor.action.goToImplementation"];
          }

          {
            before = ["<leader>" "t"];
            commands = ["editor.action.goToTypeDefinition"];
          }

          {
            before = ["<leader>" "n"];
            commands = ["editor.action.rename"];
          }

          # ─────────────────────────────────────────────
          # Terminal
          # ─────────────────────────────────────────────

          {
            before = ["<leader>" "t" "t"];
            commands = ["workbench.action.terminal.toggleTerminal"];
          }

          {
            before = ["<leader>" "t" "n"];
            commands = ["workbench.action.terminal.new"];
          }

          {
            before = ["<leader>" "t" "f"];
            commands = ["workbench.action.terminal.focus"];
          }

          # ─────────────────────────────────────────────
          # Save / close
          # ─────────────────────────────────────────────

          {
            before = ["<leader>" "w"];
            commands = ["workbench.action.files.save"];
          }

          {
            before = ["<leader>" "q"];
            commands = ["workbench.action.closeActiveEditor"];
          }
        ];
      };
    };
  };
}
