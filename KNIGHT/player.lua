player = {}

function player:load()
    cam = camera()
    player.x = 910
    player.y = 770
    player.height = 40
    player.width = 80
    player.collider = world:newBSGRectangleCollider(200, 250, 250, 250, 3)
    player.collider:setFixedRotation(true)
    player.speed = 300
    player.Runspeed = 500
    player.image = love.graphics.newImage("ASSETS/MAN.PNG")
    player.y_velocity = 0
end

function player:update(dt)
   
    player:move(dt)
end


function player:draw()
    love.graphics.draw(player.image, player.x, player.y)
end

function player:move(dt)
    local vx = 0
    local vy = 0

    player.collider:setLinearVelocity(vx, vy)

    
     local currentSpeed = player.speed
    if love.keyboard.isDown("lshift") or love.keyboard.isDown("rshift") then
        currentSpeed = player.Runspeed
    end

     
      if love.keyboard.isDown("right") then
        vx = currentSpeed 
    elseif love.keyboard.isDown("left") then
        vx = currentSpeed * -1
    end
    if love.keyboard.isDown("down") then
        vy = currentSpeed 
    elseif love.keyboard.isDown("up") then
        vy = currentSpeed * -1
    end
    player.collider:setLinearVelocity(vx, vy)
end









