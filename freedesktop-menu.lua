-- Grab environment
local utils = require("freedesktop.utils")
local io = io
local string = string
local table = table
local os = os
local ipairs = ipairs

module("freedesktop.menu")

all_menu_dirs = { '/usr/share/applications/', '/usr/local/share/applications/' }

show_generic_name = false

--- Create menus for applications
-- @param menu_dirs A list of application directories (optional).
-- @return A prepared menu w/ categories
function new(arg)
    -- the categories and their synonyms where shamelessly copied from lxpanel
    -- source code.
    local programs = {}
    local config = arg or {}

    programs['AudioVideo'] = {}
    programs['Development'] = {}
    programs['Education'] = {}
    programs['Game'] = {}
    programs['Graphics'] = {}
    programs['Network'] = {}
    programs['Office'] = {}
    programs['Settings'] = {}
    programs['System'] = {}
    programs['Utility'] = {}
    programs['Other'] = {}

    for i, dir in ipairs(config.menu_dirs or all_menu_dirs) do
        local entries = utils.parse_desktop_files({dir = dir})
        for j, program in ipairs(entries) do
            -- check whether to include in the menu
            if program.show and program.Name and program.cmdline then
                if show_generic_name and program.GenericName then
                    program.Name = program.Name .. ' (' .. program.GenericName .. ')'
                end
                local target_category = nil
                if program.categories then
                    for _, category in ipairs(program.categories) do
                        if programs[category] then
                            target_category = category
                            break
                        end
                    end
                end
                if not target_category then
                    target_category = 'Other'
                end
                if target_category then
                    table.insert(programs[target_category], { program.Name, program.cmdline, program.icon_path })
                end
            end
        end
    end

    local menu = {
        { "Accessories", programs["Utility"], utils.lookup_icon({ icon = 'applications-accessories.png' }) },
        { "Development", programs["Development"], utils.lookup_icon({ icon = 'applications-development.png' }) },
        { "Education", programs["Education"], utils.lookup_icon({ icon = 'applications-science.png' }) },
        { "Games", programs["Game"], utils.lookup_icon({ icon = 'applications-games.png' }) },
        { "Graphics", programs["Graphics"], utils.lookup_icon({ icon = 'applications-graphics.png' }) },
        { "Internet", programs["Network"], utils.lookup_icon({ icon = 'applications-internet.png' }) },
        { "Multimedia", programs["AudioVideo"], utils.lookup_icon({ icon = 'applications-multimedia.png' }) },
        { "Office", programs["Office"], utils.lookup_icon({ icon = 'applications-office.png' }) },
        { "Other", programs["Other"], utils.lookup_icon({ icon = 'applications-other.png' }) },
        { "Settings", programs["Settings"], utils.lookup_icon({ icon = 'preferences-desktop.png' }) },
        { "System Tools", programs["System"], utils.lookup_icon({ icon = 'applications-system.png' }) },
    }

    -- Removing empty entries from menu
    local cleanedMenu  = {}
    for index, item in ipairs(menu) do
itemTester = item[2]
        if itemTester[1] then
            table.insert(cleanedMenu, item)
        end
    end

    return cleanedMenu
end
