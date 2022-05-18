import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "carrot"
import "player"

local pd <const> = playdate
local gfx <const> = pd.graphics

function addCarrot()
	Carrot(math.random(16, 400-16), math.random(16, 240-16))
end

function init()
	-- we initialize the random seed for the carrot coords
	math.randomseed(pd.getSecondsSinceEpoch())
	-- We create the player
	Player(pd.display.getWidth() / 2, pd.display.getHeight() / 2)
	-- We add a carrot
	addCarrot()
end

init()

function playdate.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
end

