function undebounce()
	conf.delay_debounce = false
end

function colorback(index)
	enemies:getChildAt(index):setColorTransform(1,1,1,1)
end