local Actor = Actor or require "Scripts/actor"
Bala = Actor:extend()

function Bala:new()
  Bala.super.new(self, "src/textures/balaMalo.png", 1, 1, 500, 1, 0)
end

function Bala:update(dt)
 --Bala.super.update(self, dt)
  self.position.y = self.position.y + self.speed * dt
  if self.position.x >= w or self.position.x < 0 or self.position.y >= h or self.position.y < 0 then
    for i, v in pairs(actorList) do
      if (v == self) then
        table.remove(actorList, i)
      end
    end
  end
end

function Bala:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image, xx, yy, rr, sx, sy, ox, oy, 0, 0)
end

return Bala
