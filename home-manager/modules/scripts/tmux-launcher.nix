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
    sessions=$(tmux list-sessions -F "#{session_name}" 2>/dev/null || true)

    selected=$(printf "%s\n" "$sessions" | rofi -dmenu -p "tmux")

    [ -z "$selected" ] && exit 0

    foot tmux new-session -A -s "$selected" &
  '';
}
