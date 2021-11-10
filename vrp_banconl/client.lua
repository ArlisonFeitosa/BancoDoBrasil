-- Convertido e Editador por ZarolhoGnomasso#4862

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_banco")


local giveCashAnywhere = false 
local withdraWAnywhere = false 
local depositAnywhere = false 
local displayBankBlips = true 
local enableBankingGui = true 

local banks = {
  {name="Banco", id=108, x=150.266, y=-1040.203, z=29.374},
  {name="Banco", id=108, x=-1212.980, y=-330.841, z=37.787},
  {name="Banco", id=108, x=-2962.582, y=482.627, z=15.703},
  {name="Banco", id=108, x=-112.202, y=6469.295, z=31.626},
  {name="Banco", id=108, x=314.187, y=-278.621, z=54.170},
  {name="Banco", id=108, x=-351.534, y=-49.529, z=49.042},
  {name="Banco", id=108, x=1153.7,y=-326.8,z= 69.21},
  {name="ATM", id=277, x=-31.49,y=-1121.44,z=26.55 },
	{name="ATM", id=277, x=-1314.76,y=-835.98,z=16.96 },
	{name="ATM", id=277, x=-1315.72,y=-834.70,z=16.96 },
	{name="ATM", id=277, x=147.57,y=-1035.77,z=29.34 },
	{name="ATM", id=277, x=145.96,y=-1035.19,z=29.34 },
	{name="ATM", id=277, x=24.45,y=-945.97,z=29.35 },
	{name="ATM", id=277, x=5.24,y=-919.84,z=29.55 },
	{name="ATM", id=277, x=119.08,y=-883.70,z=31.12 },
	{name="ATM", id=277, x=112.60,y=-819.41,z=31.33 },
	{name="ATM", id=277, x=114.41,y=-776.43,z=31.41 },
	{name="ATM", id=277, x=111.30,y=-775.25,z=31.43 },
	{name="ATM", id=277, x=296.46,y=-894.22,z=29.23 },
	{name="ATM", id=277, x=295.77,y=-896.10,z=29.22 },
	{name="ATM", id=277, x=-203.83,y=-861.38,z=30.26 },
	{name="ATM", id=277, x=-301.70,y=-830.00,z=32.41 },
	{name="ATM", id=277, x=-303.28,y=-829.72,z=32.41 },
	{name="ATM", id=277, x=289.08,y=-1256.83,z=29.44 },
	{name="ATM", id=277, x=288.84,y=-1282.33,z=29.63 },
	{name="ATM", id=277, x=33.16,y=-1348.25,z=29.49 },
	{name="ATM", id=277, x=-56.89,y=-1752.10,z=29.42 },
	{name="ATM", id=277, x=-721.04,y=-415.52,z=34.98 },
	{name="ATM", id=277, x=89.69,y=2.47,z=68.30 },
	{name="ATM", id=277, x=527.35,y=-160.72,z=57.09 },
	{name="ATM", id=277, x=-846.29,y=-341.30,z=38.68 },
	{name="ATM", id=277, x=-846.83,y=-340.21,z=38.68 },
	{name="ATM", id=277, x=-1205.03,y=-326.27,z=37.84 },
	{name="ATM", id=277, x=-1205.76,y=-324.80,z=37.85 },
	{name="ATM", id=277, x=-1305.40,y=-706.38,z=25.32 },
	{name="ATM", id=277, x=158.63,y=234.22,z=106.62 },
	{name="ATM", id=277, x=1153.77,y=-326.69,z=69.20 },
	{name="ATM", id=277, x=1167.00,y=-456.07,z=66.79 },
	{name="ATM", id=277, x=1138.23,y=-468.91,z=66.73 },
	{name="ATM", id=277, x=238.33,y=215.97,z=106.28 },
	{name="ATM", id=277, x=237.90,y=216.88,z=106.28 },
	{name="ATM", id=277, x=237.48,y=217.78,z=106.28 },
	{name="ATM", id=277, x=237.05,y=218.71,z=106.28 },
	{name="ATM", id=277, x=236.61,y=219.66,z=106.28 },
	{name="ATM", id=277, x=285.43,y=143.39,z=104.17 },
	{name="ATM", id=277, x=356.96,y=173.55,z=103.06 },
	{name="ATM", id=277, x=380.75,y=323.37,z=103.56 },
	{name="ATM", id=277, x=228.19,y=338.37,z=105.56 },
	{name="ATM", id=277, x=1077.70,y=-776.54,z=58.24 },
	{name="ATM", id=277, x=-165.14,y=232.74,z=94.92 },
	{name="ATM", id=277, x=-165.15,y=234.81,z=94.92 },
	{name="ATM", id=277, x=-3040.78,y=593.09,z=7.90 },
	{name="ATM", id=277, x=-1827.29,y=784.87,z=138.30 },
	{name="ATM", id=277, x=540.32,y=2671.14,z=42.15 },
	{name="ATM", id=277, x=-2072.36,y=-317.29,z=13.31 },
	{name="ATM", id=277, x=2683.11,y=3286.56,z=55.24 },
	{name="ATM", id=277, x=1171.52,y=2702.57,z=38.17 },
	{name="ATM", id=277, x=1172.49,y=2702.59,z=38.17 },
	{name="ATM", id=277, x=-2956.88,y=487.64,z=15.46 },
	{name="ATM", id=277, x=-2958.99,y=487.74,z=15.46 },
	{name="ATM", id=277, x=-526.60,y=-1222.90,z=18.45 },
	{name="ATM", id=277, x=-717.71,y=-915.70,z=19.21 },
	{name="ATM", id=277, x=1701.19,y=6426.50,z=32.76 },
	{name="ATM", id=277, x=1735.22,y=6410.51,z=35.03 },
	{name="ATM", id=277, x=-3241.15,y=997.61,z=12.55 },
	{name="ATM", id=277, x=-3144.37,y=1127.60,z=20.85 },
	{name="ATM", id=277, x=174.14,y=6637.93,z=31.57 },
	{name="ATM", id=277, x=155.91,y=6642.87,z=31.60 },
	{name="ATM", id=277, x=-95.54,y=6457.18,z=31.46 },
	{name="ATM", id=277, x=-97.25,y=6455.44,z=31.46 },
	{name="ATM", id=277, x=1968.09,y=3743.53,z=32.34 },
	{name="ATM", id=277, x=1703.01,y=4933.54,z=42.06 },
	{name="ATM", id=277, x=2558.82,y=351.01,z=108.62 },
	{name="ATM", id=277, x=2558.48,y=389.45,z=108.62 },
	{name="ATM", id=277, x=-386.72,y=6046.08,z=31.50 },
	{name="ATM", id=277, x=-282.98,y=6226.08,z=31.49 },
	{name="ATM", id=277, x=-132.93,y=6366.53,z=31.47 },
	{name="ATM", id=277, x=-1571.03,y=-547.37,z=34.95 },
	{name="ATM", id=277, x=-1570.09,y=-546.69,z=34.95 },
	{name="ATM", id=277, x=-712.89,y=-818.90,z=23.72 },
	{name="ATM", id=277, x=-709.99,y=-818.89,z=23.72 },
	{name="ATM", id=277, x=-273.06,y=-2024.50,z=30.14 },
	{name="ATM", id=277, x=-262.00,y=-2012.28,z=30.14 },
	{name="ATM", id=277, x=-821.66,y=-1081.91,z=11.13 },
	{name="ATM", id=277, x=129.24,y=-1291.15,z=29.26 },
	{name="ATM", id=277, x=129.68,y=-1291.92,z=29.26 },
	{name="ATM", id=277, x=130.10,y=-1292.64,z=29.26 },
	{name="ATM", id=277, x=-1391.03,y=-590.32,z=30.31 },
	{name="ATM", id=277, x=1686.84,y=4815.79,z=42.00 },
	{name="ATM", id=277, x=-258.84,y=-723.36,z=33.47 },
	{name="ATM", id=277, x=-256.22,y=-715.97,z=33.52 },
	{name="ATM", id=277, x=-254.41,y=-692.47,z=33.60 },
	{name="ATM", id=277, x=296.17,y=-591.52,z=43.27 },
	{name="ATM", id=277, x=419.05,y=-986.33,z=29.38 },
	{name="ATM", id=277, x=-618.28,y=-708.93,z=30.05 },
	{name="ATM", id=277, x=-618.23,y=-706.90,z=30.05 },
	{name="ATM", id=277, x=-614.59,y=-704.84,z=31.23 },
	{name="ATM", id=277, x=-611.94,y=-704.82,z=31.23 },
	{name="ATM", id=277, x=-3240.59,y=1008.60,z=12.83 }, 
  --{name="Banco", id=106, x=241.727, y=220.706, z=106.286, principal = true},
  {name="Banco", id=108, x=1175.0643310547, y=2706.6435546875, z=38.094036102295}
}

