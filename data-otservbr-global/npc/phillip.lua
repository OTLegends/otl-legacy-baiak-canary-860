if CLIENT_VERSION < 600 then
	return
end

local internalNpcName = "Phillip"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 128,
	lookHead = 116,
	lookBody = 54,
	lookLegs = 68,
	lookFeet = 76,
	lookAddons = 0,
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

keywordHandler:addKeyword({ "how", "are", "you" }, StdModule.say, { npcHandler = npcHandler, text = "I am fine, thank you very much." })
keywordHandler:addKeyword({ "sell" }, StdModule.say, { npcHandler = npcHandler, text = "My business is knowlegde and it is for free." })
keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I am honored to be teacher in this school." })
keywordHandler:addKeyword({ "teacher" }, StdModule.say, { npcHandler = npcHandler, text = "I run this school, there are other travelling teachers who we call Loremasters." })
keywordHandler:addKeyword({ "loremaster" }, StdModule.say, { npcHandler = npcHandler, text = "If you are lucky you'll meet one in your journeys." })
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "My name is Phillip." })
keywordHandler:addKeyword({ "time" }, StdModule.say, { npcHandler = npcHandler, text = "It is |TIME|." })
keywordHandler:addKeyword({ "help" }, StdModule.say, { npcHandler = npcHandler, text = "I will provide you with all knowledge I have." })
keywordHandler:addKeyword({ "monster" }, StdModule.say, { npcHandler = npcHandler, text = "Monsters come in different shape and power. It's said there is a zoo in the dwarfs' town." })
keywordHandler:addKeyword({ "dungeon" }, StdModule.say, { npcHandler = npcHandler, text = "Dungeons are places of danger and puzzles. In some of them a bright mind will serve you more then a blade." })
keywordHandler:addKeyword({ "sewer" }, StdModule.say, { npcHandler = npcHandler, text = "An interesting place you should consider to visit." })
keywordHandler:addKeyword({ "thank you" }, StdModule.say, { npcHandler = npcHandler, text = "You don't have to thank me, it's only my duty." })
keywordHandler:addKeyword({ "god" }, StdModule.say, { npcHandler = npcHandler, text = "To learn about gods, visit the temples and talk to the priests." })
keywordHandler:addKeyword({ "king" }, StdModule.say, { npcHandler = npcHandler, text = "The southern king is called Tibianus. He and our queen Eloise are in a constant struggle." })
keywordHandler:addKeyword({ "queen" }, StdModule.say, { npcHandler = npcHandler, text = "The southern king is called Tibianus. He and our queen Eloise are in a constant struggle." })
keywordHandler:addKeyword({ "rumour" }, StdModule.say, { npcHandler = npcHandler, text = "I don't like rumours." })
keywordHandler:addKeyword({ "gossip" }, StdModule.say, { npcHandler = npcHandler, text = "I don't like rumours." })
keywordHandler:addKeyword({ "news" }, StdModule.say, { npcHandler = npcHandler, text = "I don't like rumours." })
keywordHandler:addKeyword({ "weapon" }, StdModule.say, { npcHandler = npcHandler, text = "To learn about weapons read appropriate books or talk to the smiths." })
keywordHandler:addKeyword({ "magic" }, StdModule.say, { npcHandler = npcHandler, text = "To learn about magic talk to the guild leaders." })
keywordHandler:addKeyword({ "rebellion" }, StdModule.say, { npcHandler = npcHandler, text = "Rebellion? What for? We are contend with our situation." })
keywordHandler:addKeyword({ "in tod we trust" }, StdModule.say, { npcHandler = npcHandler, text = "Tod will come and save us all. He will bring freedom and beer to the men of Carlin." })
keywordHandler:addKeyword({ "lugri" }, StdModule.say, { npcHandler = npcHandler, text = "This servant of evil is protected by the dark gods and can't be harmed." })
keywordHandler:addKeyword({ "ferumbras" }, StdModule.say, { npcHandler = npcHandler, text = "He is a follower of evil. His powers were boosted by a sinister force and he is beyond human restrictions now." })
keywordHandler:addKeyword({ "excalibug" }, StdModule.say, { npcHandler = npcHandler, text = "This weapon is said to be very powerful and unique. It was hidden in ancient times and now is thought to be lost." })

npcHandler:setMessage(MESSAGE_GREET, "Hello, mighty adventurer |PLAYERNAME|. Can I teach you something you don't know?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Go and be careful. Remember what you have learned!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Did the bell ring?")
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
