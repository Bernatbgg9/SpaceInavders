Actor = Actor or require "src/actor"
local Player = Actor:extend()

function Player:new(x, y)

end

function Player:update(dt)

end

function Player:draw()

end

function Player:keyPressed(key)
    if key == "space" then

    end
end

return Player
