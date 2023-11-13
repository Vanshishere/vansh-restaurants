local QBCore = exports['qb-core']:GetCoreObject() 


RegisterNetEvent('qb-menu:client:makeburgers', function(data)
    exports["qb-menu"]:openMenu({
        {
            header = "< Go back >",
        },
        {
            header = "Burger",
            txt = "1X Burger-bun , 1X Burger-meat , 1X Burger-tomato , 1X Burger-lettuce",
            params = {
                event = 'vanshprogress:vanshmakeprogress',
            }
        },
    })
end)


RegisterNetEvent("vanshprogress:vanshmakeprogress", function()
     TriggerEvent('animations:client:PlayEmote', {"mechanic"})
     QBCore.Functions.Progressbar("vanshburgermaking", "Making burgers", 6000, true, true, {
         disableMovement = true,
         disableCarMovement = true,
         disableMouse = false,
         disableCombat = true,
     }, {}, {}, {}, function() -- Done
         TriggerServerEvent("vanshburgeranim:server:cburgss")
         TriggerEvent('animations:client:PlayEmote', {"c"})
     end, function() -- Cancel
         TriggerEvent('animations:client:PlayEmote', {"c"})
     end)
     end)




Citizen.CreateThread(function()
	exports['qb-target']:AddCircleZone("burgerrestrauntstorage", vector3(-1203.392, -896.1588, 13.995312), 1.5, {
        name="burgerrestrauntstorage",
        debugPoly=false,
        useZ=true,
        }, {
            options = {
            {
                type = "client",
                event = "qb-burger:shop",
                label = "Open Burger storage",
                job = "burgershot",
                
                
            },
            
        },
        distance = 1.5
    })
end)


Citizen.CreateThread(function()
	exports['qb-target']:AddCircleZone("makeburgers", vector3(-1197.647, -899.4966, 13.743308), 1.5, {
        name="makeburgers",
        debugPoly=false,
        useZ=true,
        }, {
            options = {
            {
                type = "client",
                event = "qb-menu:client:makeburgers",
                label = "make burgers",
                job = "burgershot",
                
                
            },
            
        },
        distance = 1.5
    })
end)

RegisterNetEvent('qb-burger:shop', function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Burger", Config.RestrauntItems)
end);



