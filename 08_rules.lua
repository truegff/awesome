-- {{{ Rules
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = true,
      keys = clientkeys,
      buttons = clientbuttons
    }
  },
  {
    rule = { class = "MPlayer" },
    properties = { floating = true }
  },
  {
    rule = { class = "pinentry" },
    properties = { floating = true }
  },
  {
    rule = { class = "gimp" },
    properties = { floating = true }
  },
  {
    rule = { class = "Firefox" },
    properties = { tag = tags[1][2] }
  },
  {
    rule = { name = "IDEA" },
    properties = { tag = tags[1][4] }
  },
  {
    rule = { class = "URxvt" },
    properties = { tag = tags[1][3] }
  },
  {
    rule = { class  = "xterm" },
    properties = { tag = tags[1][3] }
  },
  {
    rule = { class = "Gitk" },
    properties = { tag = tags[1][5] }
  },
  {
    rule = { class = "Git-gui" },
    properties = { tag = tags[1][5] }
  },
  {
    rule = { class = "Skype" },
    properties = { tag = tags[1][2] }
  }
}
-- }}}
