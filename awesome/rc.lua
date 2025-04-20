-- If LuaRocks is installed, make sure that packages installed through it are
-- Load external configuration files
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

-- Bug Fixes
package.loaded["naughty.dbus"] = {}

-- Error Handling
require("config_files.error_handling")


-- Variable Definition
wallpaper = "/home/enviction/.config/awesome/wall.png"
beautiful.init("/home/enviction/.config/awesome/Themes/theme1.lua")
beautiful.font = "FiraCode Nerd Font Mono 8"

terminal = "kitty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"
raise_volume_cmd = "pactl set-sink-volume @DEFAULT_SINK@ +5%"
lower_volume_cmd = "pactl set-sink-volume @DEFAULT_SINK@ -5%"


-- Menu
require("config_files.menu")

-- Layouts
require("config_files.layouts")

mykeyboardlayout = awful.widget.keyboardlayout()

-- Wibar
require("config_files.wibar")

-- Key Bindings
require("config_files.Keys.mouse")
require("config_files.Keys.global_keys")
require("config_files.Keys.client_keys")
require("config_files.Keys.tag_keys")
require("config_files.Keys.window_mouse")
require("config_files.Keys.custom_keys")
root.keys(globalkeys)

-- Rules
require("config_files.rules")

-- Signals
require("config_files.signals")

-- Autostart applications
require("config_files.autostart")
