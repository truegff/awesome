---
-- Created by IntelliJ IDEA.
-- User: alexander
-- Date: 2/15/12
-- Time: 5:54 PM
-- To change this template use File | Settings | File Templates.
--
-- Create a wibox for each screen and add it

-- thing on top
mywibox = {}
-- thing at bottom
myinfobox = {}

mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons =
  awful.util.table.join(
    awful.button({}, 1, awful.tag.viewonly),
    awful.button({ modkey }, 1, awful.client.movetotag),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, awful.client.toggletag),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
  )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(awful.button({}, 1, function(c)
  if c == client.focus then
    c.minimized = true
  else
    if not c:isvisible() then
      awful.tag.viewonly(c:tags()[1])
    end
    -- This will also un-minimize
    -- the client, if needed
    client.focus = c
    c:raise()
  end
end),
  awful.button({}, 3, function()
    if instance then
      instance:hide()
      instance = nil
    else
      instance = awful.menu.clients({ width = 250 })
    end
  end),
  awful.button({}, 4, function()
    awful.client.focus.byidx(1)
    if client.focus then client.focus:raise() end
  end),
  awful.button({}, 5, function()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
  end))

for s = 1, screen.count() do
  -- Create a promptbox for each screen
  mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
  -- Create an imagebox widget which will contains an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  mylayoutbox[s] = awful.widget.layoutbox(s)
  mylayoutbox[s]:buttons(awful.util.table.join(awful.button({}, 1, function() awful.layout.inc(layouts, 1) end),
    awful.button({}, 3, function() awful.layout.inc(layouts, -1) end),
    awful.button({}, 4, function() awful.layout.inc(layouts, 1) end),
    awful.button({}, 5, function() awful.layout.inc(layouts, -1) end)))
  -- Create a taglist widget
  mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

  -- Create a tasklist widget
  mytasklist[s] = awful.widget.tasklist(function(c)
    return awful.widget.tasklist.label.currenttags(c, s)
  end, mytasklist.buttons)

  -- TOP PANEL CREATION
  -- Create the wibox
  mywibox[s] = awful.wibox({ position = "top", screen = s })
  -- Add widgets to the wibox - order matters
  mywibox[s].widgets = {
    {
      mylauncher,
      separator,
      mytaglist[s],
      separator,
      mypromptbox[s],
      separator,
      layout = awful.widget.layout.horizontal.leftright
    },
    mylayoutbox[s],
    separator,
    mytextclock,
    separator,
    kbdcfg.widget,
    separator,
    s == 1 and mysystray or nil,
    separator,
    mytasklist[s],
    layout = awful.widget.layout.horizontal.rightleft
  }

  -- BOTTOM PANEL CREATION
  -- Create the infobox
  myinfobox[s] = awful.wibox({ position = "bottom", screen = s })
  -- Add widgets to the infobox - order matters
  myinfobox[s].widgets = {
    {
      mpdwidget,
      layout = awful.widget.layout.horizontal.leftright
  },

    volwidget,
    separator,
    netwidget,
    separator,
    netdownwidget,
    separator,
    netupwidget,
    separator,
    cpuwidget,
    separator,
    memwidget,
    separator,
    fshwidget,
    fsrwidget,
    layout=awful.widget.layout.horizontal.rightleft
  }
end
-- }}}
