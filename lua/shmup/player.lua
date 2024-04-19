-- player.lua
player = {}

function player.load()
    player.x = 400
    player.y = 300
    player.speed = 200
end

function player.update(dt)
    local dx, dy = 0, 0

    if love.keyboard.isDown("up") then
        dy = -1
    elseif love.keyboard.isDown("down") then
        dy = 1
    end

    if love.keyboard.isDown("left") then
        dx = -1
    elseif love.keyboard.isDown("right") then
        dx = 1
    end

    local length = math.sqrt(dx * dx + dy * dy)
    if length ~= 0 then
        dx = dx / length
        dy = dy / length
    end

    player.x = player.x + dx * player.speed * dt
    player.y = player.y + dy * player.speed * dt
end

function player.draw()
    love.graphics.rectangle("fill", player.x - 10, player.y - 10, 20, 20)
end


function player.keypressed(key)
    if key == "space" then
        table.insert(enemies, createEnemy())  -- Use the createEnemy function directly
    end
end

