Actor = Actor or require "src/actor"
local Enemi = Actor:extend()
local Bala = Bala or require "src/Bala"



local stop = true

local skinMalos = { "src/textures/malo1.png", "src/textures/malo.png", "src/textures/malo2.png" }

function Enemi:new(x, y)
    Enemi.super.new(self, skinMalos[math.random(1, 3)], 30, 30, 50, 1, 0)
    self.position.x = 30
    self.position.y = 30
    self.speed      = 250
    self.forward    = Vector.new(1, 0)
    self.fila       = 1
end

function Enemi:update(dt)
    if stop then
        if self.position.x < 730 and self.position.y == 30 then
            self.position = self.position + self.forward * self.speed * dt
        elseif self.position.x > 730 and self.position.y < 90 then
            self.position.y = self.position.y + self.speed * dt
        elseif self.position.x > 30 and self.position.y > 90 and self.fila == 1 then
            self.position = self.position - self.forward * self.speed * dt
        elseif self.position.x < 30 and self.position.y < 150 then
            self.position.y = self.position.y + self.speed * dt
            self.fila = 2
        elseif self.position.x < 730 and self.position.y > 150 and self.fila == 2 then
            self.position = self.position + self.forward * self.speed * dt
        elseif self.position.x > 730 and self.position.y < 210 then
            self.position.y = self.position.y + self.speed * dt
            self.fila = 3
        elseif self.position.x > 30 and self.position.y > 210 and self.fila == 3 then
            self.position = self.position - self.forward * self.speed * dt
        elseif self.position.x < 30 and self.position.y < 270 then
            self.position.y = self.position.y + self.speed * dt
            self.fila = 4
        elseif self.position.x < 730 and self.position.y > 270 and self.fila == 4 then
            self.position = self.position + self.forward * self.speed * dt
        elseif self.position.x > 730 and self.position.y < 330 then
            self.position.y = self.position.y + self.speed * dt
            self.fila = 5
        elseif self.position.x > 30 and self.position.y > 330 and self.fila == 5 then
            self.position = self.position - self.forward * self.speed * dt
        elseif self.position.x < 30 and self.position.y < 390 then
            self.position.y = self.position.y + self.speed * dt
        elseif self.position.y > 390 then
            stop = false
            for k, v in ipairs(actorList) do
                if v:is(Spawner) then
                    v.stop = false
                end
            end
        end
    end
    local enemy = {}

    for k, v in ipairs(actorList) do
        if v:is(Enemi) then
            table.insert(enemy, Enemi)
            local num = math.random(1, #enemy)

            print(1)
            for k, v in ipairs(enemy) do
                if k == num then
                    local bala = Bala()
                    bala.position.x = self.position.x
                    bala.position.y = self.position.y
                    table.insert(actorList, bala)
                    print(2)
                end
            end
        end
    end
end

function Enemi:draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    love.graphics.draw(self.image, xx, yy, rr, 4, 4, ox, oy, 0, 0)
end

return Enemi
