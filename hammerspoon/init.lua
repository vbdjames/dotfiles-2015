--------------------------------------------------------------------------------
-- CONSTANTS
--------------------------------------------------------------------------------
local ctrl_alt = {"ctrl", "alt"}
local ctrl_alt_cmd = {"ctrl", "alt", "cmd"}
local laptop_screen = "Color LCD"
local dell_2309 = "DELL S2309W"
local viewsonic_926 = "VA926 Series"


--------------------------------------------------------------------------------
-- CONFIGURATION
--------------------------------------------------------------------------------
hs.window.animationDuration = 0 -- disable

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
-- does not notice changes in the target of a sumbolic link
hs.pathwatcher.new(os.getenv("HOME") .. "/.dotfiles/hammerspoon", reloadConfig):start()
hs.alert.show("Config loaded")


--------------------------------------------------------------------------------
-- METHODS
--------------------------------------------------------------------------------




--------------------------------------------------------------------------------
-- move to left half screen
hs.hotkey.bind({"ctrl", "alt"}, "Left", function() 
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
hs.hotkey.bind({"ctrl", "alt"}, "Right", function()
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
hs.hotkey.bind({"ctrl", "alt"}, "Space", function()
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
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Left", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenWest()
end)

-- throw right
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Right", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenEast()
end)

-- maximize
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Space", function()
    local win = hs.window.focusedWindow()
    win:maximize()
end)

