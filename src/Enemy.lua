Actor = Actor or require "src/actor"
local Enemy = Actor:extend()
local Bala = Bala or require "src/Bala"

local stop = true

local timerDisparo = 7

local skinMalos = { "src/textures/malo1.png", "src/textures/malo.png", "src/textures/malo2.png" }

function Enemy:new()
    Enemy.super.new(self, skinMalos[math.random(1, 3)], 30, 30, 50, 1, 0)
    self.position.x     = math.random(w / 5.7, w / 1.25)
    self.position.y     = 50
    self.speed          = 50
    self.forward        = Vector.new(1, 0)
    self.fila           = 1
    self.timerMovimento = 0
end

function Enemy:update(dt)
    timerDisparo = timerDisparo - dt
    self.timerMovimento = self.timerMovimento - dt

    if stop then
        self.position.y = self.position.y + self.speed * dt

        for k, v in ipairs(actorList) do
            if v:is(Enemy) then
                if v.position.y >= 90 and v.position.y <= 150 and (v.fila == 1 or v.fila == 2 or v.fila == 3) and v.timerMovimento <= 0 then
                    local rand = math.random(1, 3)
                    v.fila = rand
                    v.timerMovimento = 0.5
                elseif v.position.y >= 150 and v.position.y <= 270 and (v.fila == 2 or v.fila == 3) and v.timerMovimento <= 0 then
                    local rand = math.random(1, 3)
                    v.fila = rand
                    v.timerMovimento = 0.5
                elseif v.position.y >= 270 and v.position.y <= 330 and (v.fila == 1 or v.fila == 2 or v.fila == 3) and v.timerMovimento <= 0 then
                    local rand = math.random(1, 3)
                    v.fila = rand
                    v.timerMovimento = 0.5
                elseif v.position.y >= 330 and v.position.y <= 380 and (v.fila == 2 or v.fila == 3) and v.timerMovimento <= 0 then
                    local rand = math.random(1, 3)
                    v.fila = rand
                    v.timerMovimento = 0.5
                elseif v.position.y >= 380 and v.position.y <= 430 and (v.fila == 1 or v.fila == 2 or v.fila == 3) and v.timerMovimento <= 0 then
                    local rand = math.random(1, 3)
                    v.fila = rand
                    v.timerMovimento = 0.5
                elseif v.position.y >= 430 and v.position.y <= 480 and (v.fila == 2 or v.fila == 3) and v.timerMovimento <= 0 then
                    local rand = math.random(1, 3)
                    v.fila = rand
                    v.timerMovimento = 0.5
                elseif v.position.y >= 480 then
                    v.fila = 1
                elseif v.position.x < w / 6 or v.position.x > w / 1.25 then
                    v.fila = 1
                end
            end
        end
        
        if self.position.y >= 90 and self.position.y <= 150 and self.fila == 2 then
            self.position = self.position - self.forward * self.speed * dt
        elseif self.position.y >= 90 and self.position.y <= 150 and self.fila == 3 then
            self.position = self.position + self.forward * self.speed * dt
        elseif self.position.y >= 150 and self.position.y <= 270 and self.fila == 2 then
            self.position = self.position + self.forward * self.speed * dt
        elseif self.position.y >= 150 and self.position.y <= 270 and self.fila == 3 then
            self.position = self.position - self.forward * self.speed * dt
        elseif self.position.y >= 270 and self.position.y <= 330 and self.fila == 2 then
            self.position = self.position - self.forward * self.speed * dt
        elseif self.position.y >= 270 and self.position.y <= 330 and self.fila == 3 then
            self.position = self.position + self.forward * self.speed * dt
        elseif self.position.y >= 330 and self.position.y <= 380 and self.fila == 2 then
            self.position = self.position - self.forward * self.speed * dt
        elseif self.position.y >= 330 and self.position.y <= 380 and self.fila == 3 then
            self.position = self.position + self.forward * self.speed * dt
        elseif self.position.y >= 380 and self.position.y <= 430 and self.fila == 2 then
            self.position = self.position - self.forward * self.speed * dt
        elseif self.position.y >= 380 and self.position.y <= 430 and self.fila == 3 then
            self.position = self.position + self.forward * self.speed * dt
        elseif self.position.y >= 430 and self.position.y <= 480 and self.fila == 2 then
            self.position = self.position - self.forward * self.speed * dt
        elseif self.position.y >= 430 and self.position.y <= 480 and self.fila == 3 then
            self.position = self.position + self.forward * self.speed * dt
        end

        if self.position.y > 540 then
            stop = false
            for k, v in ipairs(actorList) do
                if v:is(Spawner) then
                    v.stop = false
                end
            end
        end
        local enemy = {}


        for k, v in ipairs(actorList) do
            if v:is(Enemy) then
                table.insert(enemy, Enemy)
            end
        end

        if timerDisparo <= 0 then
            local num = math.random(1, #enemy)
            for k, v in ipairs(enemy) do
                if k == num then
                    local bala = Bala()
                    bala.position.x = self.position.x
                    bala.position.y = self.position.y
                    table.insert(actorList, bala)
                    timerDisparo = 7
                end
            end
        end
    end
end

function Enemy:draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    love.graphics.draw(self.image, xx, yy, rr, sx, sy, ox, oy, 0, 0)
end

function Enemy:keyPressed(key)
    if key == "escape" then
        stop = true
        for k, v in ipairs(actorList) do
            if v:is(Spawner) then
                v.stop = false
            end
        end
    end
    if key == "return" then
        stop = false
        for k, v in ipairs(actorList) do
            if v:is(Spawner) then
                v.stop = true
            end
        end
    end
end


return Enemy
