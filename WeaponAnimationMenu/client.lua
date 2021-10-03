------------------------------------------------------------------------
------------------------------------------------------------------------
--			DO NOT EDIT IF YOU DON'T KNOW WHAT YOU'RE DOING			  --
--     							 									  --
--	   For support join my discord: https://discord.gg/Z9Mxu72zZ6	  --
------------------------------------------------------------------------
------------------------------------------------------------------------

-- variables
local display = false
local Player = PlayerPedId(), DecorGetInt(PlayerPedId())
local ped = PlayerPedId()

local AimAnim = GetResourceKvpString("AimAnim")
local HolsterAnim = GetResourceKvpString("HolsterAnim")

-- When bac is opened for the first time.
RegisterNetEvent("Andyyy:OpenWAM")
AddEventHandler('Andyyy:OpenWAM', function()
	SetDisplay(not display)
end)

-- Close when NUI callback is close.
RegisterNUICallback("close", function(data)
    SetDisplay(false)
end)

-- Chat suggestion for command.
TriggerEvent('chat:addSuggestion', "/" .. config.openCommand, 'Open the weapon animation menu', {})

-- Click on images callback.
RegisterNUICallback("1", function(data)
    SetResourceKvp("AimAnim", "nil")
    AimAnim = GetResourceKvpString("AimAnim")
    SetDisplay(false)
end)
RegisterNUICallback("2", function(data)
    SetResourceKvp("AimAnim", "GangsterAS")
    AimAnim = GetResourceKvpString("AimAnim")
    SetDisplay(false)
end)
RegisterNUICallback("3", function(data)
    SetResourceKvp("AimAnim", "HillbillyAS")
    AimAnim = GetResourceKvpString("AimAnim")
    SetDisplay(false)
end)

RegisterNUICallback("4", function(data)
    SetResourceKvp("HolsterAnim", "nil")
    HolsterAnim = GetResourceKvpString("HolsterAnim")
    SetDisplay(false)
end)
RegisterNUICallback("5", function(data)
    SetResourceKvp("HolsterAnim", "BackHolsterAnimation")
    HolsterAnim = GetResourceKvpString("HolsterAnim")
    SetDisplay(false)
end)
RegisterNUICallback("6", function(data)
    SetResourceKvp("HolsterAnim", "SideHolsterAnimation")
    HolsterAnim = GetResourceKvpString("HolsterAnim")
    SetDisplay(false)
end)

RegisterNUICallback("7", function(data)
    SetResourceKvp("HolsterAnim", "FrontHolsterAnimation")
    HolsterAnim = GetResourceKvpString("HolsterAnim")
    SetDisplay(false)
end)
RegisterNUICallback("8", function(data)
    SetResourceKvp("HolsterAnim", "AgressiveFrontHolsterAnimation")
    HolsterAnim = GetResourceKvpString("HolsterAnim")
    SetDisplay(false)
end)
RegisterNUICallback("9", function(data)
    SetResourceKvp("HolsterAnim", "SideLegHolsterAnimation")
    HolsterAnim = GetResourceKvpString("HolsterAnim")
    SetDisplay(false)
end)

-- aim style
CreateThread(function()
    while true do
        if AimAnim == "GangsterAS" then
            if CheckWeapon2(ped) then
                inVeh = IsPedInVehicle(PlayerPedId(-1), GetVehiclePedIsIn(PlayerPedId(-1), false), false)
                local _, hash = GetCurrentPedWeapon(Player, 1)
                if not inVeh then
                    loadAnimDict("combat@aim_variations@1h@gang")
                    if IsPlayerFreeAiming(PlayerId()) or (IsControlPressed(0, 24) and GetAmmoInClip(Player, hash) > 0) then
                        if not IsEntityPlayingAnim(Player, "combat@aim_variations@1h@gang", "aim_variation_a", 3) then
                            TaskPlayAnim(Player, "combat@aim_variations@1h@gang", "aim_variation_a", 8.0, -8.0, -1, 49, 0, 0, 0, 0)
                            SetEnableHandcuffs(Player, true)
                        end
                    elseif IsEntityPlayingAnim(Player, "combat@aim_variations@1h@gang", "aim_variation_a", 3) then
                        ClearPedTasks(Player)
                        SetEnableHandcuffs(Player, false)
                    end
                    Citizen.Wait(50)
                end
                Citizen.Wait(50)
            end
        elseif AimAnim == "HillbillyAS" then
            if CheckWeapon2(ped) then
                inVeh = IsPedInVehicle(PlayerPedId(-1), GetVehiclePedIsIn(PlayerPedId(-1), false), false)
                local _, hash = GetCurrentPedWeapon(Player, 1)
                if not inVeh then
                    loadAnimDict("combat@aim_variations@1h@hillbilly")
                    if IsPlayerFreeAiming(PlayerId()) or (IsControlPressed(0, 24) and GetAmmoInClip(Player, hash) > 0) then
                        if not IsEntityPlayingAnim(Player, "combat@aim_variations@1h@hillbilly", "aim_variation_a", 3) then
                            TaskPlayAnim(Player, "combat@aim_variations@1h@hillbilly", "aim_variation_a", 8.0, -8.0, -1, 49, 0, 0, 0, 0)
                            SetEnableHandcuffs(Player, true)
                        end
                    elseif IsEntityPlayingAnim(Player, "combat@aim_variations@1h@hillbilly", "aim_variation_a", 3) then
                        ClearPedTasks(Player)
                        SetEnableHandcuffs(Player, false)
                    end
                    Citizen.Wait(50)
                end
                Citizen.Wait(50)
            end
        end
        Citizen.Wait(80)
    end
end)

