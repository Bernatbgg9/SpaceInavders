Actor = Actor or require "src/actor"
local HUD = Actor:extend()
local font = love.graphics.newFont("src/textures/font.ttf", 30)

function HUD:new()
  self.vidas = 3
  self.hp = ("HP: ".. self.vidas)
  self.hpx = 10
  self.hpy = 10
  self.pp = 0
  self.ppx = 350
  self.ppy = 10
  self.pppy = 300
end
function HUD:update(dt)
    self.hp = ("HP: ".. self.vidas)
end
function HUD:draw()
  love.graphics.setFont(font)
  love.graphics.print(self.hp, self.hpx,self.hpy)
  love.graphics.print(self.pp, self.ppx,self.ppy)
  if self. vidas <= 0 then
   love.graphics.print("YOU DIED", self.ppx, self.pppy )
  end
end

return HUD