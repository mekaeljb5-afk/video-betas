Menu = {}


function Menu:load()
end

function Menu:update(dt)
end

function Menu:draw()
     love.graphics.setFont(love.graphics.newFont(48))
        love.graphics.print("KIGHTS")
        love.graphics.setBackgroundColor(0, 0, 0)
end

