Actor = Actor or require "src/actor"
local Vector = Vector or require "lib/vector"
local Boss = Actor:extend()
local Bala = Bala or require "src/Bala"
local Enemy = Enemy or require "src/Enemy"

local timerAccion = 2

function Boss:new()
    Boss.super.new(self, "src/textures/profe.png", 30, 30, 80, 1, 0)
    self.position.x = math.random(w / 5.7, w / 1.25)
    self.position.y = 50
    self.vida       = 5
    self.direc      = 1
end

function Boss:update(dt)

    for kk, vv in ipairs(actorList) do
        if vv:is(Hud) then

            timerAccion = timerAccion - dt

            if vv.pause == false and vv.game ~= "gameover" then

                if self.position.x < w / 6 and self.direc == 1 then
                    self.direc = 2

                elseif self.position.x > w / 1.25 and self.direc == 2 then
                    self.direc = 1
                end


                if self.direc == 1 then
                    self.position = self.position - self.forward * self.speed * dt

                elseif self.direc == 2 then
                    self.position = self.position + self.forward * self.speed * dt
                end

                if self.vida <= 2 then
                    self.image = love.graphics.newImage("src/textures/profeEnfadado.png")

                elseif self.vida <= 0 then
                    if v:is(Hud) then
                        v.p = v.p + 50
                    end
                end

                if timerAccion <= 0 then
                    local ran = math.random(1, 2)

                    if ran == 1 then
                        local a = Enemy()
                        a.position.x = self.position.x
                        a.position.y = self.position.y
                        table.insert(actorList, a)
                        timerAccion = 2
                    else
                        local a = Bala()
                        a.position.x = self.position.x
                        a.position.y = self.position.y
                        table.insert(actorList, a)
                        timerAccion = 2
                    end
                end
            end
        end

        if vv:is(BalaPlayer) then
            if self:checkCollision(vv) then
                table.remove(actorList, kk)

                for k, v in pairs(actorList) do
                    if v:is(Boss) then
                        self.vida = self.vida - 1
                    end
                end
            end
        end
    end
end

function Boss:draw()
    local xx = self.position.x
    local ox = self.origin.x
    local yy = self.position.y
    local oy = self.origin.y
    local sx = self.scale.x
    local sy = self.scale.y
    local rr = self.rot
    love.graphics.draw(self.image, xx, yy, rr, sx, sy, ox, oy, 0, 0)
end

return Boss
