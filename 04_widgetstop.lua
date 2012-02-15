--mylauncher = awful.widget.launcher({
--	image	= image(beautiful.awesome_icon),
--	menu	= mainmenu
--})

--  Network usage widget
-- Initialize widget
-- netwidget = widget({ type = "textbox" })
-- Register widget
-- vicious.register(netwidget, vicious.widgets.net, '<span color="#CC9393">${eth0 down_kb}d</span> <span color="#7F9F7F">${eth0 up_kb}u</span>', 3)


---  CPU usage widget
--- Initialize widget
-- cpuwidget = widget({ type = "textbox" })
--- Register widget
-- vicious.register(cpuwidget, vicious.widgets.cpu, "$1%")


---  MEM usage widget
--- Initialize widget
--memwidget = widget({ type = "textbox" })
--- Register widget
--vicious.register(memwidget, vicious.widgets.mem, "$1% ($2MB/$3MB)", 13)


---  MPD widget
--- Initialize widget
-- mpdwidget = widget({ type = "textbox" })
--- Register widget
-- mpdfunc = function (widget, args)
--		if args["{state}"] == "Stop" then
--			return " - "
--		else
--			return args["{Artist}"].." - ".. args["{Title}"]
--		end
-- 	end
-- vicious.register(mpdwidget, vicious.widgets.mpd,mpdfunc, 10)

--separator = widget({ type = "textbox" })
--separator.text  = " :: "

-- Create a textclock widget
--mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
--mysystray = widget({ type = "systray" })
