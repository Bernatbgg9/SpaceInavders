Actor = Actor or require "src/actor"
BalaPlayer = BalaPlayer or require "src/BalaPlayer"
Explosion = Explosion or require "src/Explosion"
local Player = Actor:extend()

function Player:new()
  Player.super.new(self, "src/textures/naveXetada.png", w / 2, 600, 300, 1, 0)
  self.hp = 5
  self.points = 0
  self.explosionDone = false
end

function Player:update(dt)
  for k, v in ipairs(actorList) do
    if v:is(Hud) then
      if v.pause == false then
        if love.keyboard.isDown("d") then
          self.position.x = self.position.x + self.speed * dt
        end
        if love.keyboard.isDown("a") then
          self.position.x = self.position.x - self.speed * dt
        end
        if self.position.x > w / 1.25 then
          self.position.x = w / 6
        end
        if self.position.x < w / 6 then
          self.position.x = w / 1.25
        end
      end
      if v.vidas <= 0 then
        local e = Explosion:extend()
        e:new(self.position.x, self.position.y)
        table.insert(actorList, e)
        self.explosionDone = true
      end
    end
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
  for k, v in ipairs(actorList) do
    if v:is(Hud) then
      if v.pause == false then
        if key == "space" then
          local a = BalaPlayer(self.position.x, self.position.y)
          table.insert(actorList, a)
        end
      end
    end
  end
end

return Player
