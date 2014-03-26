player = class:new()

function player:init( x, y, width, height )
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.speed = 100
	self.hspeed = 0.0
	self.vspeed = 5.0
	self.maxH = 5.0
end

function player:update(dt)

	--Move left
	if love.keyboard.isDown("a") then
		if (self.x > 0) then
			if self.hspeed > -self.maxH then
				self.hspeed = self.hspeed - 0.2
			end
			self.x = math.floor(self.x + self.hspeed)
		end
	--Move right
	elseif love.keyboard.isDown("d") then
		if self.x + self.width < love.graphics.getWidth() then
			if self.hspeed < self.maxH then
				self.hspeed = self.hspeed + 0.2
			end 
			if self.hspeed < 0 then
				self.hspeed = self.hspeed + 0.4
			end
			self.x = math.floor(self.x + self.hspeed)
		end
	--If no keys are being pressed
	else
		if self.hspeed > 0 then
			self.hspeed = self.hspeed - 0.4
		elseif self.hspeed < 0 then
			self.hspeed = self.hspeed + 0.4
		end
	end
	--Check wall collision
	if self.x <= 0 then
		self.x = 0
	elseif self.x >= love.graphics.getWidth() - self.width then
		self.x = love.graphics.getWidth() - self.width
	end
	--Gravity
	if self.y < ( love.graphics.getHeight() - 32 ) then
		self.y = self.y + self.vspeed
		self.vspeed = self.vspeed + 0.3
		self.x = self.x - ((self.vspeed / self.width) * 2 )
		self.height = self.height - (( self.vspeed / self.height ) * 4 )
		self.width = self.width + (( self.vspeed / self.width ) * 2 )
	else
		self.height = 32
		self.width = 32
		self.y = love.graphics.getHeight() - 32
		self.vspeed = 0;
		self.x = math.floor( self.x )

	end
	--Jumping
	if love.keyboard.isDown(" ") then
		if self.y == love.graphics.getHeight() - 32 then
			self.y = self.y - 1
			self.vspeed = -7.0
			jumpsnd = love.audio.newSource("snd/jump.wav", "static")
			jumpsnd:play()
		end
	end
end

function player:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end