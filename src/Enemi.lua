Actor = Actor or require "src/actor"
local Enemi = Actor:extend()

local stop = true

function Enemi:new(x, y)
    Enemi.super.new(self, "src/textures/si.png", 30, 30, 50, 1, 0)
end

function Enemi:update(dt)
    if stop then
        print(self.position.x)
        Enemi.super.update(self,dt) 
    end
end

function Enemi:draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    love.graphics.draw(self.image, xx, yy, rr, sx, sy, ox, oy, 0, 0)
end

return Enemi
