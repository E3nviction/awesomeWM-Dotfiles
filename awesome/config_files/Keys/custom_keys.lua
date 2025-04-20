local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")


-- Global Custom Binds
globalkeys = awful.util.table.join(globalkeys,
    --MULTIMEDIA KEYS
    awful.key({        }, "XF86AudioRaiseVolume", function () awful.util.spawn(raise_volume_cmd) end,
                  {description = "Vol up", group = "enviction"}),
    awful.key({        }, "XF86AudioLowerVolume", function () awful.util.spawn(lower_volume_cmd) end,
                  {description = "Vol Down", group = "enviction"}),
    awful.key({ modkey }, "space",
              function ()
                  awful.util.spawn("rofi -show drun -theme /home/enviction/.config/rofi/launchers/type-6/style-4.rasi")
              end,
              {description = "show the app launcher", group = "enviction"}),
    awful.key({ modkey }, "l",
              function ()
                  awful.util.spawn(
                  "betterlockscreen -l"
                  )end,
                  {description = "lock screen", group = "enviction"}),
    awful.key({ modkey, "Shift" }, "l",
              function ()
                  awful.util.spawn(
                  "rofi -show power-menu -modi power-menu:rofi-power-menu -theme /home/enviction/.config/rofi/powermenu/type-1/style-2.rasi"
                  )end,
                  {description = "show the system launcher", group = "enviction"}),
    awful.key({ modkey, "Shift" }, "+",
              function ()
                  beautiful.useless_gap = beautiful.useless_gap + 1
                  for s in screen do
                      for _, t in pairs(s.tags) do
                          t:emit_signal("property::layout")
                      end
                  end
              end,
              {description = "increase useless gap", group = "enviction"}),
    awful.key({ modkey, "Shift" }, "-",
              function ()
                  beautiful.useless_gap = beautiful.useless_gap - 1
                  for s in screen do
                      for _, t in pairs(s.tags) do
                          t:emit_signal("property::layout")
                      end
                  end
              end,
              {description = "lower useless gap", group = "enviction"}),
    awful.key({ modkey, "Shift" }, "#",
              function ()
                  local new_border_width = beautiful.border_width == 1 and 0 or 1
                  for _, c in ipairs(client.get()) do
                      if c.class ~= "Polybar" then
                          c.border_width = new_border_width
                      end
                  end
                  beautiful.border_width = new_border_width
              end,
              {description = "toggle border width", group = "enviction"}),
    awful.key({ modkey, "Shift" }, ".",
              function ()
                  awful.spawn.with_shell("~/.config/scripts/change_picom_radius.sh")
              end,
              {description = "toggle rounded corners", group = "enviction"}),
    awful.key({ modkey, "Shift" }, ",",
              function ()
                  awful.spawn.with_shell("~/.config/scripts/change_picom_blur.sh")
              end,
              {description = "toggle blur and opacity", group = "enviction"}),
    awful.key({ modkey, "Shift" }, "p",
              function ()
                  awful.spawn.with_shell("pgrep -x 'polybar' > /dev/null && pkill polybar || (polybar)")
              end,
              {description = "toggle polybar", group = "enviction"})
)

clientkeys = awful.util.table.join(clientkeys,
    awful.key({ modkey }, 'b',
              function(c)
                  awful.titlebar.toggle(c)
              end,
              {description = 'toggle title bar', group = 'enviction'}),
    awful.key({ modkey, "Shift", "Control" }, ".",
              function ()
                  awful.spawn.with_shell("~/.config/scripts/set_rounded_corners_zero.sh")
              end,
              {description = "toggle rounded corners for focused window", group = "enviction"})
)
