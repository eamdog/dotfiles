# i3 config file (v4)
#
# Please see http://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4
set $alt Mod1

# font -misc-fixed-medium-r-normal--10-
font pango: DejaVu Sans Mono, Terminus 8

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

focus_follows_mouse no

# start a terminal
bindsym $mod+Return exec urxvt

# Bindings for Lenovo Multi-Function Mouse M300
# Special button + left click
bindsym $alt+Tab scratchpad show
bindsym --whole-window $mod+c kill
# Special button + moving pointer down
# bindsym $alt+F4 

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# scratchpad
bindsym $mod+Shift+z move scratchpad
bindsym $mod+z scratchpad show

# switch to workspace
bindsym F1 workspace 1
bindsym F2 workspace 2
bindsym F3 workspace 3
bindsym F4 workspace 4
bindsym F5 workspace 5
bindsym F6 workspace 6
bindsym F7 workspace 7
bindsym F8 workspace 8

# change backlight brightness
bindsym $mod+Shift+d exec light -s acpi_video0 -U 1
bindsym $mod+Shift+f exec light -s acpi_video0 -A 1

# move focused container to workspace
bindsym $mod+F1 move container to workspace 1
bindsym $mod+F2 move container to workspace 2
bindsym $mod+F3 move container to workspace 3
bindsym $mod+F4 move container to workspace 4
bindsym $mod+F5 move container to workspace 5
bindsym $mod+F6 move container to workspace 6
bindsym $mod+F7 move container to workspace 7
bindsym $mod+F8 move container to workspace 8

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"



# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
	#mode hide
	#modifier $mod
        status_command i3status --config ~/.config/i3status/config
        tray_output primary
}

new_window pixel 1
hide_edge_borders both
bindsym $mod+shift+x exec i3lock -u -i ~/Pictures/bs.png -f

# amixer (ALSA) hotkeys
bindsym XF86AudioRaiseVolume exec --no-startup-id amixer set Master 5%+
bindsym XF86AudioLowerVolume exec --no-startup-id amixer set Master 5%-
bindsym XF86AudioMute exec --no-startup-id amixer -c 0 cset numid=14 toggle

exec_always feh --bg-scale /home/william/Pictures/Wallpaper.jpg

# workspace assignment (use "xprop")
assign [class="^Google-chrome$"] 2
assign [class="^URxvt$" instance="^main"] 1
assign [class="^Pcmanfm$"] 4

for_window [class="^URxvt$" instance="^scratchpad$"] border 1pixel; move scratchpad

# autostart
exec urxvt -name scratchpad -e bash
exec urxvt -name main1 -e bash 
exec urxvt -name main2 -e bash 
exec pcmanfm
exec --no-startup-id clipit -d
exec google-chrome
