bullet = Core.class(Sprite)

MX = application:getContentWidth()
MY = application:getContentHeight()

local increment

function Sprite:setSize(newWidth, newHeight)
  self:setScale(1, 1)
  local originalWidth = self:getWidth()
  local originalHeight = self:getHeight()
  self:setScale(newWidth / originalWidth, newHeight / originalHeight)
end

function Sprite:collidesWith(sprite2)
	local x,y,w,h = self:getBounds(stage)
	local x2,y2,w2,h2 = sprite2:getBounds(stage)
	return not ((y+h < y2) or (y > y2+h2) or (x > x2+w2) or (x+w < x2))
end

function bullet:moveBoi()
	-- stiluri de deplasare a glontului :)
end

function bullet:init(start_x,start_y,putere_x, putere_y,incrm)
	-- a se determina rotatia si directia glontului in functie de puteri
	increment = incrm
	
	glont = Bitmap.new(Texture.new("Images/debug_bullet.png"))
	glont:setPosition(start_x,start_y)
	self:addChild(glont)
	
	self.pos = {}
	self.pos.x = putere_x
	self.pos.y = putere_y
	
	if glont ~= nil then
		if putere_x == 1 and putere_y == 1 then
			glont:setRotation(135)
		elseif putere_x == -1 and putere_y == 1 then
			glont:setRotation(45)
		elseif putere_x == 1 and putere_y == -1 then
			glont:setRotation(45)
		elseif putere_x == -1 and putere_y == -1 then
			glont:setRotation(135)
		elseif putere_x ==0 then
			glont:setRotation(90)
		end
	end
	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function bullet:selfDestroy()
	self:setPosition(-1800,-1800)
end

function bullet:doDamage(index) -- do damage to the enemy with the current index
	local test = enemies:getChildAt(index)
	test.health = test.health - 20
	self:selfDestroy()
	-- efect de inrosire
	enemies:getChildAt(index):setColorTransform(.9,.2,0,1)
	local vr =enemies:getChildAt(index)
	Timer.delayedCall(320, function() if vr ~= nil then vr:setColorTransform(1,1,1,1) end end)
end

function bullet:onEnterFrame(event)
	local pw_x = self.pos.x
	local pw_y = self.pos.y
	self:setPosition(self:getX()+increment*pw_x, self:getY()-increment*pw_y)
	
	for i=1, helpers.enemy_count do
		if glont ~= nil and enemies:getChildAt(i)~=nil and self:collidesWith(enemies:getChildAt(i)) == true then
			self:doDamage(i)
		end
	end
	
end