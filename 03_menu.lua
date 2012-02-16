-- MENU

idemenu = {
    { "idea latest", "/opt/idea/bin/idea.sh" },
    { "idea 10.5.2", "/opt/idea10.5.2/bin/idea.sh" }
}

-- applications menu
require('freedesktop-utils')
freedesktop.utils.terminal = terminal  -- default: "xterm"
--freedesktop.utils.icon_theme = 'HighContrast' -- look inside /usr/share/icons/, default: nil (don't use icon theme)

require('freedesktop-menu')
-- require("debian.menu")

menu_items = freedesktop.menu.new()
myawesomemenu = {
    { "manual", terminal .. " -e man awesome", freedesktop.utils.lookup_icon({ icon = 'help' }) },
    { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua", freedesktop.utils.lookup_icon({ icon = 'package_settings' }) },
    { "restart", awesome.restart, freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
    { "quit", awesome.quit, freedesktop.utils.lookup_icon({ icon = 'gtk-quit' }) }
}

--table.insert(menu_items, { "awesome", myawesomemenu, beautiful.awesome_icon })
table.insert(menu_items, { "IDE", idemenu })
table.insert(menu_items, { "xterm", "xterm" })
table.insert(menu_items, { "urxvt", "urxvt" })
--table.insert(menu_items, { "Debian", debian.menu.Debian_menu.Debian, freedesktop.utils.lookup_icon({ icon = 'debian-logo' }) })

mymainmenu = awful.menu.new({ items = menu_items, width = 150 })
