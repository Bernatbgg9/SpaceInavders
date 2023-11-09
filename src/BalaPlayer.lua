Actor = Actor or require "src/actor"
local BalaPlayer = Actor:extend()

function BalaPlayer:new(x, y)
   BalaPlayer.super.new(self, "src/textures/balaBueno.png", x, y, 200, 0, 1)
   --self.scale.x = 2
   --self.scale.y = 2
end

function BalaPlayer:update(dt)
   --BalaPlayer.super.update(self, dt)
   self.position.y = self.position.y - self.speed * dt
end

function BalaPlayer:draw()
   local xx = self.position.x
   local ox = self.origin.x
   local yy = self.position.y
   local oy = self.origin.y
   local sx = self.scale.x
   local sy = self.scale.y
   local rr = self.rot
   love.graphics.draw(self.image, xx, yy, rr, sx, sy, ox, oy, 0, 0)
end

return BalaPlayer
