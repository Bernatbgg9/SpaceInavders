local Actor = Actor or require "Scripts/actor"
Bala = Actor:extend()

function Bala:new()
    Bala.super.new(self, "src/textures/balaMalo.png", 1, 1, 150, 1, 0)
end

function Bala:update(dt)
    --Bala.super.update(self, dt)
    self.position.y = self.position.y + self.speed * dt
    if self.position.x >= w or self.position.x < 0 or self.position.y >= h or self.position.y < 0 then
        for i, v in pairs(actorList) do
            if (v == self) then
                table.remove(actorList, i)
            end

            --Bala.super.update(self, dt)
            self.position.y = self.position.y + self.speed * dt
            if self.position.x >= w or self.position.x < 0 or self.position.y >= h or self.position.y < 0 then
                for i, v in pairs(actorList) do
                    if (v == self) then
                        table.remove(actorList, i)
                    end
                end
            end
            -- local eliminar = {}
        end
    end
    --local eliminar = {}
    --[[for k, v in pairs(actorList) do
        if v:is(Player) then
            if self:checkCollision(v) then
                table.remove(actorList, k)
               -- table.insert(eliminar, k)
                for kk, vv in pairs(actorList) do
                    if vv:is(Hud) then
                        if vv.vidas > 0 then
                            vv.vidas = vv.vidas - 1
                        end
                    end
                end
            end
            --[[if v:is(Enemy) then
            if self:checkCollision(v) then
                          table.remove(actorList, k)
        end
    end ]]


    --[[for k, v in pairs(eliminar) do
        table.remove(actorList, v)
      end]]
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

return Bala
