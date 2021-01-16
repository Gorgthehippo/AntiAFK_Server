-- AntiAFK Script for BeamMP Servers. (Client Side is Required to work!)
-- By Gorg & Titch

local MAX_AFK_TIME = 60
local PLAYERS = []
local running = false
local function TimerSystem()
  while running do
    for k, v in pairs(PLAYERS) do
      v = v + 1
      if v >= MAX_AFK_TIME then
        DropPlayer(k, 'You have been AFK for too long.')
      end
    end
    Sleep(1000)
  end
end


local function onInit()
  print("AntiAFK Initialising...")
  RegisterEvent("onPlayerJoin","onPlayerJoin")
	RegisterEvent("onPlayerDisconnect","onPlayerDisconnect")
  running = true
  CreateThread(TimerSystem)
end

local function onPlayerJoin(playerID)
  -- This is called when the player has loaded in.
  PLAYERS[playerID] = 0
end

local function onPlayerDisconnect(playerID)
	PLAYERS[playerID] = nil
end

onInit()
