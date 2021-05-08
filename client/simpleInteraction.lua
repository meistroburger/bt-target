-- Registering Event to use for the interaction :

RegisterNetEvent("qb:Duty")
AddEventHandler("qb:Duty", function()
    onDuty = not onDuty
    TriggerServerEvent("police:server:UpdateCurrentCops")
    TriggerServerEvent("QBCore:ToggleDuty")
    TriggerServerEvent("police:server:UpdateBlips")
    TriggerEvent('qb-policealerts:ToggleDuty', onDuty)
end)

-- Adding the zone for the interaction

Citizen.CreateThread(function()
    
        exports["bt-target"]:AddBoxZone("PoliceDuty", vector3(441.79, -982.07, 30.69), 0.4, 0.6, {
            name = "PoliceDuty",
            heading = 91,
            debugPoly = false,
            minZ = 30.79,
            maxZ = 30.99
        }, {
            options = {
                {
                    event = "qb:Duty",
                    icon = "far fa-clipboard",
                    label = "Sign On",
                },
                {
                    event = "qb:Duty",
                    icon = "far fa-clipboard",
                    label = "Sign Off",
                },
            },
            job = {"all"},
            distance = 1.5
        })
    end)