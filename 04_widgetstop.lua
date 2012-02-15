mylauncher = awful.widget.launcher({
  image = image(beautiful.awesome_icon),
  menu = mymainmenu
})

-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
mysystray = widget({ type = "systray" })
