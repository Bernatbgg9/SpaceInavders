Player = Player or require "src/Player"
Enemy = Enemy or require "src/Enemy"
Boss = Boss or require "src/Boss"
Hud = Hud or require "src/Hud"
Spawner = Spawner or require "src/Spawner"


actorList = {} --Lista de elementos de juego

local timer = 0.5

function love.load()
    love.window.setFullscreen(true, "exclusive")
    w, h = love.graphics.getDimensions()
    local p = Player()
    table.insert(actorList, p)
    local h = Hud()
    table.insert(actorList, h)
    local s = Spawner()
    table.insert(actorList, s)
    local e = Enemy()
    table.insert(actorList, e)
end

function love.update(dt)
    timer = timer - dt

    for _, v in ipairs(actorList) do
        v:update(dt)
        if v:is(Enemy) then
            if timer <= 0 then
                local e = Enemy()
                table.insert(actorList, e)
                timer = 0.5
            end
        end
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
        v:draw()
    end
    love.graphics.line(0, 400, w, 400)
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
