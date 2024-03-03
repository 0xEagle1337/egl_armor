if config.Core == 'QB' then
	Core = exports["qb-core"]:GetCoreObject()
else
	Core = exports["es_extended"]:getSharedObject()
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
	if config.Core == 'QB' then
		local xPlayer = Core.Functions.GetPlayer(source)
		xPlayer.Functions.RemoveItem(itemName, quantity)
	else
		local xPlayer = Core.GetPlayerFromId(source)
		xPlayer.removeInventoryItem(itemName, quantity)
	end
end