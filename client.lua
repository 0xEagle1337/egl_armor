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

RegisterNetEvent('esx_bodyarmor:applyArmor')
AddEventHandler('esx_bodyarmor:applyArmor', function(armorValue, itemName)
    local playerPed = GetPlayerPed(-1)
    if GetPedArmour(playerPed) > 0 then
        showNotification(locale['already_wear'], 5000)
    elseif not IsWearingAllowedBulletproofVest() then
        showNotification(locale['wrong_gilet'], 5000)
    else
        SetPedArmour(playerPed, armorValue)
        wearingArmor = true
        TriggerServerEvent('esx_bodyarmor:removeItem', itemName)
        showNotification(locale['equipped'], 5000)
        CheckArmorDepletion()
    end
end)

function CheckArmorDepletion()
    Citizen.CreateThread(function()
        while wearingArmor do
            Citizen.Wait(1000)
            local playerPed = GetPlayerPed(-1)

            if not IsWearingAllowedBulletproofVest() then
                SetPedArmour(playerPed, 0)
                wearingArmor = false
                showNotification(locale['unequipped'], 5000)
                break
            end

            if GetPedArmour(playerPed) == 0 then
                wearingArmor = false
                showNotification(locale['plate_destroyed'], 5000)
                break
            end
        end
    end)
end