-- First thread Weapon drawing
CreateThread(function()
    while true do
        if HolsterAnim == "SideHolsterAnimation" then
            loadAnimDict("rcmjosh4")
            loadAnimDict("reaction@intimidation@cop@unarmed")
            if not IsPedInAnyVehicle(ped, false) then
                if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
                    if CheckWeapon(ped) then
                        if holstered then
                            blocked   = true
                                SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
                                TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
                                
                                    Citizen.Wait(100)
                                    SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
                                TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
                                    Citizen.Wait(400)
                                ClearPedTasks(ped)
                            holstered = false
                        else
                            blocked = false
                        end
                        Citizen.Wait(50)
                    else
                        if not holstered then
                                TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
                                    Citizen.Wait(500)
                                TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "outro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
                                    Citizen.Wait(60)
                                ClearPedTasks(ped)
                            holstered = true
                        end
                        Citizen.Wait(40)
                    end
                    Citizen.Wait(50)
                else
                    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                end
            else
                holstered = true
            end
        elseif HolsterAnim == "BackHolsterAnimation" then
            loadAnimDict("reaction@intimidation@1h")

            if not IsPedInAnyVehicle(ped, false) then
                if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
                    if CheckWeapon(ped) then
                        if holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                            blocked   = true
                                TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
                                    Citizen.Wait(600)
                                ClearPedTasks(ped)
                            holstered = false
                        else
                            blocked = false
                        end
                        Citizen.Wait(40)
                    else
                        if not holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                                TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "outro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0)
                                    Citizen.Wait(2000)
                                ClearPedTasks(ped)
                            holstered = true
                        end
                        Citizen.Wait(40)
                    end
                    Citizen.Wait(50)
                else
                    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                end
            else
                holstered = true
            end
        end
        Citizen.Wait(40)
    end
end)

-- Second thread for Weapon drawing
CreateThread(function()
    while true do
        if HolsterAnim == "FrontHolsterAnimation" then
            loadAnimDict("combat@combat_reactions@pistol_1h_gang")

            if not IsPedInAnyVehicle(ped, false) then
                if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
                    if CheckWeapon(ped) then
                        if holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                            blocked   = true
                                TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_gang", "0", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
                                    Citizen.Wait(600)
                                ClearPedTasks(ped)
                            holstered = false
                        else
                            blocked = false
                        end
                        Citizen.Wait(40)
                    else
                        if not holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                                TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_gang", "0", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0)
                                    Citizen.Wait(1000)
                                ClearPedTasks(ped)
                            holstered = true
                        end
                        Citizen.Wait(40)
                    end
                    Citizen.Wait(50)
                else
                    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                end
            else
                holstered = true
            end
        elseif HolsterAnim == "AgressiveFrontHolsterAnimation" then
            loadAnimDict("combat@combat_reactions@pistol_1h_hillbilly")
            loadAnimDict("combat@combat_reactions@pistol_1h_gang")

            if not IsPedInAnyVehicle(ped, false) then
                if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
                    if CheckWeapon(ped) then
                        if holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                            blocked   = true
                                TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_hillbilly", "0", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
                                    Citizen.Wait(600)
                                ClearPedTasks(ped)
                            holstered = false
                        else
                            blocked = false
                        end
                        Citizen.Wait(40)
                    else
                        if not holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                                TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_gang", "0", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0)
                                    Citizen.Wait(1000)
                                ClearPedTasks(ped)
                            holstered = true
                        end
                        Citizen.Wait(40)
                    end
                    Citizen.Wait(50)
                else
                    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                end
            else
                holstered = true
            end
        elseif HolsterAnim == "SideLegHolsterAnimation" then
            loadAnimDict("reaction@male_stand@big_variations@d")

            if not IsPedInAnyVehicle(ped, false) then
                if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
                    if CheckWeapon(ped) then
                        if holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                            blocked   = true
                                TaskPlayAnimAdvanced(ped, "reaction@male_stand@big_variations@d", "react_big_variations_m", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
                                    Citizen.Wait(500)
                                ClearPedTasks(ped)
                            holstered = false
                        else
                            blocked = false
                        end
                        Citizen.Wait(40)
                    else
                        if not holstered then
                            pos = GetEntityCoords(ped, true)
		                    rot = GetEntityHeading(ped)
                                TaskPlayAnimAdvanced(ped, "reaction@male_stand@big_variations@d", "react_big_variations_m", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0)
                                    Citizen.Wait(500)
                                ClearPedTasks(ped)
                            holstered = true
                        end
                        Citizen.Wait(40)
                    end
                else
                    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                end
                Citizen.Wait(50)
            else
                holstered = true
            end
        end
        Citizen.Wait(40)
    end
end)

-- Block thread
CreateThread(function()
    while true do
        if blocked then
            DisableControlAction(1, 25, true ) -- aim
            DisableControlAction(1, 140, true) -- mele attack
            DisableControlAction(1, 141, true) -- mele attack heavy
            DisableControlAction(1, 142, true) -- mele attack alt
            DisableControlAction(1, 23, true) -- enter vehicle
            DisablePlayerFiring(ped, true) -- Disable weapon firing
        end
        Citizen.Wait(100)
    end
end)

-- Functions
function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "open",
        status = bool
    })
end

function CheckWeapon(ped)
	if IsEntityDead(ped) then
		blocked = false
			return false
		else
			for i = 1, #config.DrawingWeapons do
				if GetHashKey(config.DrawingWeapons[i]) == GetSelectedPedWeapon(ped) then
					return true
				end
			end
		return false
	end
end

function CheckWeapon2(ped)
	if IsEntityDead(ped) then
		blocked = false
			return false
		else
			for i = 1, #config.AimWeapons do
				if GetHashKey(config.AimWeapons[i]) == GetSelectedPedWeapon(ped) then
					return true
				end
			end
		return false
	end
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(50)
	end
end