local AnimatedActor = AnimatedActor or require "src/animatedactor"
local Vector = Vector or require "lib/vector"
local Explosion = AnimatedActor:extend()

function Explosion:new(x, y)
  Explosion.super.new(self, "src/textures/explosion.png", x, y, 0, 1, 0, 26)
  self.rot = 0
  self.scale = Vector.new(2, 2)
end

function Explosion:update(dt)
  Explosion.super.update(self, dt)
end

function Explosion:draw()
  local i = math.floor(self.actFrame)
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image, self.frames[i], xx, yy, rr, sx, sy, ox, oy, 0, 0)
end

return Explosion
