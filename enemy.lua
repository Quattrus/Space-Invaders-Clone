enemyBullet = {
    x = givenX,
    y = givenY,
    speed = 200
}

enemyBullets = {}

function instantiateEnemies(spawnAmount)
    enemies = {}
    for i = 0, spawnAmount do
        enemy = {
            x = i * 64,
            y = 0,
            width = 20,
            height = 15,
            verticalSpeed = 1,
            horizontalSpeed = 15,
            horizontalMove = "right",
            health = 10
        }
        enemy.verticalSpeed = enemy.verticalSpeed + 0.5
        enemy.horizontalSpeed = enemy.horizontalSpeed + 5
        table.insert(enemies, enemy)
    end
end

function updateEnemyMovement(dt)
    for i, e in ipairs(enemies) do
        e.y = e.y + enemy.verticalSpeed * dt
        if e.horizontalMove == "right" then
            e.x = e.x + enemy.horizontalSpeed * dt
        elseif e.horizontalMove == "left" then
            e.x = e.x - enemy.horizontalSpeed * dt
        end
        if e.x + e.width > love.graphics.getWidth() then
            e.horizontalMove = "left"
        elseif e.x < 0 then
            e.horizontalMove = "right"
        end
    end
end

function checkEnemyCondition()
    for i, e in ipairs(enemies) do
        if e.y > love.graphics.getHeight() then
            table.remove(enemies, i)
        elseif e.health <= 0 then
                explosion:play()
                table.remove(enemies, i)
        end
    end
end

function drawEnemies()
    for _, enemy in ipairs(enemies) do
        love.graphics.rectangle("fill", enemy.x, enemy.y, enemy.width, enemy.height)
    end
end

function spawnEnemyBullet(givenX, givenY)
    fireBullet:play()
    newEnemyBullet = {
        x = givenX,
        y = givenY
    }
    table.insert(enemyBullets, newEnemyBullet)
end

function enemyAttack(dt)
    for i, enemy in ipairs(enemies) do
        enemy.fireTimer = enemy.fireTimer or 0
        enemy.fireTimer = enemy.fireTimer + dt

        if enemy.fireTimer >= 1 then
            spawnEnemyBullet(enemy.x + 5 / 2, enemy.y)
            enemy.fireTimer = 0
        end
    end
end

function drawEnemyBullets()
    for _, b in ipairs(enemyBullets) do
        love.graphics.rectangle("fill", b.x, b.y, 5, 5)
    end
end

function moveEnemyBullets(dt)
    for i, b in ipairs(enemyBullets) do
        b.y = b.y + enemyBullet.speed * dt
            if b.y > love.graphics.getHeight() then
                table.remove(enemyBullets, i)
            end
    end
end

function cleanBullets()
    for i = #enemyBullets, 1, -1 do
        table.remove(enemyBullets, i)
    end 
end