Citizen.CreateThread(function()
  if displayBankBlips then
    for k,v in ipairs(banks)do
      local blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(blip, v.id)
      SetBlipScale(blip, 0.4)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING");
      AddTextComponentString(tostring(v.name))
      EndTextCommandSetBlipName(blip)
    end
  end
end)

local atBank = false
local bankOpen = false

RegisterNetEvent('send:banco')
AddEventHandler('send:banco', function(banco)
  TransitionToBlurred(1000)
	SetNuiFocus(true, true)
	SendNUIMessage({
    openBank = true,
		banco = banco
	})
end)


function closeGui()
  TransitionFromBlurred(1000)
  SetNuiFocus(false)
  SendNUIMessage({openBank = false})
  bankOpen = false
  atmOpen = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2)
		local pos = GetEntityCoords(PlayerPedId(), true)
		for k, j in pairs(banks) do
			if(Vdist(pos.x, pos.y, pos.z, j.x, j.y, j.z) < 150.0) then
				if(Vdist(pos.x, pos.y, pos.z, j.x, j.y, j.z) < 5.0) then
					draw3DText(j.x, j.y, j.z, "Pressione [~g~E~w~] para acessar o banco")
				end
			end
		end
	end
end)

if enableBankingGui then
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if(IsNearBank()) then
        atBank = true
        if IsControlJustPressed(1, 51) and not vRP.isHandcuffed()  then 
            if bankOpen then
              closeGui()
              bankOpen = false
            else
              TriggerServerEvent("bank:update")
              TriggerServerEvent("get:banco")
              bankOpen = true
          end
      	end
      else
        if(bankOpen) then
          closeGui()
        end
        atBank = false
        bankOpen = false
      end
    end
  end)
