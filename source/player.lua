local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init(x, y)
    Player.super.init(self)
    
    self.speed = 3

    local playerImage = gfx.image.new("images/rabbit")
    assert(playerImage)
    self:setImage(playerImage)
    self:moveTo(x, y)
    self:add()

    -- We also save the image size for visibility test
    self.width, self.height = self:getSize()
end

-- moves the Player if it is still within the boundaries, or stuck it to the boundaries
function Player:movePlayer(offsetX, offsetY)
    local newX = self.x + offsetX
    local newY = self.y + offsetY

    -- if we are beyond boundaries, we set it to the max values
    if (newX < self.width/2) then 
        newX = self.width/2
    end
    if (newX > pd.display.getWidth() - self.width/2) then
        newX = pd.display.getWidth() - self.width/2
    end
    if (newY < self.height/2) then 
        newY = self.height/2
    end
    if (newY > pd.display.getHeight() - self.height/2) then
        newY = pd.display.getHeight() - self.height/2
    end

    self:moveTo(newX, newY)
end

function Player:update()
    if pd.buttonIsPressed(pd.kButtonUp) then
        self:movePlayer(0, -self.speed)
    end
    if pd.buttonIsPressed(pd.kButtonRight) then
        self:movePlayer(self.speed, 0)
    end
    if pd.buttonIsPressed(pd.kButtonDown) then
        self:movePlayer(0, self.speed)
    end
    if pd.buttonIsPressed(pd.kButtonLeft) then
        self:movePlayer(-self.speed, 0)
    end
end