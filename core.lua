if config.Core == 'QB' then
	Core = exports["qb-core"]:GetCoreObject()
else
	Core = exports["es_extended"]:getSharedObject()
end

function getPlayerFromId(source)
	if config.Core == 'QB' then
		Core.Functions.GetPlayer(source)
	else
		Core.GetPlayerFromId(source)
	end

function showNotification(message, type)
	if config.Core == 'QB' then
		Core.Notify(message, type)
	else
		TriggerEvent('esx:showNotification', message)
	end
end

function registerItems(itemName)
	if config.Core == 'QB' then
		Core.Functions.CreateUseableItem(itemName)
	else
		Core.RegisterUsableItem(itemName)
	end
end

function removeItem(source, itemName, quantity)
	local xPlayer = getPlayerFromId(source)
	
	if config.Core == 'QB' then
		xPlayer.Functions.RemoveItem(itemName, quantity)
	else
		xPlayer.removeInventoryItem(itemName, quantity)
	end
end