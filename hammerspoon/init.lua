-- TODO: need to map hot key to print planner page in taskpaper
--------------------------------------------------------------------------------
-- CONSTANTS
--------------------------------------------------------------------------------

-- Keyboard modifiers, Capslock bound to cmd+alt+ctrl+shift via Seil and Karabiner
local ctrl_alt = {"ctrl", "alt"}
local ctrl_alt_cmd = {"ctrl", "alt", "cmd"}
local hyper = {"ctrl", "alt", "cmd", "shift"}

-- Screens at the office
local laptop_screen = "Color LCD"
local dell_2309 = "DELL S2309W"
local viewsonic_926 = "VA926 Series"

-- Applications
local bitbucket = "Bitbucket"
local calendar = "Calendar"
local dash = "Dash"
local fromscratch = "FromScratch"
local intellij = "IntelliJ IDEA"
local iterm = "iTerm"
local itunes = "iTunes"
local jenkins = "Jenkins"
local jira = "JIRA"
local mail = "Mail"
local mapwiki = "MapWiki"
local nvalt = "nvALT"
local safari = "Safari"
local sqldeveloper = "SQLDeveloper"
local sqldeveloper_close = "Oracle SQL Developer" 
local taskpaper = "TaskPaper"
local windowsvm = "Windows7"

--------------------------------------------------------------------------------
-- CONFIGURATION
--------------------------------------------------------------------------------
hs.window.animationDuration = 0 -- disable animations

--------------------------------------------------------------------------------
-- MISC HOTKEYS
--------------------------------------------------------------------------------
hs.hotkey.bind(hyper, 'r', function() hs.reload() end )
hs.hotkey.bind(hyper, 'y', function() hs.toggleConsole() end )

hs.hotkey.bind(hyper, 'x', function() 
    local app = hs.appfinder.appFromWindowTitlePattern("ECHO Test")
    if (app) then
        app:activate()
    else
        hs.alert("can't find it");
    end
end)
--------------------------------------------------------------------------------
-- METHODS
--------------------------------------------------------------------------------
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
hs.hotkey.bind(hyper, "7", function() launchOrFocus(windowsvm) end )
hs.hotkey.bind(hyper, "b", function() launchOrFocus(bitbucket) end )
hs.hotkey.bind(hyper, "f", function() launchOrFocus(fromscratch) end )
hs.hotkey.bind(hyper, "i", function() launchOrFocus(intellij) end )
hs.hotkey.bind(hyper, "j", function() launchOrFocus(jira) end )
hs.hotkey.bind(hyper, "k", function() launchOrFocus(jenkins) end )
hs.hotkey.bind(hyper, "m", function() launchOrFocus(mail) end )
hs.hotkey.bind(hyper, "n", function() launchOrFocus(nvalt) end )
hs.hotkey.bind(hyper, "q", function() launchOrFocus(sqldeveloper) end )
hs.hotkey.bind(hyper, "s", function() launchOrFocus(safari) end )
hs.hotkey.bind(hyper, "t", function() launchOrFocus(iterm) end )
hs.hotkey.bind(hyper, "w", function() launchOrFocus(mapwiki) end )

function launchOrFocus(appName)
    if (appName == windowsvm) then
        local win7 = hs.appfinder.appFromWindowTitlePattern(windowsvm)
        if (win7) then
            win7:activate()
        else
            os.execute("/usr/local/bin/VBoxManage startvm " .. windowsvm)
        end
    else
        hs.application.launchOrFocus(appName)
    end
end

function kill(appName)
    if (appName == windowsvm) then
        local win7 = hs.appfinder.appFromWindowTitlePattern("Windows7")
        if (win7) then
            win7:activate()
            os.execute("/usr/local/bin/VBoxManage controlvm Windows7 acpipowerbutton")
        else
            print("could not find app " .. appName)
        end
    else
        local app = hs.application.find(appName)
        if (app) then
            app:activate()
            app:kill()
        else
            print("could not find app " .. appName)
        end
    end
end

function beginWork()
    hs.alert.show("Opening work applications")
    local openApps = { bitbucket, calendar, dash, intellij, iterm, 
        itunes, jenkins, jira, mail, mapwiki, nvalt, safari, 
        sqldeveloper, taskpaper, windowsvm }
    for i, v in ipairs(openApps) do
        launchOrFocus(v)
    end
    -- set up iterm tabs/tmux sessions/...
    -- launch appropriate config for morning
end

function endWork()
    hs.alert.show("Shutting down work applications")
    local closeApps = { bitbucket, calendar, dash, intellij, iterm, 
        itunes, jenkins, jira, mail, mapwiki, nvalt, safari, 
        sqldeveloper_close, taskpaper, windowsvm }
    for i, v in ipairs(closeApps) do
        kill(v)
    end
    hs.applescript.applescript([[
        tell application "Finder"
            eject "Time Machine"
        end tell
    ]])
end

hs.urlevent.bind("beginwork", beginWork)
hs.urlevent.bind("endwork", endWork)


-- coding config (3-monitor)
    -- nvalt maximized left
    -- intellij maximized center
    -- might want to look at sqldeveloper (on right)
    -- might want to look at safari (on right)
local mapcomCoding = {
    {
        name = { nvalt },
        func = function(index, win)
            print("in the func")
            win:moveToScreen(hs.screen.find(laptop_screen))
            win:maximize()
        end
    },
    {
        name = { intellij },
        func = function(index, win)
            win:moveToScreen(hs.screen.find(dell_2309))
            win:maximize()
        end
    },
    {
        name = { bitbucket, calendar, dash, iterm, 
            itunes, jenkins, jira, mail, mapwiki, safari, 
            sqldeveloper_close, taskpaper },
        func = function(index, win)
            win:moveToScreen(hs.screen.find(viewsonic_926))
            win:maximize()
            win:application():hide()
        end
    },
    {
        name = { "VirtualBox VM" },
        func = function(index, win)
            win:application():hide()
        end
    }
}

local macomTesting = {

}


function applyLayouts(layouts)
    for i, layout in ipairs(layouts) do
        if (type(layout.name) == "table") then
            for i, appName in ipairs(layout.name) do
                local app = hs.appfinder.appFromName(appName)
                if (app) then
                    local wins = app:allWindows()
                    local counter = 1
                    for j, win in ipairs(wins) do
                        if (win:isVisible() and layout.func) then
                            layout.func(counter, win)
                            counter = counter + 1
                        end
                    end
                end
            end
        elseif (type(layout.name) == "string") then
            local app = hs.appfinder.appFromName(layout.name)
            if (app) then
                local wins = app:allWindows()
                local counter = 1
                for j, win in ipairs(wins) do
                    if (win:isVisible() and layout.func) then
                        layout.func(counter, win)
                        counter = counter + 1
                    end
                end
            end
        end
    end
end

hs.hotkey.bind(hyper, "3", function()
    applyLayouts(mapcomCoding)

end)

    
    
    
    -- testing config (3-monitor)
    -- windows or testapp on big monitor
    -- nvalt on left
    -- might want sqldeveloper on left
    -- usually watching jboss on right
-- admin config
    -- mail
    -- calendar
    -- safari or chrome


-- we have to reference the absolute path, because pathwatcher
-- does not notice changes in the target of a symbolic link
hs.pathwatcher.new(os.getenv("HOME") .. "/.dotfiles/hammerspoon", reloadConfig):start()
hs.alert.show("Config loaded")

