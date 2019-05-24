conf = {
	orientation = Stage.LANDSCAPE_LEFT,
	transition = SceneManager.flip, --crossfade, flip
	easing = easing.outBack,
	textureFilter = true,
	scaleMode = "letterbox",
	keepAwake = true,
	smallFont = TTFont.new("Fonts/kongtext.ttf", 60),
	width = 640,
	height = 960,
	fps = 60,
	dx = application:getLogicalTranslateX() / application:getLogicalScaleX(),
	dy = application:getLogicalTranslateY() / application:getLogicalScaleY(),
	speed = 2.5,
	char_speed = 3,
	-------------[  Array Stuff  ]-------------
	dimens = 64,
	coloane = 16, -- mereu cu 2 mai mult de cat linile ? -- 16
	linii = 13,
	-------------[  Bullet system  ]---------------
	delay_debounce = false, -- tot pt gloante
	range = 3000, -- timp pana la autodistrugere
	delay = 100, -- intre gloante
	-------------[ Intermission ]----------------
	intermission = 5000,
	-------------[ Greetings]--------------------
	greetings = {"Well done!","Congratulations!","Good job!","Amazing!","Nice work!"},
	-------------[ Joystick Configs] ---------------
	extensie = 64 * 2.5,
	marimeBox = 6,
	marimeJoy = 2,
	transp_umbra = 0.25
}

helpers= {
	enemy_count = 0
}


global = {
	level0 = {  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	}
}

system ={} --- time till interchange or 0 | enemies till interchange or 0 | enemy pool | delay
system[0] = { 1000, 0, 1, 1000, 1, 2000, 1, 2000, 1, 2000, 1, 2000, 1, 2000, 1, 2000, 1, 2000, -1 }
system[1] = { 1000, 0, 1, 1000, 1, 2000, -1 }
system[2] = { 6000, 0, 1, 1000, 2, 2000, -1 }
system[3] = { 6000, 0, 1, 1000, 2, 2000, -1 }
system[4] = { 2000, 0, 1, 200, 2, 200, 2, 200, 2, 200, 2, 200, 2, 200, -1 }
system[5] = { 6000, 0, 1, 1000, 2, 2000, -1 }
system[6] = { 6000, 0, 1, 1000, 2, 2000, -1 }
system[7] = { 6000, 0, 1, 1000, 2, 2000, -1 }

HP = 1000

enemies = Sprite.new()
portal_group = Sprite.new()
bullet_group = Sprite.new()

grid={}

-- proprietati inamic default, properties of special mobs down below

mouse_x=0
mouse_y=0