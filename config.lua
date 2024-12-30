config = {}

config.Locales = 'fr' -- or en
config.Core = 'ESX' -- or QB

config.Items = {'plate1', 'plate2', 'plate3', 'plate4'} -- items name of your plate
config.Armor = {25, 50, 75, 100} -- quantity of armor for each plate
config.allowedVests = {13, 22, 23, 24, 25, 26, 27, 29, 34, 39, 42, 44, 49, 51, 54, 60, 80} -- allowed cloth. from body armor category only.
config.replaceMode = "empty" -- Options: "fill", "empty", "override"
-- fill option: Add armor incrementally up to the maximum (100). Players can stacks plates
-- empty option: Apply armor only if current armor is 0. Players can wear one plate at a time
-- override option: Replace current armor with the new armor value. Players can wear new plate by replacing the old one