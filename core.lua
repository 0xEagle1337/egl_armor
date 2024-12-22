if config.Core == 'QB' then
	Core = exports["qb-core"]:GetCoreObject()
else
	Core = exports["es_extended"]:getSharedObject()
end

function getPlayerFromId(source)
	if config.Core == 'QB' then
		return Core.Functions.GetPlayer(source)
	else
		return Core.GetPlayerFromId(source)
	end
end

function showNotification(message, type)
	if config.Core == 'QB' then
		Core.Notify(message, type)
	else
		TriggerEvent('esx:showNotification', message)
	end
end

function registerItems(itemName, useCallback)
    if config.Core == 'QB' then
        return Core.Functions.CreateUseableItem(itemName, function(source)
            useCallback(source)
        end)
    else
        return Core.RegisterUsableItem(itemName, function(source)
            useCallback(source)
        end)
    end
end

function removeItemfunction(source, itemName, quantity)
	local xPlayer = getPlayerFromId(source)
	
	if config.Core == 'QB' then
		return xPlayer.Functions.RemoveItem(itemName, quantity)
	else
		return xPlayer.removeInventoryItem(itemName, quantity)
	end
end