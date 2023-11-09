Player = Player or require "src/Player"
Enemi = Enemi or require "src/Enemi"
Boss = Boss or require "src/Boss"
Hud = Hud or require "src/Hud"


actorList = {} --Lista de elementos de juego

local timer = 0.5

function love.load()
    local p = Player()
    table.insert(actorList, p)
    local e = Enemi()
    table.insert(actorList, e)
    local h = Hud()
    table.insert(actorList, h)
end

function love.update(dt)

    timer = timer - dt

    for _, v in ipairs(actorList) do
        v:update(dt)
        if v:is(Enemi) then
            if timer <= 0 then
                local e = Enemi()
                table.insert(actorList, e)
                timer = 0.5
            end
        end
    end

end

function love.draw()
    for _, v in ipairs(actorList) do
        v:draw()
    end
    love.graphics.line(0, 400, 800, 400)
end

function love.keypressed(key)
    for _, v in ipairs(actorList) do
        if v:is(Player) then
            --v:keyPressed(key)
        end
    end
end
