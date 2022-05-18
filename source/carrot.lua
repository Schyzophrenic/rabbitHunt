local pd <const> = playdate
local gfx <const> = pd.graphics

class("Carrot").extends(gfx.sprite)

function Carrot:init()
    Carrot.super.init(self)

    local carrotImg = gfx.image.new("images/carrot")
    assert(carrotImg)

    self:setImage(carrotImg)
    self:moveToRandom()
    -- we set a collision box for collection
    self:setCollideRect(0, 0, self:getSize())
    self:add()
end

function Carrot:moveToRandom()
    self:moveTo(math.random(16, 400-16), math.random(16, 240-16))
end

function Carrot:update()
    -- If there is a collision it has to be with the rabbit so we remove the carrot
    -- Very basic collision system, it would need to be changed if we have more
	-- than 2 sprites on screen
	local collisions = self:overlappingSprites()
    if #collisions >= 1 then
        self:moveToRandom()
        scoreBoard:incrementScore()
    end
end