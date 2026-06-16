# scripts/reload-tmux.nix
{pkgs}:
pkgs.writeShellApplication {
  name = "reload-tmux";

  runtimeInputs = with pkgs; [
    tmux
    rofi
    foot
  ];

  text = ''
    if ! tmux ls >/dev/null 2>&1; then
        tmux start-server

        if [ -f "$HOME/.tmux/resurrect/last" ]; then
            tmux run-shell ${pkgs.tmuxPlugins.resurrect}/share/tmux-plugins/resurrect/scripts/restore.sh
            sleep 1
        fi
    fi
  '';
}
