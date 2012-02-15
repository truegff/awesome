-- MENU
-- sub menus
networkmenu = {
	{ "firefox", "firefox"	}
}
officemenu = {
--	{ "", "" }
}
editorsmenu = {
--	{ "", "" }	
}
graphicsmenu = {
--	{ "", "" }
}
utilitiesmenu = {
--	{ "", "" }
}
awesomemenu = {
   { "lock",	terminal .. " -e slock"	},
   { "restart",	awesome.restart		},
   { "quit",	awesome.quit		},
   { "reboot",	terminal .. " -e dbus-send --system --print-reply --dest='org.freedesktop.ConsoleKit' /org/freedesktop/ConsoleKit/Manager org.freedsktop.ConsoleKit.Manager.Restart" },
   { "shutdown", terminal .. " -e dbus-send --system --print-reply --dest='org.freedesktop.ConsoleKit' /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop" }
}

-- main menu
mainmenu = awful.menu({
	items = {
		{ "network",	networkmenu	},
		{ "office",	officemenu	},
		{ "editors",	editorsmenu	},
		{ "graphics",	graphicsmenu	},
		{ "utilities",	utilitiesmenu	},
		{ "awesome",	awesomemenu	},
		{ "terminal",	terminal}
	}
})
