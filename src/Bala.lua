local Actor = Actor or require "Scripts/actor"
Bala = Actor:extend()

function Bala:new()
    Bala.super.new(self, "src/textures/balaMalo.png", 1, 1, 250, 1, 0)
end

function Bala:update(dt)

    for k, v in ipairs(actorList) do

        if v:is(Hud) then
            if v.pause == false then
                self.position.y = self.position.y + self.speed * dt
            end
        end
        
        if v:is(Bala) then
            if v.position.x >= w or v.position.x < 0 or v.position.y >= 600 or v.position.y < 0 then
                table.remove(actorList, k)
            end
        end
    end
end

function Bala:draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = 2
    local sy = 2
    local rr = self.rot
    love.graphics.draw(self.image, xx, yy, rr, sx, sy, ox, oy, 0, 0)
end

function Bala:keyPressed(key)
    if key == "escape" then
        self.stop = true
    end
    if key == "return" then
        self.stop = false
    end
end

return Bala
