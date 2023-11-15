local Actor = Actor or require("src/actor")
local Enemy = Enemy or require "src/Enemy"
local Boss = Boss or require "src/Boss"
local Spawner = Actor:extend()

local drw = 1

function Spawner:new(_t)
    self.tFinal = _t or 1
    self.tActual = 0
    self.tBoss = 5
end

function Spawner:update(dt)

    for k, v in ipairs(actorList) do

        if v:is(Hud) then

            if v.game == "game" and v.pause == false then

                self.tBoss = self.tBoss - dt

                self.tActual = self.tActual + dt
                
                if self.tActual > self.tFinal then

                    local a = Enemy()
                    table.insert(actorList, a)

                    if self.tBoss <= 0 and drw == 1 then
                        local b = Boss()
                        table.insert(actorList, b)
                        drw = 2
                    end

                    self.tActual = 0
                end

            end
        end
    end
end

return Spawner
