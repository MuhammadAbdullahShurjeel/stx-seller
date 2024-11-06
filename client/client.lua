RSGCore = exports[Config.Core]:GetCoreObject()

function isEmpty(table)
    for _, _ in pairs(table) do
        return false
    end
    return true
end

CreateThread(function()

    if Config.Interaction == "prompt" then
        for i=1, #Config.Locations do
            exports[Config.InteractionName]:createPrompt(Config.Locations[i].Prompt.name, Config.Locations[i].Prompt.promptvec, Config.Locations[i].Prompt.keybind,  Config.Locations[i].Prompt.msg, {
                type = 'client',
                event = 'stx-seller:client:openmenu',
                args = {Config.Locations[i].Prompt.name, i},
            })
    
        end

    elseif Config.Interaction == "target" then
        for i=1, #Config.Locations do
            exports[Config.InteractionName]:AddCircleZone(Config.Locations[i].Prompt.name, Config.Locations[i].Prompt.promptvec, 1, {
                name = Config.Locations[i].Prompt.name,
                useZ = true
            }, {
                options = {
                    {
                        type = "client",
                        icon = "fas fa-bank",
                        label = Config.Locations[i].Prompt.msg,
                        action = function()
                            TriggerEvent('stx-seller:client:openmenu', Config.Locations[i].Prompt.name, i)
                        end
                    },
                },
                distance = 1.5
            })
    
        end
    end

end)

RegisterNetEvent('stx-seller:client:openmenu', function(stashcreated, id)
    local items, totalprice, def = lib.callback.await('stx-seller:server:callback:getstashinformation', source, stashcreated..'_seller_' .. RSGCore.Functions.GetPlayerData().citizenid, id)
    local menus = {}
    if isEmpty(items) then
        menus[#menus + 1] = {
            title = Config.locales[Config.locale].open_inv,
            onSelect = function()
                TriggerEvent('stx-seller:client:openinv', stashcreated..'_seller_' .. RSGCore.Functions.GetPlayerData().citizenid)
            end,
        }
    else
        menus[#menus + 1] = {
            title = Config.locales[Config.locale].open_inv,
            onSelect = function()
                TriggerEvent('stx-seller:client:openinv', stashcreated..'_seller_' .. RSGCore.Functions.GetPlayerData().citizenid)
            end,
        }
        menus[#menus + 1] = {
            title = Config.locales[Config.locale].sell_stuff,
            onSelect = function()
                if def then
                    lib.notify({
                        title = Config.locales[Config.locale].seller_name,
                        description = Config.locales[Config.locale].seller_name,
                        type = 'error'
                    })
                    return
                end
                local alert = lib.alertDialog({
                    header = 'Seller',
                    content = 'I will Buy All The Items For '..totalprice..'$',
                    centered = true,
                    cancel = true
                })
                
                if alert then
                    TriggerServerEvent('stx-seller:server:sellitems', stashcreated..'_seller_' .. RSGCore.Functions.GetPlayerData().citizenid, totalprice)
                end
            end,
        }
    end

    lib.registerContext({
        id = 'stx_seller_menu',
        title = 'Menu',
        menu = 'stx_seller_menu__',
        options = menus
    })
    lib.showContext('stx_seller_menu')
end)

RegisterNetEvent('stx-seller:client:openinv', function(id)
    if Config.Inv == 'v1' then
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', id, {
            maxweight = Config.InvSettings.maxweight,
            slots = Config.InvSettings.slots,
        })
        TriggerEvent('inventory:client:SetCurrentStash', id)
    elseif Config.Inv == 'v2' then
        TriggerServerEvent('stx-seller:server:creatstash:inventory:v2', id)
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for i=1, #Config.Locations do
        if Config.Interaction == "prompt" then
            exports[Config.InteractionName]:deletePrompt(Config.Locations[i].Prompt.name)
        elseif Config.Interaction == "target" then
            exports[Config.InteractionName]:RemoveZone(Config.Locations[i].Prompt.name)
        end
    end
end)