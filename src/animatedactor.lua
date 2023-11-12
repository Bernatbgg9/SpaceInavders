local Object = Object or require "lib/object"
local Vector = Vector or require "lib/vector"

local AnimatedActor = Object:extend()

function AnimatedActor:new(_image, _x, _y, _speed,_fx,_fy,_nFrames,_fr)
    self.position = Vector.new(_x or 0, _y or 0)
    self.scale = Vector.new(1, 1)
    self.forward = Vector.new(_fx or 1, _fy or 0)
    self.nFrames = _nFrames or 6
    self.speed = _speed or 30
    self.image = love.graphics.newImage(_image or "src/textures/background.jpg")
    self.origin = Vector.new(self.image:getWidth() / (2*self.nFrames), self.image:getHeight() / (2*self.nFrames))
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.rot = 0
    self.frames ={}
    self.frameRate = _fr or 12
    self.actFrame = 1
    local xx=0
    local yy=0
    local hh= self.image:getHeight()
    local ww= self.image:getWidth()/self.nFrames
    for i=1,self.nFrames do
      self.frames[i] =love.graphics.newQuad( xx, yy, ww, hh, self.image:getWidth(), self.image:getHeight())
      xx = xx + ww
    end
end

function AnimatedActor:update(dt)
    if self.actFrame <= self.nFrames then
        self.actFrame = self.actFrame + self.frameRate*dt
      else
        self.actFrame =1
      end
      self.position = self.position + self.forward * self.speed * dt
end

function AnimatedActor:draw()

end


return AnimatedActor
