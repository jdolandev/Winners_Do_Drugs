--Initialization of the game
function love.load ( )
	--Requirements
	require "class"
	require "player"
	require "graphics"

	love.graphics.setBackgroundColor(0, 0, 0)
	minecraftia = love.graphics.newFont( "fnt/debug.ttf" )
	love.graphics.setFont( minecraftia )
	love.mouse.setVisible( false )
	spr_title = love.graphics.newImage("img/title.png")
	golod = love.graphics.newImage("img/logo.png")
	jumpsnd = 
	player:init( 32, love.window.getHeight() - 32, 32, 32 )
end

function love.focus ( f )
	isFocused = f
end

--Update function (think of it like step in GML)
function love.update ( dt )
	mouse_x, mouse_y = love.mouse.getPosition()
	leftButton = love.mouse.isDown("l")
	player:update( dt )
end

function titleScreen ( )
	love.graphics.draw( spr_title, 0, 0)
end


--Draws shit to the screen (Same as draw function in GML)
function love.draw ( )
	crossHair()
	player:draw()
	debug()
end

function debug()
	--Get info on the game
	love.graphics.print("Debug:", ( love.window.getWidth() / 2 ) - 32,16)
	love.graphics.print( "Game:  "..'"'..love.window.getTitle() ..'"'.." by CMYK", 32, 32 )
	--Debug shit
	love.graphics.print( "Window Height: " ..love.window.getHeight(), 32, 48 )
	love.graphics.print( "Window Width:  " ..love.window.getWidth(), 32, 64 )
	love.graphics.print( "Player X: " ..player.x, 32, 80 )
	love.graphics.print( "Player Y: " ..player.y, 32, 96 )
end

function crossHair()
	--Draw the crosshair
	love.graphics.line( mouse_x - 16, mouse_y, mouse_x + 16, mouse_y )
	love.graphics.line( mouse_x, mouse_y - 16, mouse_x, mouse_y + 16 )
end

function love.quit ()
	local file = io.open("save.sav", "w")
	file:write(player.x)
	file:close()
end