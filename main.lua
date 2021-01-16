-- AntiAFK Script for BeamMP Servers. (Client Side is Required to work!)
-- By Gorg & Titch

-- Do you want to use this to kick AFK players? (true|false)
local CHECK_FOR_AFK = true
-- How many seconds of AFK do you want to kick them after?
local MAX_AFK_TIME = 60

-------------------------------------------------------------------------------
-- DO NOT TOUCH ANYTHING BELOW HERE! YOU HAVE BEEN WARNED!
-------------------------------------------------------------------------------

local PLAYERS = []

local function TimerSystem()
  while CHECK_FOR_AFK do
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
