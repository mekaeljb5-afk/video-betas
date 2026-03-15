
require("player")
require("star")
require("Menu")

function love.load()
    gamestate = "Menu"
    sti = require("sti")
    gameMap = sti("MAP/1.lua")
    wf = require 'windfield'
    world = wf.newWorld(0, 0, true)
    camera = require 'hump-master/camera'
    cam = camera()
    player:load()
    star:load()

end

function love.update(dt)
    cam:lookAt(player.x,player.y)
    gameMap:update(dt)
    player:update(dt)
    star:update(dt)
    world:update(dt)
    player.x = player.collider:getX()
    player.y = player.collider:getY()
end

function love.draw()
    if gamestate == "Menu" then
        Menu:draw()
        Menu:load()
    elseif gamestate == "play" then
    cam:attach()
    gameMap:drawLayer(gameMap.layers["WALL"])
    gameMap:drawLayer(gameMap.layers["ground"])
    local spawnPoint = gameMap.objects["spawn"]
     player:draw()
     star:draw()
     --world:draw()
    love.graphics.setBackgroundColor(0, 0, 0)
    cam:detach()
    end
end

function love.keypressed(key, unicode)
    if gamestate == "Menu" and key == "space" then
        gamestate = "play"  
    end
end