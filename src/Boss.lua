Actor = Actor or require "src/actor"
local Vector = Vector or require "lib/vector"
local Boss = Actor:extend()

function Boss:new()
    Enemy.super.new(self, "src/textures/profe.png", 30, 30, 50, 1, 0)
    self.position.x     = math.random(w / 5.7, w / 1.25)
    self.position.y     = 50
    self.speed          = 50
    self.forward        = Vector.new(1, 0)
    self.fila           = 1
    self.timerMovimento = 0
end

function Boss:update(dt)
    for kk, vv in ipairs(actorList) do

        if vv:is(Hud) then

            if vv.pause == false and vv.game ~= "gameover" then
                self.position.y = self.position.y + self.speed * dt
            end
        end
    end
end

function Boss:draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    love.graphics.draw(self.image, xx, yy, rr, sx, sy, ox, oy, 0, 0)
end

return Boss
