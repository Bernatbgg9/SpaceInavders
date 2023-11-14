Enemy = Enemy or require "src/Enemy"
Player = Player or require "src/Player"
Hud = Hud or require "src/Hud"
Spawner = Spawner or require "src/Spawner"
Pantalla = Pantalla or require "src/Pantalla"
Explosion = Explosion or require"src/Explosion"
Boss = Boss or require "src/Boss"

FinalBoss = FinalBoss or require "src/FinalBoss"

Music = Music or require "src/Music"


actorList = {} --Lista de elementos de juego
local timer = 1

function love.load()

    --love.window.setFullscreen(true, "exclusive")
    w, h = love.graphics.getDimensions()
    local h = Hud()
    table.insert(actorList, h)
    local pa = Pantalla()
    table.insert(actorList, pa)
    local p = Player()
    table.insert(actorList, p)
    local s = Spawner()
    table.insert(actorList, s)
    local m = Music()
    table.insert(actorList, m)

end

function love.update(dt)

    for _, v in ipairs(actorList) do
        v:update(dt)

        if v:is(Hud) then

            if v.vidas <= 0 then

                for kk, vv in pairs(actorList) do

                    if vv:is(BalaPlayer) then
                        table.remove(actorList, kk)
                    end

                    if vv:is(Spawner) then
                        table.remove(actorList, kk)
                    end

                    if vv:is(Player) then
                        if vv.timer <= 0 then
                            table.remove(actorList, kk)
                        end
                    end

                end

                timer = timer - dt
            end
        end

        if timer <= 0 then

            if v:is(Bala) then
                table.remove(actorList, _)

            elseif v:is(Enemy) then
                table.remove(actorList, _)

            elseif v:is(Explosion) then
                table.remove(actorList, _)
            end

            if v:is(Hud) then
                v.game = "gameover"
            end
        end
    end
end

function love.draw()

    for _, v in ipairs(actorList) do

        if v:is(Hud) then

            if v.game == "menu" then
                v:draw()

            elseif v.game == "game" then

                for k, vv in ipairs(actorList) do
                    vv:draw()
                end

            elseif v.game == "instrucciones" then
                v:draw()
                
            elseif v.game == "gameover" then
                v:draw()
            end
        end
    end
end

function love.keypressed(key)

    for _, v in ipairs(actorList) do

        if v:is(Player) then
            v:keyPressed(key)
        end
        
        if v:is(Hud) then
            v:keyPressed(key)
        end
    end
end
