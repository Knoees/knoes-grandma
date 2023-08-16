local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('knoes-grandma:server:reviveatamk')
AddEventHandler('knoes-grandma:server:reviveatamk', function()
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.Functions.RemoveMoney(Config.ReviveConfig.PaymentType, Config.ReviveConfig.PaymentPrice) then
        TriggerClientEvent('hospital:client:Revive', src)
    else
        QBCore.Functions.Notify(src, Lang:t('grandma.nomoney'), 'error')
    end
end)