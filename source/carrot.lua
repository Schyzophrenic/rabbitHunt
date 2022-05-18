import "CoreLibs/sprites"

local pd <const> = playdate
local gfx <const> = pd.graphics

class("Carrot").extends(gfx.sprite)

function Carrot:init(x, y)
    Carrot.super.init(self)
    local carrotImg = gfx.image.new("images/carrot")
    assert(carrotImg)

    self:setImage(carrotImg)
    self:moveTo(x, y)
    self:add()

    -- we set a collision box for collection
    self:setCollideRect(0, 0, self.width, self.height)
end

function Carrot:update()
    -- If there is a collision it has to be with the rabbit so we remove the carrot
    
end