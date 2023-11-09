Actor = Actor or require "src/actor"
Bullet = Bullet or require "src/bullet"
local Player = Actor:extend()

function Player:new(x, y)
    Player.super.new(self, "src/textures/nave.png", 400, 500, 50, 1, 0)
    self.hp = 5
    self.points = 0
end

function Player:update(dt)

end

function Player:draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    love.graphics.draw(self.image, xx, yy, rr, sx, sy, ox, oy, 0, 0)
end

function Player:keyPressed(key)
    if key == "space" then
      local a = Bullet()
      a.position.x = self.position.x
      a.position.y = self.position.y
      a.forward = self.forward
      table.insert(actorList, a)
    end
  end

return Player
