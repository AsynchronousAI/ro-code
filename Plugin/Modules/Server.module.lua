local module = {}
local HttpsService = game.HttpService

module.ValidCode = function(code)
	local url = "https://rocode.gamzyroblox.repl.co/data/"..code
	if HttpsService:GetAsync(url) == "Not found" then
		return false
	else
		return true
	end
end
return module
