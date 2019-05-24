
--[[                           PLAN

*generate screens
*generate map from tiles
*character class
*bullet class
*enemy class
*joystick functions

]]--

--setting up some configurations
application:setOrientation(conf.orientation)
application:setLogicalDimensions(conf.width, conf.height)
application:setScaleMode(conf.scaleMode)
application:setFps(conf.fps)
application:setKeepAwake(conf.keepAwake)

application:setBackgroundColor(0xFFFFFF)


local function onEnterFrame()

end

stage:addEventListener(Event.ENTER_FRAME, onEnterFrame) 

--define scenes
sceneManager = SceneManager.new({
	["testPhysics"] = testPhysics,
	["options"] = options,
	["level"] = level
})
--add manager to stage
gen_array()
--print_array(grid)
stage:addChild(sceneManager)

--start start scene
sceneManager:changeScene("testPhysics", 1, conf.transition, conf.easing)
