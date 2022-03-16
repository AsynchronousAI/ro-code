local function module(name)
	return require(script.Parent[name])
end

local function main(dataObject)
	local attributes = {}

	for i = 1, 10000 do 
		wait(5)
		local let = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
		local word = ""
		local Number_Letters_Per_Word = 10
		for i=1,Number_Letters_Per_Word do
			local New_Letter = let[math.random(1, #let)]
			word = word..New_Letter
		end

		if dataObject:GetAttribute(word) then
			table.insert(word, dataObject:GetAttribute(word))
		end
		module("Wait")(5)
	end

	return attributes
end

return main
