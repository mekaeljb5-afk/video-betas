require("Player")
require("BOT")
local STI = require("sti")

function love.load()
    bot = {}
    bot.y = 200
    bot.x = 200



    camera = require "camera"
    cam = camera()
    player:load()
end 

function love.update(dt)
    player:update(dt)
    cam:lookAt(player.x,player.y)
end

function love.draw()
    cam:attach()
     love.graphics.circle("fill", bot.x, bot.y, 50)
     player:draw()
    cam:detach()
end

function love.keypressed(k)
    if k == "Escape" then
        love.event.quit()
    end
end

function love.keypressed(key)
    if key == "f" then
        local currentFullscreen = love.window.getFullscreen()
        love.window.setFullscreen(not currentFullscreen)
    end
end