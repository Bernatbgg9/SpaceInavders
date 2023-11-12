local Actor = Actor or require("src/actor")
local Enemy = Enemy or require "src/Enemy"
local Spawner = Actor:extend()

function Spawner:new(_t)
    self.tFinal = _t or 1
    self.tActual = 0
    self.stop = false
end

function Spawner:update(dt)
    --[[for kk, vv in pairs(actorList) do
        if vv:is(Ship) then
            if vv.hp == 0 then
                self.tActual = 0
            end
        end
    end]]
    if self.stop then
        self.tActual = self.tActual + dt
        if self.tActual > self.tFinal then
            self.tActual = 0
            local a = Enemy()
            table.insert(actorList, a)
        end
    end
end

return Spawner
