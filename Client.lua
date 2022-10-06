
local npc = nil
local actual = ""
local spawned = 0
local area = 0
local actual2 = ""
local sleep = true
local created_blips = {}

function Distance(coords, coords2)
	return #(coords-coords2)
end

if Config.wantnpc then
	Citizen.CreateThread(function()
		while true do
		Citizen.Wait(0)
			local coords = GetEntityCoords(PlayerPedId())
			for k,v in pairs(Config.npcloc) do
				if #(coords - v.pos) < v.dist then
					actual = coords
					if spawned < v.npcarea and actual2 ~= v.tipo then
						sleep = false
						TriggerEvent("royal:npcs", v.tipo, v.pos, v.he)
						actual2 = v.tipo
						spawned = spawned + 1
					end
					
				elseif actual ~= "" then
					if #(coords - actual) > v.dist and #(coords - v.apos) > v.dist then
						SetEntityAsNoLongerNeeded( npc )
						SetEntityAsNoLongerNeeded( npc2 )
						DeleteEntity( npc )
						DeleteEntity( npc2 )
						npc = nil
						actual = ""
						actual2 = ""
						spawned = 0
						sleep = true	
					end
				end
				if sleep then 
					Citizen.Wait(500)
				end
			end
		end	
	end)
end




RegisterNetEvent("royal:npcs")
AddEventHandler("royal:npcs", function(tipo, pos, he)
				if npc == nil then
					local coords = GetEntityCoords(PlayerPedId())
					while not HasModelLoaded( GetHashKey(tipo) ) do
						Wait(500)
						modelrequest( GetHashKey(tipo) )
					end
					npc = CreatePed(GetHashKey(tipo), pos, he, false, false, 0, 0)
					while not DoesEntityExist(npc) do
							Wait(300)
					end
					Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
					FreezeEntityPosition(npc, true)
					SetEntityInvincible(npc, true)
					TaskStandStill(npc, -1)
					SetEntityCanBeDamagedByRelationshipGroup(npc, false, `PLAYER`)
					SetEntityAsMissionEntity(npc, true, true)
				else
					local coords = GetEntityCoords(PlayerPedId())
					while not HasModelLoaded( GetHashKey(tipo) ) do
						Wait(500)
						modelrequest( GetHashKey(tipo) )
					end
					npc2 = CreatePed(GetHashKey(tipo), pos, he, false, false, 0, 0)
					while not DoesEntityExist(npc2) do
							Wait(300)
					end
					Citizen.InvokeNative(0x283978A15512B2FE, npc2, true)
					FreezeEntityPosition(npc2, true)
					SetEntityInvincible(npc2, true)
					TaskStandStill(npc2, -1)
					SetEntityCanBeDamagedByRelationshipGroup(npc2, false, `PLAYER`)
					SetEntityAsMissionEntity(npc2, true, true)
				end
end)


AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	SetEntityAsNoLongerNeeded(npc)	
	DeleteEntity(npc)
end)

if Config.wantblip then
	Citizen.CreateThread(function()
		for k,v in pairs(Config.npcloc) do
			if v.blipON then
				local blip = Citizen.InvokeNative(0x554D9D53F696D002, GetHashKey("BLIP_STYLE_PICKUP"), v.pos)
				blip = Citizen.InvokeNative(0x554D9D53F696D002, GetHashKey("BLIP_STYLE_PICKUP"), v.pos)
				Citizen.InvokeNative(0x662D364ABF16DE2F, blip, GetHashKey(v.modi))
				SetBlipSprite(blip, v.sprite, 0)
				SetBlipScale(blip, 0.2)
				Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.name)
			end
		end
	end)
end


function modelrequest( model )
    Citizen.CreateThread(function()
        RequestModel( model )
    end)
end