--Custom Content Auto-loader. If you don't see custom content in Azeroth or unscripted creatures, it's because it's December 31st. Just .event stop 91 and .event start 91 again.

local eventId = 91

function OnStartup()
    StartGameEvent(eventId, true)
end

RegisterServerEvent(14, OnStartup)