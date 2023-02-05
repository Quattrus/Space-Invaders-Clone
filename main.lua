require("player")
require("bullet")
require("enemy")
require("game")
require("blocks")

function love.load()
    generateShape()
    spawnAmount = 5
    gamestatus = "gamestarted"
    score = 0
    instantiateEnemies(spawnAmount)
    love.window.setTitle("space invaders")
    fireBullet = love.audio.newSource("fire.mp3", "static")
    explosion = love.audio.newSource("explosion.mp3", "static")
end

function love.update(dt)
    playerMovement(dt)
    checkGameOver()
    movePlayerBullets(dt)
    playerBounds()
    updateEnemyMovement(dt)
    checkEnemyCondition()
    checkEnemiesAreKilled()
    checkBulletCollisions()
    enemyAttack(dt)
    moveEnemyBullets(dt)
    checkEnemyBulletCollisions()
    checkBlockCollisions()
end

function love.draw()
    if gamestatus == "gamestarted" then
    playerDraw()
    drawBullets()
    drawEnemies()
    drawEnemyBullets()
    drawBlocks()
    love.graphics.print("Score: " .. score, 10, 10)
    elseif gamestatus == "gameover" then
        love.graphics.printf("Game Over", 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), "center")
        love.graphics.printf("Press (enter) to restart", 0, love.graphics.getHeight() / 2 + 20, love.graphics.getWidth(), "center")
    end
    
end

function love.keypressed(key)
    if key == "space" then
        fireBullet:play()
        newBullet = {
            x = player.x + player.width / 2,
            y = player.y
        }
        table.insert(bullets, newBullet)
    elseif key == "escape" then
        love.event.quit()
    elseif key == "return" then
        cleanBullets()
        love.load()
    end
end

function checkEnemiesAreKilled()
    if #enemies == 0 then
        spawnAmount = spawnAmount + 1
        instantiateEnemies(spawnAmount + 1)
    end
end





