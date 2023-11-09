Actor = Actor or require "src/actor"
local BalaPlayer = Actor:extend()

function BalaPlayer:new()
    BalaPlayer.super.new(self, "src/textures/.png", 400, 300, 200, 1, 0)
end

function BalaPlayer:update(dt)

end

function BalaPlayer:draw()

end

return BalaPlayer