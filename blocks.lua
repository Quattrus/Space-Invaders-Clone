
local blockWidth = 5
local blockHeight = 5
local blocks = {}

function generateShape()
    blocks = {}

    local numBlocks = math.random(1000, 1500)

    for i = 1, numBlocks do
        local x = math.random(0, love.graphics.getWidth() - blockWidth)
        local y = math.random(140, 400 - blockHeight)
        table.insert(blocks, {x = x, y = y})
    end
end

function drawBlocks()
    for _, block in ipairs(blocks) do
        love.graphics.rectangle("fill", block.x, block.y, blockWidth, blockHeight)
    end
end

function checkBlockCollisions()
    for i, block in ipairs(blocks) do
        checkBlockCollisionWithBullets(block, bullets, i)
        checkBlockCollisionWithEnemyBullets(block, enemyBullets, i)
    end
end

function checkBlockCollisionWithBullets(block, bullets, blockIndex)
    for j, bullet in ipairs(bullets) do
        if checkCollision(block.x, block.y, 5, 5, bullet.x, bullet.y, 5, 5) then
            table.remove(bullets, j)
            table.remove(blocks, blockIndex)
        end
    end
end

function checkBlockCollisionWithEnemyBullets(block, enemyBullets, blockIndex)
    for j, enemyBullet in ipairs(enemyBullets) do
        if checkCollision(block.x, block.y, 5, 5, enemyBullet.x, enemyBullet.y, 5, 5) then
            table.remove(enemyBullets, j)
            table.remove(blocks, blockIndex)
        end
    end
end