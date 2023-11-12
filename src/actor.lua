Vector = Vector or require "lib/vector"
Object = Object or require "lib/object"
local Actor = Object:extend()

function Actor:new(image, x, y, speed, fx, fy)
  self.position = Vector.new(x or 0, y or 0)
  self.scale    = Vector.new(1, 1)
  self.forward  = Vector.new(fx or 1, fy or 0)
  self.speed    = speed or 30
  self.image    = love.graphics.newImage(image or "src/textures/background.jpg")
  self.origin   = Vector.new(self.image:getWidth() / 2, self.image:getHeight() / 2)
  self.height   = self.image:getHeight()
  self.width    = self.image:getWidth()
end

function Actor:update(dt)
  self.position = self.position + self.forward * self.speed * dt
end

function Actor:draw()
end

function Actor.dist(a, b)
  v = b.position - a.position
  return v:len()
end

function Actor:checkCollision(aa)
  local a_left = self.position.x - self.width / 2
  local a_right = self.position.x + self.width / 2
  local a_top = self.position.y - self.height / 2
  local a_bottom = self.position.y + self.height / 2

  local b_left = aa.position.x - aa.width / 2
  local b_right = aa.position.x + aa.width / 2
  local b_top = aa.position.y - aa.height / 2
  local b_bottom = aa.position.y + aa.height / 2

  if a_left < b_right and a_right > b_left and a_top < b_bottom and a_bottom > b_top then
    return true
  else
    return false
  end
end

return Actor
