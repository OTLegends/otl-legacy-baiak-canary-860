if CLIENT_VERSION < 1180 then
	return
end

local internalNpcName = "Oberon's Bile"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookTypeEx = 10980,
}

npcConfig.flags = {
	floorchange = false,
}

-- npcType registering the npcConfig table
npcType:register(npcConfig)
