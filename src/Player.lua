Actor = Actor or require "src/actor"
BalaPlayer = BalaPlayer or require "src/BalaPlayer"
local Player = Actor:extend()

function Player:new()
  Player.super.new(self, "src/textures/nave.png", 400, 500, 200, 1, 0)
  self.hp = 5
  self.points = 0
end

function Player:update(dt)
  if love.keyboard.isDown("d") then
    self.position.x = self.position.x + self.speed * dt
  end
  if love.keyboard.isDown("a") then
    self.position.x = self.position.x - self.speed * dt
  end
  for k, v in pairs(actorList) do
    if v:is(Bala) then
        if self:checkCollision(v) then
            table.remove(actorList, k)
            for kk, vv in pairs(actorList) do
                if vv:is(Hud) then
                    if vv.vidas > 0 then
                        vv.vidas = vv.vidas - 1
                    end
                end
            end
        end
    end
end
end

function Player:draw()
  local xx = self.position.x
  local yy = self.position.y
  local rr = self.rot
  local sx = self.scale.x
  local sy = self.scale.y
  local ox = self.origin.x
  local oy = self.origin.y


  love.graphics.draw(self.image, xx, yy, rr, sx, sy, ox, oy, 0, 0)
end

function Player:keyPressed(key)
  if key == "space" then
    local a = BalaPlayer(self.position.x, self.position.y)
    table.insert(actorList, a)
  end
end

return Player
