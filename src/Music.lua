Actor = Actor or require "src/actor"
local Music = Actor:extend()

local list = {"/src/textures/Music/Musica.mp3","/src/textures/Music/Music1.mp3","/src/textures/Music/Music2.mp3","/src/textures/Music/Music.mp3","/src/textures/Music/MusicaE.mp3"}
local dur, length

function Music:new()
    self.i = 1
    self.music = love.audio.newSource(list[self.i], "stream")
    self.music:setVolume(0.3)
    self.pause = true
    self.timer = 1
    self.timerP = 0.5
    dur = self.music:getDuration()
    length = #list
end

function Music:update(dt)

    for k, v in ipairs(actorList) do

        if v:is(Hud) then

            if v.game == "game" then

                if self.pause then
                    self.music:play()
                    dur = dur - dt
                    self.timer = self.timer - dt

                    if (dur <= 0 or v.pasar) and self.timer <= 0 then

                        self.music:stop()
    
                        if self.i <= #list then
                            self.i = self.i + 1
                        end
    
                        if self.i > length then
                            self.i = 1
                            self.music = love.audio.newSource(list[self.i], "stream")
                            self.music:setVolume(0.3)
                            self.timer = 1
                            dur = self.music:getDuration()
                        end
    
                        self.music = love.audio.newSource(list[self.i], "stream")
                        self.music:setVolume(0.3)
                        self.timer = 1
                        dur = self.music:getDuration()
                        v.pasar = false
                    end

                else
                    self.music:pause()
                end
            end
        end

        if self.pause == false then
            self.timerP = self.timerP - dt
            
        else
            self.timerP = 1
        end
    end
end

function Music:draw()

end

return Music
