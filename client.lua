local language = config.Locales
local locale = Locales[language]

local wearingArmor = false

function IsWearingAllowedBulletproofVest()
    local playerPed = GetPlayerPed(-1)
    local vestDrawable = GetPedDrawableVariation(playerPed, 9)

    for _, allowedVest in ipairs(config.allowedVests) do
        if vestDrawable == allowedVest then
            return true
        end
    end
    return false
end

RegisterNetEvent('egl_armor:applyArmor')
AddEventHandler('egl_armor:applyArmor', function(armorValue, itemName)
    local playerPed = GetPlayerPed(-1)
    local currentArmor = GetPedArmour(playerPed)
    local maxArmor = 100

    if not IsWearingAllowedBulletproofVest() then
        showNotification(locale['wrong_gilet'], "info")
        return
    end

    if config.replaceMode == "fill" then
        if currentArmor >= maxArmor then
            showNotification(locale['already_full'], "info")
            return
        end
        local newArmor = math.min(currentArmor + armorValue, maxArmor)
        SetPedArmour(playerPed, newArmor)
        if newArmor == maxArmor then
            showNotification(locale['max_armor_reached'], "info")
        end

    elseif config.replaceMode == "empty" then
        if currentArmor > 0 then
            showNotification(locale['already_wear'], "info")
            return
        end
        SetPedArmour(playerPed, armorValue)
        wearingArmor = true

    elseif config.replaceMode == "override" then
        SetPedArmour(playerPed, armorValue)
        showNotification(locale['armor_replaced'], "info")
    end

    TriggerServerEvent('egl_armor:removeItem', itemName)
    showNotification(locale['equipped'], "info")
    CheckArmorDepletion()
end)



function CheckArmorDepletion()
    Citizen.CreateThread(function()
        while wearingArmor do
            Citizen.Wait(1000)
            local playerPed = GetPlayerPed(-1)

            if not IsWearingAllowedBulletproofVest() then
                SetPedArmour(playerPed, 0)
                wearingArmor = false
                showNotification(locale['unequipped'], "info")
                break
            end

            if GetPedArmour(playerPed) == 0 then
                wearingArmor = false
                showNotification(locale['plate_destroyed'], "info")
                break
            end
        end
    end)
end