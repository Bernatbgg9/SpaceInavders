Actor = Actor or require "src/actor"

local HUD = Actor:extend()
local font = love.graphics.newFont("src/textures/font.ttf", 30)
local font1 = love.graphics.newFont("src/textures/Gameplay.ttf", 30)
local font2 = love.graphics.newFont("src/textures/Gameplay.ttf", 20)
local title = love.graphics.newFont("src/textures/font.ttf", 100)

function HUD:new()
  self.game = "menu"
  self.vidas = 3
  self.hp = ("HP: " .. self.vidas)
  self.hpx = 10
  self.hpy = 10
  self.p = 0
  self.pp = ("POINTS: " .. self.p)
  self.ppx = 10
  self.ppy = 40
  self.pppy = 300
  self.rpx = w / 7 - 2
  self.rpy = 8
  self.rx = w / 1.2 - w / 7 + 3
  self.ry = 544
  self.pause = false
  self.pausex = w / 2.25
  self.pausex2 = w / 2.3
  self.pausex4 = w / 2.45
  self.pausex3 = w / 2.2
  self.pausey = 100
  self.pausey2 = 300
  self.pausey4 = 400
  self.pausey5 = 350
  self.pausey3 = 450
  self.redLightDown = false
  self.redMidle = false
  self.redMidle2 = false
  self.redLightUp = true
  self.eraseMenu = false
  self.menux = 10
  self.menu1y = 150
  self.menu2y = 290
  self.menu3y = 350
  self.menu4y = 190
  self.menu5y = 230
  self.menu7y = 270
  self.menu6y = 410
  self.gameEnd = false
  self.gameoverx = 350
  self.gameovery = 150
  self.gameover2 = 350
  self.pasar = false
end

function HUD:update(dt)
  self.hp = ("HP: " .. self.vidas)
  self.pp = ("POINTS: " .. self.p)
end

function HUD:draw()
  if self.game == "menu" then
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.setColor(0, 255, 0)
    love.graphics.setFont(title)
    love.graphics.print("SPACE INVADERS", self.menux, self.menu1y)
    love.graphics.setFont(font1)
    love.graphics.print("PULSA ENTER PARA JUGAR", self.menux, self.menu2y)
    love.graphics.print("PULSA I PARA VER LAS NORMAS DEL JUEGO", self.menux, self.menu3y)
    love.graphics.print("PULSA ESC PARA SALIR", self.menux, self.menu6y)
    love.graphics.setColor(255, 255, 255)
  end

  if self.game == "instrucciones" then
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.setColor(0, 255, 0)
    love.graphics.setFont(font2)
    love.graphics.print("- Destruye tantas naves enemigas como puedas", self.menux, self.menu1y)
    love.graphics.print("- Para moverte usa A y D", self.menux, self.menu4y)
    love.graphics.print("- Presiona Space para disparar", self.menux, self.menu5y)
    love.graphics.print("- Menu pausa con ESC. usa las Flechas para moverte y el enter para selecionar", self.menux, self.menu7y)
    love.graphics.setFont(font1)
    love.graphics.print("PULSA ENTER PARA VOLVER", self.menux, self.menu6y)
    love.graphics.setColor(255, 255, 255)
  end

  if self.game == "game" then
    love.graphics.setFont(font2)
    love.graphics.setColor(0, 255, 0)
    love.graphics.print(self.hp, self.hpx, self.hpy)
    love.graphics.print(self.pp, self.ppx, self.ppy)
    love.graphics.setColor(255, 255, 255)

    if self.pause == true then
      love.graphics.setFont(font)
      love.graphics.setColor(0, 0, 0)

      if self.eraseMenu == false then
        love.graphics.rectangle("fill", self.rpx, self.rpy, self.rx, self.ry)
        love.graphics.setColor(0, 255, 0)
        love.graphics.print("PAUSE", self.pausex, self.pausey)

        if self.redLightUp == true then
          love.graphics.setColor(255, 0, 0)
        else
          love.graphics.setColor(0, 255, 0)
        end

        love.graphics.print("RESTART", self.pausex2, self.pausey2)


        if self.redMidle == true then
          love.graphics.setColor(255, 0, 0)
        else
          love.graphics.setColor(0, 255, 0)
        end
        love.graphics.print("STOP MUSIC", self.pausex4, self.pausey4)

        if self.redMidle2 == true then
          love.graphics.setColor(255, 0, 0)
        else
          love.graphics.setColor(0, 255, 0)
        end
        love.graphics.print("NEXT MUSIC", self.pausex4, self.pausey5)

        if self.redLightDown == true then
          love.graphics.setColor(255, 0, 0)
        else
          love.graphics.setColor(0, 255, 0)
        end

        love.graphics.print("EXIT", self.pausex3, self.pausey3)
        love.graphics.setColor(0, 255, 0)
      end
    end
  end

  if self.game == "gameover" then
    love.graphics.setColor(0, 255, 0)
    love.graphics.setFont(title)
    love.graphics.print("GAME OVER", self.gameoverx, self.gameovery)
    love.graphics.setFont(font1)
    love.graphics.print("PUNTUACION " .. self.p, self.gameover2, self.menu6y - 50)
    love.graphics.print("PULSA ENTER PARA RESTART", self.gameover2, self.menu6y)
  end
