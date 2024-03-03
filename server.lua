RegisterServerEvent('esx_bodyarmor:removeItem')
AddEventHandler('esx_bodyarmor:removeItem', function(itemName)
    removeItem(source, itemName, 1)
end)

local function applyBodyArmor(source, armorValue, itemName)
    local xPlayer = Core.GetPlayerFromId(source)
    TriggerClientEvent('esx_bodyarmor:applyArmor', source, armorValue, itemName)
end

for i, itemName in ipairs(config.Items) do
    Core.RegisterUsableItem(itemName, function(source)
        applyBodyArmor(source, config.Armor[i], itemName)
    end)
end