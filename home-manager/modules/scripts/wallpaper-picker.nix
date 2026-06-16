# scripts/wallpaper-picker.nix
{pkgs}:
pkgs.writeShellApplication {
  name = "wallpaper-picker";

  runtimeInputs = with pkgs; [
    findutils
    coreutils
    rofi
    awww
  ];

  text = ''
    wall_dir="$HOME/Pictures/wallpapers"

    selected=$(
      find "$wall_dir" -maxdepth 1 -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \
        -o -iname '*.webp' -o -iname '*.gif' -o -iname '*.bmp' \) |
      sort |
      while read -r img; do
        printf "%s\0icon\x1f%s\n" "$(basename "$img")" "$img"
      done |
      rofi -dmenu -i -p "Wallpaper" -show-icons \
        -theme-str '
          listview {
            columns: 3;
            lines: 2;
            flow: horizontal;
          }
          element {
            orientation: vertical;
            padding: 2px;
          }
          element-icon {
            size: 280px;
          }
          element-text {
            enabled: false;
          }
        '
    )

    [ -z "$selected" ] && exit 0

    awww img "$wall_dir/$selected" \
      --transition-type wipe \
      --transition-duration 1
  '';
}
