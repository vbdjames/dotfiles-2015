-- TODO: need to map hot key to print planner page in taskpaper
--------------------------------------------------------------------------------
-- CONSTANTS
--------------------------------------------------------------------------------

-- Keyboard modifiers, Capslock bound to cmd+alt+ctrl+shift via Seil and Karabiner
-- local modNone  = {""}
-- local modAlt   = {"⌥"}
-- local modCmd   = {"⌘"}
-- local modShift = {"⇧"}
-- local modCtrl = {"⌃"}
-- local modHyper = {"⌘", "⌥", "⌃", "⇧"}

local ctrl_alt = {"ctrl", "alt"}
local ctrl_alt_cmd = {"ctrl", "alt", "cmd"}
local hyper = {"ctrl", "alt", "cmd", "shift"}
local laptop_screen = "Color LCD"
local dell_2309 = "DELL S2309W"
local viewsonic_926 = "VA926 Series"

--------------------------------------------------------------------------------
-- CONFIGURATION
--------------------------------------------------------------------------------
hs.window.animationDuration = 0 -- disable animations

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
-- we have to reference the absolute path, because pathwatcher
-- does not notice changes in the target of a symbolic link
hs.pathwatcher.new(os.getenv("HOME") .. "/.dotfiles/hammerspoon", reloadConfig):start()
hs.alert.show("Config loaded")

--------------------------------------------------------------------------------
-- METHODS
--------------------------------------------------------------------------------




--------------------------------------------------------------------------------
-- move to left half screen
hs.hotkey.bind(ctrl_alt, "Left", function() 
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- move to right half screen
hs.hotkey.bind(ctrl_alt, "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- move to center
hs.hotkey.bind(ctrl_alt, "Space", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x + (max.w / 6)
    f.y = max.y + (max.h / 6)
    f.w = max.w * 2 / 3
    f.h = max.h * 2 / 3
    win:setFrame(f)
end)

-- throw left
hs.hotkey.bind(ctrl_alt_cmd, "Left", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenWest()
end)

-- throw right
hs.hotkey.bind(ctrl_alt_cmd, "Right", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenEast()
end)

-- maximize
hs.hotkey.bind(ctrl_alt_cmd, "Space", function()
    local win = hs.window.focusedWindow()
    win:maximize()
end)

hs.hotkey.bind(ctrl_alt_cmd, "p", function()
    if (hs.itunes.isRunning()) then
        hs.itunes.playpause()
    end
end)

-- launch apps

hs.hotkey.bind(hyper, "j", function() hs.application.launchOrFocus("JIRA") end )
hs.hotkey.bind(hyper, "k", function() hs.application.launchOrFocus("Jenkins") end )
hs.hotkey.bind(hyper, "b", function() hs.application.launchOrFocus("Bitbucket") end )
hs.hotkey.bind(hyper, "w", function() hs.application.launchOrFocus("Map Wiki") end )
hs.hotkey.bind(hyper, "t", function() hs.application.launchOrFocus("iTerm") end )
hs.hotkey.bind(hyper, "n", function() hs.application.launchOrFocus("nvAlt") end )
hs.hotkey.bind(hyper, "m", function() hs.application.launchOrFocus("Mail") end )
hs.hotkey.bind(hyper, "s", function() hs.application.launchOrFocus("Safari") end )
hs.hotkey.bind(hyper, "i", function() hs.application.launchOrFocus("IntelliJ IDEA") end )

hs.hotkey.bind(hyper, "7", function()
    local win7 = hs.appfinder.appFromWindowTitlePattern("Windows7")
    if (win7) then
        win7:activate()
    else
        os.execute("/usr/local/bin/VBoxManage startvm Windows7")
    end
end)

-- launch work apps
    -- IntelliJ
    -- nvAlt
    -- iTerm
        -- tab sshed into test2internal
        -- tab in Code/mapcom/echo
    -- SQLDeveloper
    -- iTunes MiniPlayer (bottom right small monitor)
    -- Mail.app/mutt
    -- Dash
    -- Taskpaper
    -- Windows 7

-- coding config (3-monitor)
    -- nvalt maximized left
    -- intellij maximized center
    -- might want to look at sqldeveloper (on right)
    -- might want to look at safari (on right)
-- testing config (3-monitor)
    -- windows or testapp on big monitor
    -- nvalt on left
    -- might want sqldeveloper on left
    -- usually watching jboss on right
-- admin config
    -- mail
    -- calendar
    -- safari or chrome
