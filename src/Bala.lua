local Actor = Actor or require "Scripts/actor"
Bala = Actor:extend()

function Bala:new()
    Bala.super.new(self, "src/textures/balaMalo.png", 1, 1, 150, 1, 0)
    self.stop = false
end

function Bala:update(dt)
  --Bala.super.update(self, dt)
  if self.stop == false then
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
    local eliminar = {}
    for k, v in pairs(actorList) do
        if v:is(self) then
            for kk, vv in pairs(actorList) do
                if vv:is(Player) then
                    if v:checkCollision(vv) then
                        table.remove(actorList, v)
                    end
                    for kkk, vvv in pairs(actorList) do
                        if vvv:is(Hud) then
                            if vvv.vidas > 0 then
                                vvv.vidas = vvv.vidas - 1
                            end
                        end
                    end
                    --[[if v:is(Enemy) then
                    if self:checkCollision(v) then
                                  table.remove(actorList, k)]]
                end
            end
        end
    end
    for k, v in pairs(eliminar) do
        table.remove(actorList, k)
    end
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
