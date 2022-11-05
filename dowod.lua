--[[
    jsfour id card converted to ox_lib by katakume from astro-development.
]]

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function dowody()
    local player, distance = ESX.Game.GetClosestPlayer()
    lib.registerContext({
        id = 'context:dokumenty',
        title = 'Dokumenty',
        options = {
            {
                title = 'Moje dukumenty',
                description = 'Spojrz na swoje dukumenty!',
                arrow = true,
                onSelect = function()
                    swojedokumenty()
                  end
            },
            {
                title = 'Pokaz dowod osobisty',
                description = 'Pokaz dowod osobisty osobie',
                onSelect = function()
                    if distance ~= -1 and distance <= 3.0 then
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
                    else
                        exports['Astro-NotifySystem']:Notify('error', 'Brak gracza w poblizu!')
                    end
                  end
            },
        {
            title = 'Pokaz prawo jazdy',
            description = 'Pokaz prawo jazdy osobie',
            onSelect = function()
                if distance ~= -1 and distance <= 3.0 then
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
                else
                    exports['Astro-NotifySystem']:Notify('error', 'Brak gracza w poblizu!')
                end
              end
        },
        {
            title = 'Pokaz licencje na bron',
            description = 'Pokaz licencje na bron osobie',
            onSelect = function()
                if distance ~= -1 and distance <= 3.0 then
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
                else
                    exports['Astro-NotifySystem']:Notify('error', 'Brak gracza w poblizu!')
                end
              end
        },
    }
    })
    lib.showContext('context:dokumenty')
end

-- part 2

function swojedokumenty()
    lib.registerContext({
        id = 'context:dokumenty2',
        title = 'Moje dokumenty',
        options = {
            {
                title = 'Zobacz swoj dowod osobisty',
                description = 'Spojrz jaki masz piekny dowod!',
                onSelect = function()
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                  end
            },
            {
            title = 'Zobacz swoje prawo jazdy',
            description = 'Spojrz jaki masz piekne prawo jazdy!',
            onSelect = function()
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
              end
        },
        {
            title = 'Zobacz swoja licencje na bron',
            description = 'Spojrz jakia masz piekna licencje na bron',
            onSelect = function()
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
              end
        },
    }
    })
    lib.showContext('context:dokumenty2')
end

RegisterCommand("dokumenty", function()
    dowody()
end)