end

Citizen.CreateThread(function()
  while true do
    if bankOpen then
      local ply = PlayerPedId()
      local active = true
      DisableControlAction(0, 1, active) 
      DisableControlAction(0, 2, active) 
      DisableControlAction(0, 24, active) 
      DisablePlayerFiring(ply, true) 
      DisableControlAction(0, 142, active)
      DisableControlAction(0, 106, active) 
    end
    Citizen.Wait(0)
  end
end)

-- NUI Callback Methods
RegisterNUICallback('close', function(data, cb)
  closeGui()
  cb('ok')
end)

RegisterNUICallback('balance', function(data, cb)
  SendNUIMessage({openSection = "balance"})
  cb('ok')
end)

RegisterNUICallback('multasbalance', function(data, cb)
  SendNUIMessage({openSection = "multasbalance"})
  cb('ok')
end)
RegisterNUICallback('walletbalance', function(data, cb)
  SendNUIMessage({openSection = "walletbalance"})
  cb('ok')
end)

RegisterNUICallback('withdraw', function(data, cb)
  SendNUIMessage({openSection = "withdraw"})
  cb('ok')
end)

RegisterNUICallback('deposit', function(data, cb)
  SendNUIMessage({openSection = "deposit"})
  cb('ok')
end)

RegisterNUICallback('transfer', function(data, cb)
  SendNUIMessage({openSection = "transfer"})
  cb('ok')
end)

