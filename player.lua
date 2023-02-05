player = {
    x = love.graphics.getWidth() / 2,
    y = love.graphics.getHeight() - 50,
    width = 30,
    height = 30,
    speed = 200,
    health = 10
}

function playerMovement(dt)
    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
    end
end

function playerDraw()
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end

function playerBounds()
    if player.x < 0 then
        player.x = 0
    elseif player.x + player.width > love.graphics.getWidth() then
        player.x = love.graphics.getWidth() - player.width
    end
end