ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('ic3d_vendingmachines:buydrinkserver')
AddEventHandler('ic3d_vendingmachines:buydrinkserver', function()
  local item = Config.Item
  local price = Config.Price
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.getMoney() >= price then
			if xPlayer.canCarryItem(item, 1) then
				xPlayer.removeMoney(price)
				xPlayer.addInventoryItem(item, 1)
				xPlayer.showNotification(_U('bought', 1, item, ESX.Math.GroupDigits(price)))
			else
				xPlayer.showNotification(_U('player_cannot_hold'))
			end
		else
			local missingMoney = price - xPlayer.getMoney()
			xPlayer.showNotification(_U('not_enough', ESX.Math.GroupDigits(missingMoney)))
		end
end)