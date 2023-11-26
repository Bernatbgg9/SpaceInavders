Actor = Actor or require "src/actor"
local Bullet = Actor:extend()

function Bullet:new(x, y)
   -- Bullet.super.new(self, "src/textures/.png", 400, 300, 200, 1, 0)
end

function Bullet:update(dt)

end

function Bullet:draw()

end

return Bullet