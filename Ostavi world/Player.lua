   player = {}

function player:load()
    camera = require "camera"
    cam = camera()
    anim8 = require "libary/anim8"
    love.graphics.setDefaultFilter("nearest", "nearest")

    player.spriteSheet = love.graphics.newImage("ASSETS/POX.PNG")
    player.grid = anim8.newGrid( 200, 200, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())
    player.x = 200
    player.y = 200
    player.speed = 200
    player.Runspeed = 400
    player.health = 100

    player.animations = {}
    player.animations.down = anim8.newAnimation(player.grid('1-4', 1), 0.2 )
    player.animations.left = anim8.newAnimation(player.grid('1-4', 2), 0.2 )
    player.animations.right = anim8.newAnimation(player.grid('1-4', 2),0.2)
    player.animations.up = anim8.newAnimation(player.grid('1-4', 3), 0.2 )

    player.anim = player.animations.up
end

function player:update(dt)
    player:move(dt)
    player.anim:update(dt)
end

function player:draw()
    player.anim:draw(player.spriteSheet, player.x, player.y)
end

function player:move(dt)

    local curentspeed = player.speed
    if love.keyboard.isDown("lshift") or love.keyboard.isDown("rshift") then
        curentspeed = player.Runspeed
    end




     local isMoving = false



    if love.keyboard.isDown("right") then
        player.x = player.x + curentspeed * dt
        player.anim = player.animations.right
            isMoving = true
    end
    if love.keyboard.isDown("left") then
        player.x = player.x - curentspeed * dt
        player.anim = player.animations.left
            isMoving = true
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + curentspeed * dt
        player.anim = player.animations.down
            isMoving = true
    end
    if love.keyboard.isDown("up") then
        player.y = player.y - curentspeed * dt
            player.anim = player.animations.up
                isMoving = true
    end
     if isMoving == false then
        player.anim:gotoFrame(1)
     end
end