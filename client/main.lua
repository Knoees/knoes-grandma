local QBCore = exports['qb-core']:GetCoreObject()

local Grandmas = {}

CreateThread(function()
    for l, n in pairs(Config.Grandmas) do
        
        if Grandmas['grandma-'..l] == nil then
            local Model = n.Ped.Model
            RequestModel(Model)
		    while not HasModelLoaded(Model) do Wait(1) end
		    Grandmas['grandma-'..l] = CreatePed(4, Model, n.Ped.Coord.x, n.Ped.Coord.y, n.Ped.Coord.z-1.0, n.Ped.Heading, false, false)
		    SetPedFleeAttributes(Grandmas['grandma-'..l], 0, false)
		    SetPedDropsWeaponsWhenDead(Grandmas['grandma-'..l], false)
		    SetPedDiesWhenInjured(Grandmas['grandma-'..l], false)
		    SetEntityInvincible(Grandmas['grandma-'..l] , true)
		    FreezeEntityPosition(Grandmas['grandma-'..l], true)
		    SetBlockingOfNonTemporaryEvents(Grandmas['grandma-'..l], true)

            if n.Ped.Scenarios then
                TaskStartScenarioInPlace(Grandmas['grandma-'..l], n.Ped.Scenario, 0, true)
            else
                RequestAnimDict(n.Ped.AnimDict)
                TaskPlayAnim(Grandmas['grandma-'..l], n.Ped.AnimDict, n.Ped.AnimName, 8.0, 1, -1, n.Ped.AnimFlag, 0, false, false, false)
            end

            exports['qb-target']:AddTargetEntity(Grandmas['grandma-'..l], {
                options = {
                    {
                        event = "knoes-grandma:yardimediyor",
                        icon = n.Ped.TargetIcon,
                        label = n.Ped.TargetLabel,
                    },
                },
                distance = 2.0
            })
        else return end

        if n.Blip.Show then
            local blip = AddBlipForCoord(n.Ped.Coord.x, n.Ped.Coord.y, n.Ped.Coord.z)
			SetBlipSprite(blip, n.Blip.Sprite)
			SetBlipScale(blip, n.Blip.Scale)
			SetBlipColour(blip, n.Blip.Colour)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(n.Blip.Label)
			EndTextCommandSetBlipName(blip)
        end
    end
end)


RegisterNetEvent('knoes-grandma:yardimediyor', function()
    QBCore.Functions.Progressbar('grandma_helping', Lang:t("grandma.helping"), Config.HelpDuration, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        if Config.Minigame == true then
            exports['ps-ui']:Circle(function(success)
                if success then
                    TriggerServerEvent('knoes-grandma:server:reviveatamk')
                else
                    QBCore.Functions.Notify(Lang:t("grandma.youfailed"), "error")
                end
            end, math.random(3, 6), math.random(10, 25))
            ClearPedTasks(PlayerPedId())
        elseif Config.Minigame == false then
            TriggerServerEvent('knoes-grandma:server:reviveatamk')
        end
    end, function()
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify(Lang:t("grandma.cancel"), "error")
    end)
end)