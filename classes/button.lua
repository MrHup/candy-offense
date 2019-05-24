 --[[
class button v 1.3 <a href="https://simartinfo.blogspot.com/p/blog-page_23.html" target="_blank" rel="nofollow">https://simartinfo.blogspot.com/p/blog-page_23.html</a>
author (c) <a href="https://www.facebook.com/AndroidMobileGame" target="_blank" rel="nofollow">https://www.facebook.com/AndroidMobileGame</a>
Usage:
------------------------------------
	local btn1= Button.new(Bitmap.new(Texture.new("img/gui_48.png")))
	stage:addChild(btn1)
 
 
	btn1:addEventListener("clickDown", 
		function(e)	
		e:stopPropagation()
                        ---------------------
			print("button Down")
 
                        ---------------------
		end)
 
	btn1:addEventListener("clickUP", 
		function(e)	
		e:stopPropagation()
                        ---------------------
			print("button Up")
 
                        ---------------------
 
		end)	
		btn1:addEventListener("clickMove", 
		function(e)	
   ---------------------
		print(e.x) 
   ---------------------
 
 
		end)	
-------------------------------------
]]
 
Button = gideros.class(Sprite)
 
function Button:init(upState)
	self:addChild(upState)
	self:addEventListener(Event.TOUCHES_BEGIN, self.onTouchesBegin, self)
	self:addEventListener(Event.TOUCHES_MOVE, self.onTouchesMove, self)
	self:addEventListener(Event.TOUCHES_END, self.onTouchesEnd, self)
	self.on=false
end
 
 
 
 function Button:onTouchesBegin(event)
	mouse_x = event.touch.x
	mouse_y = event.touch.y
	if self:hitTestPoint(event.touch.x, event.touch.y) then
 
		if event.touch.id~=self.focus then 
			self.focus=event.touch.id
 
			if self.on==false then
 
 
				self:dispatchEvent(Event.new("clickDown"))
				self.on=true
				
			end
			--print("natysnuv"..event.touch.id)
		end
		event:stopPropagation()
	end
 
end
 
 function Button:onTouchesMove(event)
	if self:hitTestPoint(event.touch.x, event.touch.y) then
		if self.focus~=event.touch.id then
			self.focus=event.touch.id
			if self.on==false then
				self:dispatchEvent(Event.new("clickDown"))
				self.on=true
				
			end
		else
			local clickMove = Event.new("clickMove")
			clickMove.x = event.touch.x
			clickMove.y = event.touch.y
			self:dispatchEvent(clickMove)
		end
	end
 
end
 
 function Button:onTouchesEnd(event)
	if self:hitTestPoint(event.touch.x, event.touch.y) then
 
		self.focus=nil
 
		if self.on==true then
			self:dispatchEvent(Event.new("clickUP"))
			self.on=false
		end
		event:stopPropagation()
	end
 
end