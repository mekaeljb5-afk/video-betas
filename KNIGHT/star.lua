star = {}
timer = 0
time = 0

function star:load()
    star.x = 500
    star.y = 100
    star.targetX = 500
    star.targetY = 100
    star.speed = 200
    star.image = love.graphics.newImage("ASSETS/raeew.png")
end


function star:update(dt)
    star:move()
end


function star:draw()
     love.graphics.draw(star.image, star.x, star.y)
end



function star:move(dt)
    star.x = star.x + 1
end




