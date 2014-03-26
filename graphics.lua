Graphics = {}

function Graphics:setColor( c )
	if self.lastColor ~= c then
		self.lastColor = c
		love.graphics.setColor( c )
	end
	return self
end

function Graphics:drawRect( x, y, w, h, c )
	if c then self:setColor(c) end
	love.graphics.rectangle( "fill", x, y, w, h )
	return self
end

WHITE = { 255, 255, 255 }
BLACK = { 0, 0, 0 }