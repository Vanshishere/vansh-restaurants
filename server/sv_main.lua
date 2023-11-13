local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('vanshburgeranim:server:cburgss', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local burgerbun = Player.Functions.GetItemByName('burger-bun')
    local burgermeat = Player.Functions.GetItemByName('burger-meat')
    local burgerlettuce = Player.Functions.GetItemByName('burger-lettuce')
    local burgertomato = Player.Functions.GetItemByName('burger-tomato')

    if burgerbun ~= nil and burgermeat ~= nil and burgerlettuce ~= nil and burgertomato ~= nil then

        if burgerbun.amount >= 1 and burgermeat.amount >= 1 and burgerlettuce.amount >= 1 and burgertomato.amount >= 1  then

            Player.Functions.RemoveItem('burger-bun', 1)
            Player.Functions.RemoveItem('burger-meat', 1)
            Player.Functions.RemoveItem('burger-lettuce', 1)
            Player.Functions.RemoveItem('burger-tomato', 1)

            Player.Functions.AddItem('burger-bleeder', 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['burger-bleeder'], "add")
        end
    end
end)