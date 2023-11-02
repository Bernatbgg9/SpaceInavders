Player = Player or require "src/Player"
Enemi = Enemi or require "src/Enemi"
Boss = Boss or require "src/Boss"


actorList = {} --Lista de elementos de juego

function love.load()
    local p = Player()
    table.insert(actorList, p)
    local b = Boss()
    table.insert(actorList, b)
    local e = Enemi()
    table.insert(actorList, e)
end

function love.update(dt)
    for _, v in ipairs(actorList) do
        v:update(dt)
    end
end

function love.draw()
    for _, v in ipairs(actorList) do
        v:draw()
    end
end

function love.keypressed(key)
    for _, v in ipairs(actorList) do
        if v:is(Player) then
            --v:keyPressed(key)
        end
    end
end
