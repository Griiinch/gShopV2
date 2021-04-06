ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('GrinchBuy')
AddEventHandler('GrinchBuy', function(Price,Item,Label,Index)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()
    Price = Price*Index
    if xMoney >= Price then
      xPlayer.removeMoney(Price)
      xPlayer.addInventoryItem(Item, Index)
      TriggerClientEvent('esx:showNotification', _source, "Vous venez de acheter ~b~"..Index.."x "..Label.."~s~ pour ~g~"..Price.."$~s~ !")
    else
      TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas assez d'argent")
    end
end)