local function module(density)
	if math.random(1,density) == 1 then
		task.wait()
	end
end

return module
