-- Print contents of `tbl`, with indentation.
-- `indent` sets the initial level of indentation.
function tprint(tbl, indent)
    if not indent then
        indent = 0
    end
    for k, v in pairs(tbl) do
        formatting = string.rep("  ", indent) .. k .. ": "
        if type(v) == "table" then
            print(formatting)
            tprint(v, indent + 1)
        elseif type(v) == 'boolean' then
            print(formatting .. tostring(v))
        else
            print(formatting .. v)
        end
    end
end

local fastKeyStroke = function(modifiers, character)
    local event = require("hs.eventtap").event
    event.newKeyEvent(modifiers, string.lower(character), true):post()
    event.newKeyEvent(modifiers, string.lower(character), false):post()
end

local keys = {{
    sMod = {"cmd"},
    sKey = "J",
    dMod = {},
    dKey = "Left",
    description = "Simple movement left"
}, {
    sMod = {"cmd"},
    sKey = "K",
    dMod = {},
    dKey = "Down",
    description = "Simple movement down"
}, {
    sMod = {"cmd"},
    sKey = "I",
    dMod = {},
    dKey = "Up",
    description = "Simple movement up"
}, {
    sMod = {"cmd"},
    sKey = "L",
    dMod = {},
    dKey = "Right",
    description = "Simple movement right"
}, {
    sMod = {"cmd", "shift", "ctrl"},
    sKey = "J",
    dMod = {"alt", "shift"},
    dKey = "Left",
    description = "Highlight words left"
}, {
    sMod = {"cmd", "shift", "ctrl"},
    sKey = "K",
    dMod = {"shift"},
    dKey = "Down",
    description = "Highlight words down"
}, {
    sMod = {"cmd", "shift", "ctrl"},
    sKey = "I",
    dMod = {"shift"},
    dKey = "Up",
    description = "Highlight words up"
}, {
    sMod = {"cmd", "shift", "ctrl"},
    sKey = "L",
    dMod = {"alt", "shift"},
    dKey = "Right",
    description = "Highlight words right"
}, {
    sMod = {"cmd", "shift"},
    sKey = "I",
    dMod = {"cmd"},
    dKey = "Up",
    description = "ctrl home, go to top of page"
}, {
    sMod = {"cmd", "shift"},
    sKey = "K",
    dMod = {"cmd"},
    dKey = "Down",
    description = "ctrl end, go to bottom of page"
}, {
    sMod = {"cmd", "ctrl"},
    sKey = "L",
    dMod = {"alt"},
    dKey = "Right",
    description = "traverse right by one word"
}, {
    sMod = {"cmd", "ctrl"},
    sKey = "J",
    dMod = {"alt"},
    dKey = "Left",
    description = "traverse left by one word"
}, {
    sMod = {"cmd", "shift"},
    sKey = "L",
    dMod = {"cmd"},
    dKey = "Right",
    description = "end key, go to end of line"
}, {
    sMod = {"cmd", "shift"},
    sKey = "J",
    dMod = {"cmd"},
    dKey = "Left",
    description = "home key, go to front of line"
}, {
    sMod = {"cmd", "ctrl"},
    sKey = "I",
    dMod = {"fn"},
    dKey = "Up",
    description = "Page up"
}, {
    sMod = {"cmd", "ctrl"},
    sKey = "K",
    dMod = {"fn"},
    dKey = "Down",
    description = "Page down"
}, {
    sMod = {"ctrl"},
    sKey = "Delete",
    dMod = {"alt"},
    dKey = "Delete",
    description = "Delete word windows style"
}}

hs.fnutils.each(keys, function(hotkey)
    tprint(hotkey)
    hs.hotkey.bind(hotkey.sMod, hotkey.sKey, function()
        fastKeyStroke(hotkey.dMod, hotkey.dKey)
    end, nil, function()
        fastKeyStroke(hotkey.dMod, hotkey.dKey)
    end)
end)
