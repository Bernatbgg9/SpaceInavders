Actor = Actor or require "src/actor"
local BalaPlayer = Actor:extend()

function BalaPlayer:new(x, y)
   BalaPlayer.super.new(self, "src/textures/balaBueno.png", x, y, 300, 0, 1)
   self.scale.x = 2
   self.scale.y = 2
end

function BalaPlayer:update(dt)
   --BalaPlayer.super.update(self, dt)
   self.position.y = self.position.y - self.speed * dt
   if self.position.x >= w or self.position.x < 0 or self.position.y >= h or self.position.y < 0 then
      for i, v in pairs(actorList) do
         if (v == self) then
            table.remove(actorList, i)
         end
      end
   end
   
   for k, v in pairs(actorList) do
      if v:is(Enemy) then
         if self:checkCollision(v) then
            table.remove(actorList, k)
         end
<<<<<<< HEAD
=======

>>>>>>> 8e928c70c5c9628823a0ac270400c4f7d95238f6
        if self:checkCollision(v) then
          table.remove(actorList, k)
          for kk, vv in pairs(actorList) do
            if vv:is(Hud) then
              vv.p = vv.p + 1
            end
          end
        end
<<<<<<< HEAD
=======

>>>>>>> 8e928c70c5c9628823a0ac270400c4f7d95238f6

         if self:checkCollision(v) then
            table.remove(actorList, k)
            for kk, vv in pairs(actorList) do
               if vv:is(Hud) then
                  vv.p = vv.p + 1
               end
            end
         end
      end
   end
end

function BalaPlayer:draw()
   local xx = self.position.x
   local ox = self.origin.x
   local yy = self.position.y
   local oy = self.origin.y
   local sx = self.scale.x
   local sy = self.scale.y
   local rr = self.rot
   love.graphics.draw(self.image, xx, yy, rr, sx, sy, ox, oy, 0, 0)
end

return BalaPlayer
