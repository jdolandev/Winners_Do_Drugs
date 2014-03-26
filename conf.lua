function love.conf(t)
	t.title = "Winners Do Drugs"		--Title of the game
	t.author = "CMYK"					--Author of the game
	t.identity = "Winners Do Drugs"		--Identity in appdata
	t.console = false					--Debug console
	t.version = "0.9.0"					--Lua version

	--Window config
	t.window.icon = "img/icon.png" 		--Image for the icon
	t.window.width = 512				--Screen Width
	t.window.height = 480				--Screen Height

	t.modules.graphics = true			--Use the graphics module
	t.modules.image = true				--Use the image module
end