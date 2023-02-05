
bullet = {
    x = 0,
    y = 0,
    speed = 400
}
bullets = {}

function movePlayerBullets(dt)
    for i, b in ipairs(bullets) do
        b.y = b.y - bullet.speed * dt
            if b.y < 0 then
                table.remove(bullets, i)
            end
    end
end

function drawBullets()
    for _, b in ipairs(bullets) do
        love.graphics.rectangle("fill", b.x, b.y, 5, 5)
    end
end