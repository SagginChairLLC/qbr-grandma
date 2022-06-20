-- Prompt
Citizen.CreateThread(function()
	for k, v in pairs(Config.ReviveLocations) do
		exports['qbr-core']:createPrompt(v.Type, v.coords, Config.ReviveKey, 'Get Help From Grandma ' .. v.name, {
			type = 'server',
			event = 'qbr-grandma:server:checkmoney',
			args = {},
		})
		if v.showblip == true then
			local BlipPackage = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
			SetBlipSprite(BlipPackage, -924021303, 1)
			SetBlipScale(BlipPackage, 0.2)
			Citizen.InvokeNative(0x9CB1A1623062F402, BlipPackage, v.name)
		end
	end
end)


--Events
RegisterNetEvent('qbr-grandma:client:startrevive')
AddEventHandler('qbr-grandma:client:startrevive', function()
	local revivetime = Config.WaitTime * 1000
	exports['qbr-core']:Progressbar("search_register", "Getting Help", revivetime, false, true, {
		disableMovement = false,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = "script_common@dead@male",
		anim = "faceup_01",
		flags = 1,
	}, {}, {}, function() -- Done
		ClearPedTasks(PlayerPedId())     
		TriggerEvent('hospital:client:Revive')
	end, function()
		ClearPedTasks(PlayerPedId())  
	end)
end)

--Not enough cash notify
RegisterNetEvent('qbr-grandma:client:notenoughmoney')
AddEventHandler('qbr-grandma:client:notenoughmoney', function()
exports['qbr-core']:Notify(8, 'Not Enough Cash', 5000, 'This practice is not free', 'itemtype_textures', 'itemtype_cash_arthur', 'COLOR_GREEN')
end)