local language = config.Locales
local locale = Locales[language]

local wearingArmor = false

local allowedVestSet = {}
for _, v in ipairs(config.allowedVests) do
    allowedVestSet[v] = true
end

local function IsWearingAllowedBulletproofVest()
    local drawable = GetPedDrawableVariation(PlayerPedId(), 9)
    return allowedVestSet[drawable] == true
end

local function startDepletionLoop()
    if wearingArmor then return end
    wearingArmor = true

    Citizen.CreateThread(function()
        while wearingArmor do
            Citizen.Wait(1000)
            local playerPed = PlayerPedId()

            if not IsWearingAllowedBulletproofVest() then
                SetPedArmour(playerPed, 0)
                showNotification(locale['unequipped'], "info")
                break
            end

            if GetPedArmour(playerPed) == 0 then
                showNotification(locale['plate_destroyed'], "info")
                break
            end
        end

        wearingArmor = false
    end)
end

RegisterNetEvent('egl_armor:applyArmor')
AddEventHandler('egl_armor:applyArmor', function(armorValue, itemName)
    local playerPed = PlayerPedId()
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

    elseif config.replaceMode == "override" then
        SetPedArmour(playerPed, armorValue)
        showNotification(locale['armor_replaced'], "info")
    end

    TriggerServerEvent('egl_armor:removeItem', itemName)
    showNotification(locale['equipped'], "info")
    
    startDepletionLoop()
end)