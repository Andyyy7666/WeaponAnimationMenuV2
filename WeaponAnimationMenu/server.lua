if GetCurrentResourceName() ~= "WeaponAnimationMenu" then
    print("Error: Change the resource name to \"WeaponAnimationMenu\" or it won't work!")
end

-- open menu.
RegisterCommand(config.openCommand, function(source, args, rawCommand)
    TriggerClientEvent('Andyyy:OpenWAM', source)
end, false)