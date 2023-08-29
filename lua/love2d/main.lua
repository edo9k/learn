-- main.lua

local moleImage
local moles = {}

function love.load()
    love.window.setTitle("Whack-a-Mole Game")
    love.window.setMode(800, 600, {resizable = false})
    
    moleImage = love.graphics.newImage("mole.png")
end

function spawnMole()
    local mole = {
        x = math.random(0, love.graphics.getWidth() - moleImage:getWidth()),
        y = math.random(0, love.graphics.getHeight() - moleImage:getHeight()),
        visible = true
    }
    table.insert(moles, mole)
end

function love.update(dt)
    -- Spawn a new mole with a certain probability
    if math.random() < 0.01 then
        spawnMole()
    end
    
    -- Update mole visibility
    for _, mole in ipairs(moles) do
        mole.visible = math.random() < 0.5
    end
    
    -- Handle mouse clicks
    if love.mouse.isDown(1) then
        local mouseX, mouseY = love.mouse.getPosition()
        for i = #moles, 1, -1 do
            local mole = moles[i]
            if mole.visible and mouseX > mole.x and mouseX < mole.x + moleImage:getWidth() and
               mouseY > mole.y and mouseY < mole.y + moleImage:getHeight() then
                table.remove(moles, i) 
            end
        end
    end
end

function love.draw()
    for _, mole in ipairs(moles) do
        if mole.visible then
            love.graphics.draw(moleImage, mole.x, mole.y)
        end
    end
end
 
