Actor = Actor or require "src/actor"
local Pantalla = Actor:extend()

function Pantalla:new()
    self.image1 = love.graphics.newImage("src/textures/palanca 1.png")
    self.image2 = love.graphics.newImage("src/textures/boton2.png")
end

function Pantalla:update(dt)
    if love.keyboard.isDown("d") then
        self.image1 = love.graphics.newImage("src/textures/palanca 3.png")
        
    elseif love.keyboard.isDown("a") then
        self.image1 = love.graphics.newImage("src/textures/palanca 4.png")

    else
        self.image1 = love.graphics.newImage("src/textures/palanca 1.png")
    end

    if love.keyboard.isDown("space") then
        self.image2 = love.graphics.newImage("src/textures/boton 1.png")
        
    else
        self.image2 = love.graphics.newImage("src/textures/boton2.png")
    end
end

function Pantalla:draw()
    love.graphics.setColor(0, 255, 0)
    love.graphics.line(w / 7, 600, w / 1.2, 600)
    love.graphics.line(w / 7, 500, w / 1.2, 500)
    love.graphics.line(w / 7, 10, w / 1.2, 10)

    love.graphics.line(w / 7, 10, w / 7, 600)
    love.graphics.line(w / 7.8, 0, w / 7.8, h)

    love.graphics.line(w / 1.2, 10, w / 1.2, 600)
    love.graphics.line(w / 1.182, 0, w / 1.182, h)
    love.graphics.reset()

    love.graphics.draw(self.image1, 400, 620, 0, 3, 3)
    love.graphics.draw(self.image2, 750, 620, 0, 3, 3)

end

return Pantalla
