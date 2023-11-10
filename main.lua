Player = Player or require "src/Player"
Enemy = Enemy or require "src/Enemy"
Boss = Boss or require "src/Boss"
Hud = Hud or require "src/Hud"
Spawner = Spawner or require "src/Spawner"
Pantalla = Pantalla or require "src/Pantalla"


actorList = {} --Lista de elementos de juego


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
end

function love.update(dt)

    for _, v in ipairs(actorList) do
        v:update(dt)
        if v:is(Hud) then
            if v.vidas <= 0 then
                for kk, vv in pairs(actorList) do
                    if vv:is(Bala) or vv:is(BalaPlayer) or vv:is(Player) or vv:is(Enemy) then
                        table.remove(actorList, kk)
                    end
                end
            end
        end
    end
end

function love.draw()
    for _, v in ipairs(actorList) do
        if v:is(Hud) then
        v:draw()
        end
    end
    for kk,vv in ipairs(actorList) do
        if vv:is(Hud) then
            
            if vv.game == "game" then
                for _, v in ipairs(actorList) do
                    v:draw()
                end
            end
        end
    end
end

function love.keypressed(key)
    for _, v in ipairs(actorList) do
        if v:is(Player) then
            v:keyPressed(key)
        end
        if v:is(Enemy) then
            v:keyPressed(key)
        end
        if v:is(Hud) then
            v:keyPressed(key)
        end
    end
end
