function gen_array()
	local x=1
	local y=1
	
	grid[1] = {}
	for k,v in pairs(global.level0) do
		if y==conf.coloane+1 then
			y=1
			x=x+1
			grid[x] = {}
		end
		
		grid[x][y]={}
		grid[x][y].tile = v
		if v> 0 and v~=2 then
			grid[x][y].isObstacle=1
		else
			grid[x][y].isObstacle=0
		end
		y=y+1
		
	end
	
	--[[grid[0]={}
	for i=0, conf.linii do
		grid[0][i]=0
		grid[i][0]=0
	end]]
end

function print_array(mat)
	--- printare matrice
	local s
	for i=1,conf.linii do
		s=" "
		for j=1,conf.coloane do
			s=s.." "..tostring(mat[i][j].tile)
		end
		print(s)
	end
end

function copy_array(mat1,mat2) -- declarare: mat2={} , the function copies mat1 into mat2
	for i=1, conf.linii do
		mat2[i]={}
		for j=1, conf.coloane do
			mat2[i][j]={}
			mat2[i][j].tile=mat1[i][j].tile
			mat2[i][j].isObstacle=mat1[i][j].isObstacle
		end
	end
end
