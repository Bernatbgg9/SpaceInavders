Actor = Actor or require "src/actor"

local HUD = Actor:extend()
local font = love.graphics.newFont("src/textures/font.ttf", 30)
local font1 = love.graphics.newFont ("src/textures/Gameplay.ttf", 30)
local font2 = love.graphics.newFont ("src/textures/Gameplay.ttf", 20)
local title = love.graphics.newFont ("src/textures/font.ttf", 100)

function HUD:new()
  self.game = "menu"
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
  self.eraseMenu = false
end

function HUD:update(dt)
  self.hp = ("HP: " .. self.vidas)
  self.pp = ("POINTS: " .. self.p)
end

function HUD:draw()

  if self.game == "menu" then
      love.graphics.setBackgroundColor(0, 0, 0)
      love.graphics.setFont(title)
      love.graphics.print("SPACE INVADERS", 0, 150)
      love.graphics.setFont(font1)
      love.graphics.print("PULSA ENTER PARA JUGAR", 0, 290)
      love.graphics.print("PULSA I PARA VER LAS NORMAS DEL JUEGO", 0, 350)    
      love.graphics.print("PULSA ESC PARA SALIR", 0, 410)    
  end

  if self.game == "instrucciones" then
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.setFont(font2)
    love.graphics.print("- Destruye tantas naves enemigas como puedas", 0, 150)
    love.graphics.print("- No dejes que los enemigos lleguen a la linea blanca", 0, 190)
    love.graphics.print("- Supera todas las rondas para ganar", 0, 230)
    love.graphics.setFont(font1)
    love.graphics.print("PULSA ENTER PARA VOLVER", 0, 410)
  end

  if self.game == "game" then

    love.graphics.setFont(font)
    love.graphics.print(self.hp, self.hpx, self.hpy)
    love.graphics.print(self.pp, self.ppx, self.ppy)

    if self.pause == true then
      love.graphics.setColor(255, 255, 255)
      if self.eraseMenu == false then
        love.graphics.rectangle("fill", self.rpx, self.rpy, self.rx, self.ry)
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
    end
  end

  if self.vidas <= 0 then
    self.game = "gameover"
  end

  if self.game == "gameover" then
  love.graphics.print("YOU DIED", self.ppx, self.pppy)
    self.pause = true
    for k, v in ipairs(actorList) do
      if v:is(Enemy) then
        v.stop = false
      end
    end
  end

end

function HUD:keyPressed(key)
  if self.game == "menu" then
    if love.keyboard.isDown ("return") then
        self.game = "game"
        for k,v in ipairs(actorList) do
          if v:is(Spawner) then
            v.stop = true
          end
        end
    end
    if love.keyboard.isDown ("i") then
        self.game = "instrucciones"
    end  
    if love.keyboard.isDown ("escape") then
      love.event.quit(0)
    end  
  end

  if self.game == "instrucciones" then
    if love.keyboard.isDown ("return") then
        self.game = "menu"
    end
  end

  if self.game == "game" then
    if key == "escape" then
      self.pause = true
      for k, v in ipairs(actorList) do
        if v:is(Enemy) then
          v.stop = true
        end
      end
      for k, v in ipairs(actorList) do
        if v:is(Spawner) then
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
        self.eraseMenu = true
        for k, v in ipairs(actorList) do
          if v:is(Enemy) then
            v.stop = true
          end
        end
        for k,v in ipairs(actorList) do
          if v:is(Spawner) then
            v.stop = true
          end
        end
      end
      if key == "return" and self.redLightDown == true then
        love.event.quit(0)
      end
    end
  end

  if self.game == "gameover" then
    if love.keyboard.isDown("escape") then
      love.event.quit(0)
    end  
  end


  
  
end

return HUD
