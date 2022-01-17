RegisterNetEvent("zad:autodel")
AddEventHandler("zad:autodel", function ()
    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then
            SetVehicleHasBeenOwnedByPlayer(vehicle, false)
            SetEntityAsMissionEntity(vehicle, false, false)
            DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then
                DeleteVehicle(vehicle)
            end
        end
    end
end)

Citizen.CreateThread(function()
  while true do
      local time = config.Dvtime
      while (time ~= 0) do
          Wait( 1000 )
          time = time - 1
      end
      TriggerEvent("chat:addMessage", {
            args={config.AnnounceMessage}
		  })
      TriggerEvent("zad:autodel") -- This is a trigger
    end
end)
