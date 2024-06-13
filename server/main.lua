local webhookUrl = ''

RegisterServerEvent('kl_animpos:log')
AddEventHandler('kl_animpos:log', function(playerId, playerName, originalCoords, status, fixedCoords)
    local player = GetPlayerIdentifiers(source)
    local discordId = nil
    local ip = nil

    for _, id in ipairs(player) do
        if string.find(id, 'discord:') then
            discordId = id
        elseif string.find(id, 'ip:') then
            ip = id
        end
    end

    local embed = {
        {
            ["color"] = 16711680,
            ["title"] = "github.com/ottersek/kl_animpos",
            ["fields"] = {
                {
                    ["name"] = "Player",
                    ["value"] = playerName .. " (" .. playerId .. ")",
                    ["inline"] = true
                },
                {
                    ["name"] = "Identifiers",
                    ["value"] = table.concat(player, "\n"),
                    ["inline"] = true
                },
                {
                    ["name"] = "Discord",
                    ["value"] = discordId or "Unlinked",
                    ["inline"] = true
                },
                {
                    ["name"] = "AnimPos Status",
                    ["value"] = status,
                    ["inline"] = true
                },
                {
                    ["name"] = "First Position",
                    ["value"] = string.format("X: %.2f, Y: %.2f, Z: %.2f", originalCoords.x, originalCoords.y, originalCoords.z),
                    ["inline"] = false
                }
            }
        }
    }

    if status == 'fijado' and fixedCoords then
        table.insert(embed[1].fields, {
            ["name"] = "Marked Position",
            ["value"] = string.format("X: %.2f, Y: %.2f, Z: %.2f", fixedCoords.x, fixedCoords.y, fixedCoords.z),
            ["inline"] = false
        })
    end

    PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode({ username = 'kl_animpos', embeds = embed }), { ['Content-Type'] = 'application/json' })
end)
