local pd <const> = playdate
local gfx <const> = pd.graphics

class("ScoreBoard").extends(gfx.sprite)

function ScoreBoard:init()
    ScoreBoard.super.init(self)

    self.score = 0
    self:updateDisplay()
    self:setCenter(0, 0)
    self:moveTo(5, 5)
    self:add()
end

function ScoreBoard:incrementScore()
    self.score += 1
    self:updateDisplay()
end

function ScoreBoard:updateDisplay()
    local scoreText = "Score: " .. self.score
    local textW, textH = gfx.getTextSize(scoreText)
    local scoreImg = gfx.image.new(textW, textH)
    gfx.pushContext(scoreImg)
        gfx.drawText(scoreText, 0, 0)
    gfx.popContext()
    self:setImage(scoreImg)
end
