RegisterCommand("traffic", function() 
    lib.showContext('menu:main')
end)

function ShowNotification(data)
    -- Trigger notification
    lib.notify(data)
end

local sz = nil

lib.registerContext({
    id = 'menu:main',
    title = 'Traffic Menu',
    canClose = true,
    options = {
        {
            title = 'Slow Traffic',
            onSelect = function()
                if sz ~= nil then 
                    RemoveSpeedZone(sz)
                    ShowNotification({
                        title = "Traffic Resumed",
                        type = "success"
                    })
                    sz = nil
                    RemoveBlip(tcblip)
                else
                    ShowNotification({
                        title = "Traffic Slowed",
                        type = "warning"
                    })
                    tcblip = AddBlipForRadius(GetEntityCoords(GetPlayerPed(-1)),40.0)
                    SetBlipAlpha(tcblip,80)
                    SetBlipColour(tcblip,5)
                    sz = AddSpeedZoneForCoord(GetEntityCoords(GetPlayerPed(-1)),40.0,5.0,false)
                end
            end,
            icon = 'car',
            description = 'Slow down traffic in the area.',
        },
        {
            title = 'Resume Traffic',
            onSelect = function()
                if sz ~= nil then 
                    RemoveSpeedZone(sz)
                    ShowNotification({
                        title = "Traffic Resumed",
                        type = "success"
                    })
                    sz = nil
                    RemoveBlip(tcblip)
                end
            end,
            icon = 'play',
            description = 'Resume normal traffic flow.',
        },
        {
            title = 'Stop Traffic',
            onSelect = function()
                if sz ~= nil then 
                    RemoveSpeedZone(sz)
                    ShowNotification({
                        title = "Traffic Resumed",
                        type = "success"
                    })
                    sz = nil
                    RemoveBlip(tcblip)
                else
                    ShowNotification({
                        title = "Traffic Stopped",
                        type = "error"
                    })
                    tcblip = AddBlipForRadius(GetEntityCoords(GetPlayerPed(-1)),50.0)
                    sz = AddSpeedZoneForCoord(GetEntityCoords(GetPlayerPed(-1)),50.0,0.0,false)
                    SetBlipAlpha(tcblip,80)
                    SetBlipColour(tcblip,1)
                end
            end,
            icon = 'stop',
            description = 'Completely stop traffic in the area.',
        }
    }
})
