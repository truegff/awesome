-- LIBRARIES
require("awful")
require("awful.autofocus")
require("awful.rules")
require("wibox")
require("beautiful")
require("naughty")
require("vicious")

-- ERRORHANDLING
require("00_errorhandling")

-- DEFAULTS
terminal	= "xterm"
editor		= os.getenv("EDITOR") or "nano"
editor_cmd	= terminal .. " -e " .. editor
browser		= "firefox"
modkey		= "Mod4"
altkey		= "Mod1"

-- THEME
beautiful.init("/usr/share/awesome/themes/default/theme.lua")

-- CONFIGS
require("01_colours")
require("02_tags")
require("03_menu")
require("04_widgetstop")
require("05_widgetsbottom")
require("06_creation")
require("07_bindings")
require("08_rules")
require("09_signals")