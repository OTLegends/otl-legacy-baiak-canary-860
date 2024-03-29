if CLIENT_VERSION < 850 then
	return
end

local internalNpcName = "A Frog"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 224,
}

npcConfig.flags = {
	floorchange = false,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

keywordHandler:addKeyword({ "prince" }, StdModule.say, { npcHandler = npcHandler, text = "If another prince comes to kiss me, I'll kick his ass so bad that he'll need a sedan chair to get away." })
keywordHandler:addKeyword({ "princess" }, StdModule.say, { npcHandler = npcHandler, text = "If another prince comes to kiss me, I'll kick his ass so bad that he'll need a sedan chair to get away." })
keywordHandler:addKeyword({ "kiss" }, StdModule.say, { npcHandler = npcHandler, text = "Don't even try to kiss me or I'll rondhouse kick you!" })
keywordHandler:addKeyword({ "talk" }, StdModule.say, { npcHandler = npcHandler, text = "Talking frogs don't exist, idiot. It's your fucking imagination tricking you. And now your imagination commands you to walk away." })
keywordHandler:addKeyword({ "frog" }, StdModule.say, { npcHandler = npcHandler, text = "Finally someone notices I'm a FROG. Congratulations, you're VERY observant... *sigh*" })
keywordHandler:addKeyword({ "quest" }, StdModule.say, { npcHandler = npcHandler, text = "A quest? Yeah I got a quest! Go and tell King Tibianus his son tried to kiss me again!" })
keywordHandler:addKeyword({ "pyrale" }, StdModule.say, { npcHandler = npcHandler, text = "Pyrale? That idiot transformed me into an human once. But my wife came and kissed me, so I'm a frog again." })
keywordHandler:addKeyword({ "ribbit" }, StdModule.say, { npcHandler = npcHandler, text = "Pyrale? That idiot transformed me into an human once. But my wife came and kissed me, so I'm a frog again." })

npcHandler:setMessage(MESSAGE_GREET, "*sigh* Yet another dumb adventurer.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Yeah, good bye and don't come again!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Hah! That idiot finally left.")
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
