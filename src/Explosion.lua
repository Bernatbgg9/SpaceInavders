local Actor = Actor or require "src/actor"
local explosion = Actor:extend()

function explosion:new(x,y)
  explosion.super.new(self,"src/textures/explosion.png",x,y)
  
  self.frames = {}
  self.nFrames = 26
  
  local width = self.image:getWidth() / self.nFrames
  local height = self.image:getHeight()
  
  for y = 0, self.image:getHeight() - height, height do
    for x = 0, self.image:getWidth() - width, width do
      table.insert(self.frames, love.graphics.newQuad(x, y, width, height, self.image:getDimensions()))
    end
  end

  self.frameRate = 24
  self.actFrame = 1 
end

function explosion:update(dt)  
  
  if self.actFrame <= self.nFrames then
    self.actFrame = self.actFrame + self.frameRate * dt
  else
    for _,v in pairs(actorList) do
      if(v == self) then
        table.remove(actorList, _)
      end
    end
  end
  explosion.super.update(self,dt)
  
end

function explosion:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  
  local i = math.floor(self.actFrame)
  love.graphics.draw(self.image, self.frames[i],xx,yy,0, 3, 3, 20, 20)
end

return explosion