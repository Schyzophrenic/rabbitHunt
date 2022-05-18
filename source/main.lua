import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "carrot"
import "player"
import "scoreBoard"

local pd <const> = playdate
local gfx <const> = pd.graphics

function resetGame()
end

-- we initialize the random seed for the carrot coords
math.randomseed(pd.getSecondsSinceEpoch())

-- We create the main objects
-- The scoreBoard should be accessible anywhere
scoreBoard = ScoreBoard()
local player = Player(pd.display.getWidth() / 2, pd.display.getHeight() / 2)
local carrot = Carrot()

function playdate.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
end

