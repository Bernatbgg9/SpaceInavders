Actor = Actor or require "src/actor"
local HUD = Actor:extend()
local font = love.graphics.newFont("src/textures/font.ttf", 30)

function HUD:new()
  self.vidas = 3
  self.hp = ("HP: " .. self.vidas)
  self.hpx = 10
  self.hpy = 10
  self.p = 0
  self.pp = ("POINTS: " .. self.p)
  self.ppx = 650
  self.ppy = 10
  self.pppy = 300
  self.rpx = 40
  self.rpy = 50
  self.rx = 750
  self.ry = 500
  self.pause = false
  self.pausex = 350
  self.pausex2 = 340
  self.pausex3 = 360
  self.pausey = 100
  self.pausey2 = 350
  self.pausey3 = 450
  self.redLightDown = false
  self.redLightUp = true
  self.eraseMenu = true
end

function HUD:update(dt)
  self.hp = ("HP: " .. self.vidas)
  self.pp = ("POINTS: " .. self.p)
end

function HUD:draw()
  love.graphics.setFont(font)
  love.graphics.print(self.hp, self.hpx, self.hpy)
  love.graphics.print(self.pp, self.ppx, self.ppy)
  
  if self.pause == true then
    love.graphics.setColor(255, 255, 255)
    if self.eraseMenu == true then
      love.graphics.rectangle("fill", self.rpx, self.rpy, self.rx, self.ry)
    end
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("PAUSE", self.pausex, self.pausey)
    if self.redLightUp == true then
      love.graphics.setColor(255, 0, 0)
    else
      love.graphics.setColor(0, 0, 0)
    end
    love.graphics.print("RESTART", self.pausex2, self.pausey2)
    if self.redLightDown == true then
      love.graphics.setColor(255, 0, 0)
    else
      love.graphics.setColor(0, 0, 0)
    end
    love.graphics.print("EXIT", self.pausex3, self.pausey3)
    love.graphics.setColor(0, 0, 0)
  end
  if self.vidas <= 0 then
    love.graphics.print("YOU DIED", self.ppx, self.pppy)
  end
end

function HUD:keyPressed(key)
  if key == "escape" then
    self.pause = true
    for k, v in ipairs(actorList) do
      if v:is(Enemy) then
        v.stop = false
      end
    end
  end
  if self.pause == true then
    if key == "up" then
      self.redLightUp = true
      self.redLightDown = false
    end
    if key == "down" then
      self.redLightDown = true
      self.redLightUp = false
    end
    if key == "return" and self.redLightUp == true then
      self.eraseMenu = false
      for k, v in ipairs(actorList) do
        if v:is(Enemy) then
          v.stop = true
        end
      end
    end
    if key == "return" and self.redLightDown == true then
      love.event.quit()
    end
  end
end

return HUD
