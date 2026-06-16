# scripts/tmux-rofi.nix
{pkgs}:
pkgs.writeShellApplication {
  name = "tmux-launcher";

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




    sessions=$(tmux list-sessions -F "#{session_name}" 2>/dev/null || true)

    selected=$(printf "%s\n" "$sessions" | rofi -dmenu -p "tmux")

    [ -z "$selected" ] && exit 0

    foot tmux new-session -A -s "$selected" &
  '';
}
