--Money Check
    RegisterNetEvent('qbr-grandma:server:checkmoney')
    AddEventHandler('qbr-grandma:server:checkmoney', function()
    local src = source
    local Player = exports['qbr-core']:GetPlayer(src)
	local cashBalance = Player.PlayerData.money["cash"]
    local ReviveAmount = Config.ReviveAmount

    if cashBalance >= ReviveAmount then
    Player.Functions.RemoveMoney("cash", ReviveAmount)
    TriggerClientEvent('qbr-grandma:client:startrevive', Player.PlayerData.source)
    else
    TriggerClientEvent('qbr-grandma:client:notenoughmoney', Player.PlayerData.source)
    end
end)