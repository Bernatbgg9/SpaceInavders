local Actor = Actor or require("src/actor")
local Enemy = Enemy or require "src/Enemy"
local Spawner = Actor:extend()

function Spawner:new(_t)
    self.tFinal = _t or 1
    self.tActual = 0
end

function Spawner:update(dt)

    for k, v in ipairs(actorList) do
        if v:is(Hud) then
            if v.game == "game" and v.pause == false then
                self.tActual = self.tActual + dt
                if self.tActual > self.tFinal then
                    self.tActual = 0
                    local a = Enemy()
                    table.insert(actorList, a)
                end
            end
        end
    end
end

return Spawner
