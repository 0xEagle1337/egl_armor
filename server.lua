RegisterServerEvent('egl_armor:removeItem')
AddEventHandler('egl_armor:removeItem', function(itemName)
    removeItem(source, itemName, 1)
end)

local function applyBodyArmor(source, armorValue, itemName)
    local xPlayer = getPlayerFromId(source)
    TriggerClientEvent('egl_armor:applyArmor', source, armorValue, itemName)
end

for i, itemName in ipairs(config.Items) do
    registerItems(itemName, function(source)
        applyBodyArmor(source, config.Armor[i], itemName)
    end)
end