local Actor = Actor or require("src/actor")
local Enemi = Enemi or require "src/Enemi"
local Spawner = Actor:extend()

function Spawner:new(_t)
    self.tFinal = _t or 0.5
    self.tActual = 0
    self.stop = true
end

function Spawner:update(dt)
    --[[for kk, vv in pairs(actorList) do
        if vv:is(Ship) then
            if vv.hp == 0 then
                self.tActual = 0
            end
        end
    end]]

    self.tActual = self.tActual + dt
    if self.tActual > self.tFinal and self.stop then
        self.tActual = 0
        local a = Enemi()
        table.insert(actorList, a)
    end
end

return Spawner
