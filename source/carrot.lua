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
end