{ pkgs, ... }: {
    services.swayosd = {
    	enable = true;
	topMargin = 0.9;
    };

    wayland.windowManager.sway = {
    	enable = true;
	wrapperFeatures.gtk = true;
	config = rec {
	    modifier = "Mod4";
	    terminal = "foot";
	    menu = "rofi -show drun";

	    input = {
	        "type:touchpad" = {
		   tap = "enabled";
		   natural_scroll = "disabled";
		   dwt = "enabled";
		};
	    };

	    keybindings = let mod = "Mod4";
	    in {
	    	"${mod}+Return" = "exec foot";
	    	"${mod}+r" = "exec rofi -show drun";
	    	"${mod}+q" = "kill";

		# focus
	    	"${mod}+h" = "focus left";
	    	"${mod}+j" = "focus down";
	    	"${mod}+k" = "focus up";
	    	"${mod}+l" = "focus right";

		# move windows
	    	"${mod}+Shift+h" = "move left";
	    	"${mod}+Shift+j" = "move down";
	    	"${mod}+Shift+k" = "move up";
	    	"${mod}+Shift+l" = "move right";

		# workspaces
	    	"${mod}+1" = "workspace number 1";
	    	"${mod}+2" = "workspace number 2";
	    	"${mod}+3" = "workspace number 3";
	    	"${mod}+4" = "workspace number 4";
	    	"${mod}+5" = "workspace number 5";
	    	"${mod}+6" = "workspace number 6";
	    	"${mod}+7" = "workspace number 7";
	    	"${mod}+8" = "workspace number 8";
	    	"${mod}+9" = "workspace number 9";
	    	"${mod}+0" = "workspace number 0";

	    	"${mod}+Shift+1" = "move container to workspace number 1";
	    	"${mod}+Shift+3" = "move container to workspace number 3";
	    	"${mod}+Shift+4" = "move container to workspace number 4";
	    	"${mod}+Shift+5" = "move container to workspace number 5";
	    	"${mod}+Shift+6" = "move container to workspace number 6";
	    	"${mod}+Shift+7" = "move container to workspace number 7";
	    	"${mod}+Shift+8" = "move container to workspace number 8";
	    	"${mod}+Shift+9" = "move container to workspace number 9";
	    	"${mod}+Shift+0" = "move container to workspace number 0";

		# layout
		"${mod}+f" = "fullscreen toggle";

	        # Audio Volume Controls (Sink - Output)
	        "XF86AudioRaiseVolume" = "exec swayosd-client --output-volume raise";
	        "XF86AudioLowerVolume" = "exec swayosd-client --output-volume lower";
	        "XF86AudioMute" = "exec swayosd-client --output-volume mute-toggle";
		
	        # Microphone Volume Control (Source - Input)
	        "XF86AudioMicMute" = "exec swayosd-client --input-volume mute-toggle";
		
	        # Caps Lock
	        "--release Caps_Lock" = "exec swayosd-client --caps-lock";
		
	        # Brightness Controls
	        "XF86MonBrightnessUp" = "exec swayosd-client --brightness raise";
	        "XF86MonBrightnessDown" = "exec swayosd-client --brightness lower";
		
	        # Media Player Controls
	        "XF86AudioPlay" = "exec swayosd-client --playerctl play-pause";
	        "XF86AudioNext" = "exec swayosd-client --playerctl next";
	        "XF86AudioPrev" = "exec swayosd-client --playerctl prev";
	    };

	    # swap caps and esc
	    input."*" = {
	        xkb_options = "caps:swapescape";
	    };

	    gaps = {
	        inner = 8;
		outer = 4;
	    };

	    window.border = 2;

	    # waybar
	    bars = [];
	    startup = [
	        { command = "waybar"; }
	    ];
	};
    };
}
