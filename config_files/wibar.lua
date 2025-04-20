local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local colors = {
    disabled = "#AAAAAA",
    background = "#222222"
}

local function custom_taglist(s)
    return awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        layout  = {
            spacing = 5,
            layout  = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        {
                            id     = 'index_role',
                            widget = wibox.widget.textbox,
                        },
                        margins = 4,
                        widget  = wibox.container.margin
                    },
                    bg     = '#dddddd',
                    shape  = gears.shape.circle,
                    widget = wibox.container.background,
                },
                margins = 2,
                widget  = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
        },
        buttons = gears.table.join(
            awful.button({}, 1, function(t) t:view_only() end),
            awful.button({}, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 1, function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end),
            awful.button({ modkey }, 3, function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end),
            awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
            awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
        )
    }
end


-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

-- draw wallpaper
local gears = require("gears")
local beautiful = require("beautiful")

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)
                           ))
    s.mytaglist=awful.widget.taglist{
         screen=s,
         filter=awful.widget.taglist.filter.all,
         buttons=taglist_buttons
    }
    -- Create a tasklist widget
    s.mytasklist=awful.widget.tasklist{
         screen=s,
         filter=awful.widget.tasklist.filter.currenttags,
         buttons=tasklist_buttons
    }
    
    --s.mywibar = awful.wibar({
    --    screen = s,
    --    width = s.geometry.width * 0.9,  -- 90% of screen width
    --    height = dpi(35),
    --    shape = gears.shape.rounded_rect,
    --    bg = beautiful.bg_normal .. "AA",  -- Add transparency with "AA"
    --    ontop = true,  -- Make it float above other windows
    --    visible = true,
    --    position = "top",  -- Position at the top of the screen
    --})

    -- Adjust wibar position to center it horizontally
    --local wibar_x = (s.geometry.width - s.mywibar.width) / 2
    --s.mywibar:geometry({ x = wibar_x, y = dpi(10) })
    
    --[[ Create the wibox
    s.mywibox = awful.wibar({
    	height = dpi(25),
    	position = "top",
    	screen = s
    })
    --s.mywibar:geometry({ y = dpi(10) })
    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        -- Left widgets
        {
        layout = wibox.layout.fixed.horizontal,
        },
        -- Middle widgets
        {
        layout = wibox.layout.fixed.horizontal,
        custom_taglist(s),
        },
        -- Right widgets
        {
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
        mytextclock,
        s.mylayoutbox,
        },
    }
    --]]
end)