RegisterNUICallback('quickCash', function(data, cb)
  TriggerServerEvent('bank:quickCash')
  cb('ok')
end)

RegisterNUICallback('erroMulta', function()
  TriggerEvent('Notify',"negado","Você não tem nenhuma multa para pagar")
end)
RegisterNUICallback('erroMulta2', function()
  TriggerEvent('Notify',"negado","Valor desejado inexistente")
end)

RegisterNUICallback('withdrawSubmit', function(data, cb)
  TriggerEvent('bank:withdraw', data.amount)
  cb('ok')
end)

RegisterNUICallback('depositSubmit', function(data, cb)
  TriggerEvent('bank:deposit', data.amount)
  cb('ok')
end)

RegisterNUICallback('pagarMulta', function(data,cb)
  TriggerEvent('bank:pagarmulta', tonumber(data.amount))
  cb('ok')
end)

RegisterNUICallback('transferSubmit', function(data, cb)
  local toPlayer = data.toPlayer
  local amount = data.amount
  TriggerServerEvent("bank:transfer", toPlayer, tonumber(amount))
end)

function IsNearBank()
  local ply = PlayerPedId()
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(banks) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if (distance <= 3) then
      return true
    end
  end
end

function IsNearPlayer(player)
  local ply = PlayerPedId()
  local plyCoords = GetEntityCoords(ply, 0)
  local ply2 = GetPlayerPed(GetPlayerFromServerId(player))
  local ply2Coords = GetEntityCoords(ply2, 0)
  local distance = GetDistanceBetweenCoords(ply2Coords["x"], ply2Coords["y"], ply2Coords["z"],  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
  if (distance <= 5) then
    return true
  end
end

RegisterNetEvent('bank:pagarmulta')
AddEventHandler('bank:pagarmulta', function(amount)
  if(IsNearBank() == true or depositAnywhere == true ) then
    TriggerServerEvent("bank:pagarmulta", tonumber(amount))
  else
    vRP.notifyError("Você só pode pagar multa em um banco!")
  end
end)

RegisterNetEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
  if(IsNearBank() == true or depositAnywhere == true ) then
    TriggerServerEvent("bank:deposit", tonumber(amount))
  else
    vRP.notifyError("Você só pode depositar em um banco!")
  end
end)

RegisterNetEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
  if (IsNearBank() == true or withdraWAnywhere == true) then
    TriggerServerEvent("bank:withdraw", tonumber(amount))
  else
    vRP.notifyError("Você só pode sacar em um banco!")
  end
end)

RegisterNetEvent('bank:givecash')
AddEventHandler('bank:givecash', function(toPlayer, amount)
  if(IsNearPlayer(toPlayer) == true or giveCashAnywhere == true) then
    local player2 = GetPlayerFromServerId(toPlayer)
    local playing = IsPlayerPlaying(player2)
    if (playing ~= false) then
      TriggerServerEvent("bank:givecash", toPlayer, tonumber(amount))
      vRP.notify("Você transferiu " .. tonumber(amount) .. " para " .. toPlayer)
    else
      vRP.notifyWarning("Cidadão fora da cidade!")
    end
  else
    vRP.notifyWarning("Cidadão não mora nessa cidade!")
  end
end)

RegisterNetEvent('banking:updateBalance')
AddEventHandler('banking:updateBalance', function(balance, walletbalance, multasbalance,   identidade)
	SendNUIMessage({
		updateBalance = true,
    balance = balance,
    walletbalance = walletbalance,
    multasbalance = multasbalance,   
    identidade = identidade
    
	})
end)

RegisterNetEvent("banking:addBalance")
AddEventHandler("banking:addBalance", function(amount)
	SendNUIMessage({
		addBalance = true,
		amount = amount
	})
end)

RegisterNetEvent("banking:removeBalance")
AddEventHandler("banking:removeBalance", function(amount)
	SendNUIMessage({
		removeBalance = true,
		amount = amount
	})
end)


function draw3DText(x,y,z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 370
	DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end