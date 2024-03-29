local communicates = {
	"Welcome to Canary Server! Visit the organization to see all our work: https://github.com/opentibiabr",
	"Did you like it? Help support what we do here with a donation by visiting the link: https://docs.opentibiabr.com/home/donate/",
	"Visit our discord to ask questions or report issues: https://discord.gg/gvTj5sh9Mp",
}

local scriptConfig = {
	registerPositions = {
		{ x = 4998, y = 5000, z = 7 },
		{ x = 4971, y = 5300, z = 5 },
		{ x = 4802, y = 5088, z = 7 },
		{ x = 5518, y = 5126, z = 6 },
		{ x = 5852, y = 5295, z = 5 },
		{ x = 1940, y = 1345, z = 7 },
		{ x = 4709, y = 4186, z = 7 },
	},
}

local worldBoard = Action()

function worldBoard.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- If the item id is not the one on the worldboard, it will return here
	if item:getId() ~= ITEM_WORLD_BOARD then
		return false
	end

	for index, value in pairs(communicates) do
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, value)
	end
	return true
end

-- Usage: action:position(position, itemId)
-- Explanation: The variable "item id" is optional, the id or the name of the item can be added, the item will be created in the map if it does not exist. If it already exists on the map, it will send a warning informing (in the distro) so the id must be removed so that the warning disappears keeping only the position)
for index, value in pairs(scriptConfig.registerPositions) do
	worldBoard:position(value, ITEM_WORLD_BOARD)
end

worldBoard:register()