end

function HUD:keyPressed(key)
  if self.game == "menu" then
    if love.keyboard.isDown("return") then
      self.game = "game"
      for k, v in ipairs(actorList) do
        if v:is(Spawner) then
          v.stop = true
        end
      end
    end

    if love.keyboard.isDown("i") then
      self.game = "instrucciones"
    end

    if love.keyboard.isDown("escape") then
      love.event.quit(0)
    end
  end

  if self.game == "instrucciones" then
    if love.keyboard.isDown("return") then
      self.game = "menu"
    end
  end

  if self.game == "game" then
    if key == "escape" then
      self.pause = true
      self.eraseMenu = false
    end

    if self.pause == true then
      if key == "up" then
        if self.redMidle == false and self.redLightDown == true then
          self.redMidle = true
          self.redMidle2 = false
          self.redLightDown = false
          self.redLightUp = false
        elseif self.redMidle2 == false and self.redMidle == true then
          self.redMidle2 = true
          self.redMidle = false
          self.redLightDown = false
          self.redLightUp = false
        else
          self.redLightDown = false
          self.redLightUp = true
          self.redMidle = false
          self.redMidle2 = false
        end
      end

      if key == "down" then
        if self.redMidle2 == false and self.redLightUp == true then
          self.redMidle2 = true
          self.redMidle = false
          self.redLightDown = false
          self.redLightUp = false
        elseif self.redMidle == false and self.redMidle2 == true then
          self.redMidle = true
          self.redMidle2 = false
          self.redLightDown = false
          self.redLightUp = false
        else
          self.redLightDown = true
          self.redMidle2 = false
          self.redLightUp = false
          self.redMidle = false
        end
      end

      if key == "return" and self.redLightUp == true then
        self.eraseMenu = true
        self.pause = false
        self.game = "game"
      end


      if key == "return" and self.redMidle == true then
        for k, v in ipairs(actorList) do
          if v:is(Music) then
            if v.pause then
              v.pause = false
            end
            if v.pause == false and v.timerP <=0 then
              v.pause = true
            end
          end
        end
      end

      if key == "return" and self.redMidle2 == true then
        for k, v in ipairs(actorList) do
          if v:is(Music) then
            self.pasar = true
          end
        end
      end

      if key == "return" and self.redLightDown == true then
        love.event.quit("restart")
      end
    end
  end

  if self.game == "gameover" then
    if key == "return" or key == "escape" then
      love.event.quit("restart")
    end
  end
end

return HUD
