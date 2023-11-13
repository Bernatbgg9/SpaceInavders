Actor = Actor or require "src/actor"
local Music = Actor:extend()

function Music:new()
    self.music = love.audio.newSource("/src/textures/music.mp3", "stream")
    self.music:setVolume(0.5)
    self.pause = true
    self.timer = 1
end

function Music:update(dt)
    for k, v in ipairs(actorList) do
        if v:is(Hud) then
            if v.game == "game" then
                if self.pause then
                    self.music:play()
                else
                    self.music:stop()
                end
            end
        end
    end
    if self.pause == false then
        self.timer = self.timer - dt
    else
        self.timer = 1
    end
end

function Music:draw()

end

return Music
