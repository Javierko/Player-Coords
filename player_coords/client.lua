local enablePos = false;

RegisterCommand("pos", function(source, args, raw)
    if enablePos then
        enablePos = false
    else
        enablePos = true
    end
end, false)

Citizen.CreateThread(function()
    while true do
        if enablePos then
            Citizen.Wait(0)
            
            local player = GetPlayerPed(PlayerId())
            local playerCoords = GetEntityCoords(player, false)
            local playerHeading = GetEntityHeading(player)

            local shortX = tonumber(string.format("%.1f", playerCoords.x))
            local shortY = tonumber(string.format("%.1f", playerCoords.y))
            local shortZ = tonumber(string.format("%.1f", playerCoords.z))
            local shortH = tonumber(string.format("%.1f", playerHeading))

            local hudText = "~y~X~w~: " .. shortX .. " ~y~Y~w~: " .. shortY .. " ~y~Z~w~: " .. shortZ .. " ~y~H~w~: " .. shortH
            DrawHudText(0.5, 0.95, hudText)
        end
    end
end)

function DrawHudText(x, y, text)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(0.0, 0.65)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end