local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

local separator = { "--------------------" }

-- Create a launcher widget and a main menu
beautiful.font = "FiraCode Nerd Font Mono 10"
myawesomemenu = {
   { " Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { " Manual", "kitty -e man awesome" },
   { " Edit config", "kitty -e sudo gedit /home/enviction/.config/awesome/rc.lua" },
   { " Restart AWM", awesome.restart },
   separator,
   { "󰿅 Quit", function() awesome.quit() end },
}

-- Sub Menu for Awesome option.
beautiful.menu_height=20
beautiful.menu_width=200

mymainmenu = awful.menu({ items = { { " Awesome", myawesomemenu},
                                    { " Terminal", terminal},
                                    { "󰖟 Browser", "brave-browser"},
                                    { " Files", "nautilus"},
                                    separator,
                                    { "󰍃 Log out", function() awesome.quit() end },
        			    { "⏾ Sleep", "systemctl suspend" },
        			    { " Restart", "systemctl reboot" },
        			    { "⏻ Power off", "systemctl poweroff" },
        			    separator,
        			    { "󰸉 Wallpaper", "nitrogen"},
        			    { " Settings", "lxappearance" },
                                  }
                        })
beautiful.font = "FiraCode Nerd Font Mono 8"

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

