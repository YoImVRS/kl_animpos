local noclip = false
local originalCoords = nil
local fixedCoords = nil

RegisterCommand('animpos', function()
    noclip = not noclip
    local playerPed = PlayerPedId()
    local playerId = GetPlayerServerId(PlayerId())
    local playerName = GetPlayerName(PlayerId())

    if noclip then
        originalCoords = GetEntityCoords(playerPed)
        TriggerEvent('chat:addMessage', {
            args = { '[AnimPos]', 'AnimPos enabled. Use WASD to move, up/down arrows for height, and mouse wheel to rotate..' }
        })
        SetEntityAlpha(playerPed, 170, false)
        TriggerServerEvent('kl_animpos:log', playerId, playerName, originalCoords, 'iniciado')
    else
        TriggerEvent('chat:addMessage', {
            args = { '[AnimPos]', 'AimPos Disabled.' }
        })
        SetEntityAlpha(playerPed, 255, false)
        SetEntityCoords(playerPed, originalCoords.x, originalCoords.y, originalCoords.z)
    end
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if noclip then
            local playerPed = PlayerPedId()
            local x, y, z = table.unpack(GetEntityCoords(playerPed))
            local rot = GetEntityHeading(playerPed)

            if IsControlPressed(0, 32) then
                y = y + 0.1
            end
            if IsControlPressed(0, 33) then
                y = y - 0.1
            end
            if IsControlPressed(0, 34) then
                x = x - 0.1
            end
            if IsControlPressed(0, 35) then
                x = x + 0.1
            end

            if IsControlPressed(0, 172) then
                z = z + 0.1
            end
            if IsControlPressed(0, 173) then
                z = z - 0.1
            end

            if IsControlPressed(0, 241) then
                rot = rot + 1.0
            end
            if IsControlPressed(0, 242) then
                rot = rot - 1.0
            end

            SetEntityCoordsNoOffset(playerPed, x, y, z, true, true, true)
            SetEntityHeading(playerPed, rot)

            if IsControlJustPressed(0, 178) then
                SetEntityCoords(playerPed, originalCoords.x, originalCoords.y, originalCoords.z)
                noclip = false
                SetEntityAlpha(playerPed, 255, false)
                TriggerServerEvent('kl_animpos:log', GetPlayerServerId(PlayerId()), GetPlayerName(PlayerId()), originalCoords, 'cancelled')
            end

            if IsControlJustPressed(0, 191) then
                fixedCoords = GetEntityCoords(playerPed)
                noclip = false
                SetEntityAlpha(playerPed, 255, false)
                TriggerServerEvent('kl_animpos:log', GetPlayerServerId(PlayerId()), GetPlayerName(PlayerId()), originalCoords, 'marked', fixedCoords)
            end
        end
    end
end)
