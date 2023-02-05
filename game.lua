

function checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    w2 = w2 or 0
    h2 = h2 or 0
    return x1 < x2 + w2 and
        x2 < x1 + w1 and
        y1 < y2 + h2 and 
        y2 < y1 + h1
end

function checkBulletCollisions()
    for i, enemy in ipairs(enemies) do
        for j, bullet in ipairs(bullets) do
            if checkCollision(enemy.x, enemy.y, enemy.width, enemy.height, bullet.x, bullet.y, 5, 5) then
                enemy.health = enemy.health - 3
                score = score + 1
                table.remove(bullets, j)
            end
        end
    end
end

function checkGameOver()
    if player.health == 0 then
        explosion:play()
        gamestatus = "gameover"
    end
end

function checkEnemyBulletCollisions()
        for i, bullet in ipairs(enemyBullets) do
            if checkCollision(player.x, player.y, player.width, player.height, bullet.x, bullet.y, 5, 5) then
                player.health = player.health - 1
                table.remove(enemyBullets, i)
            end
        end
end