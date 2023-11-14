Actor = Actor or require "src/actor"
local BalaPlayer = Actor:extend()

function BalaPlayer:new(x, y)
   BalaPlayer.super.new(self, "src/textures/balaBueno.png", x, y, 800, 0, 1)
   self.scale.x = 2
   self.scale.y = 2
end

function BalaPlayer:update(dt)

   for k, v in ipairs(actorList) do

      if v:is(Hud) then

         if v.pause == false then
            self.position.y = self.position.y - self.speed * dt
         end
      end

      if v:is(BalaPlayer) then

         if v.position.x >= w or v.position.x < 0 or v.position.y >= h or v.position.y < 0 then
            table.remove(actorList,k)
         end
      end

      if v:is(Enemy) or v:is(Boss) then

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
