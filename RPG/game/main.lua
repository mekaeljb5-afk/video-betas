local STI = require("sti")
require("Player")


function love.load()
	MAP = STI("MAP/TSX..lua", {"box2d"})
	World = love.physics.newWorld(0,0) 
	MAP:box2d_init(World)
	player:load()
end

function love.update(dt)
	World:update(dt)
	player:update(dt)
end

function love.draw()
	MAP:draw(0, 0, 1, 1) 
	player:draw()
end





