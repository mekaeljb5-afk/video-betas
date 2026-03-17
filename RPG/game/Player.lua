 player = {}

function player:load()
    player.image = love.graphics.newImage("ASSETS/red.png")
    player.x = 200
    player.y = 200
    player.speed = 200
    player.y_velocity = 80
end

function player:update(dt)
    player:move(dt)
end

function player:draw()
     love.graphics.draw(player.image, player.x, player.y)
end

function player:move(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
    elseif love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    end
    if love.keyboard.isDown("z") then
        player.y_velocity = player.y_velocity + player.speed * dt
    end
end
