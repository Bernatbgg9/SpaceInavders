Actor = Actor or require "src/actor"
local Pantalla = Actor:extend()

function Pantalla:new()

end

function Pantalla:update(dt)

end

function Pantalla:draw()
    love.graphics.line(w/7, 550, w/1.2, 550)
    love.graphics.line(w/7, 10, w/1.2, 10)
    love.graphics.line(w/7, 10, w/7, h)
    love.graphics.line(w/1.2, 10, w/1.2, h)
end

return Pantalla