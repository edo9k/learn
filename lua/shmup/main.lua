-- main.lua
require("player")
require("enemy")

function love.load()
    player.load()
    enemies = {}
end

function love.update(dt)
    player.update(dt)

    for _, enemy in ipairs(enemies) do
        enemy.update(dt)
    end
end

function love.draw()
    player.draw()

    for _, enemy in ipairs(enemies) do
        enemy.draw()
    end
end

function love.keypressed(key)
    player.keypressed(key)
end

