-- enemy.lua

local enemy = {}

function enemy.create()
    local instance = {}

    instance.x = math.random(0, love.graphics.getWidth())
    instance.y = math.random(0, love.graphics.getHeight())
    instance.speed = 100

    function instance.update(dt)
        -- Simple movement toward the player for demonstration purposes
        local dx = player.x - instance.x
        local dy = player.y - instance.y
        local length = math.sqrt(dx * dx + dy * dy)

        if length ~= 0 then
            dx = dx / length
            dy = dy / length
        end

        instance.x = instance.x + dx * instance.speed * dt
        instance.y = instance.y + dy * instance.speed * dt
    end

    function instance.draw()
        love.graphics.circle("fill", instance.x, instance.y, 10)
    end

    return instance
end

return enemy

