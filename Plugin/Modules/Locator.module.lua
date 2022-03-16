local function findScript(name)
	local function add(tables)
		local big = {}
		for i, v in pairs(tables) do
			for ii,vv in pairs(v:GetChildren()) do
				big[#big+1] = vv
			end
		end
		return big
	end
	local all = add({game.ServerScriptService,game.ServerStorage,game.Workspace,game.StarterPlayer.StarterCharacterScripts,game.StarterPlayer.StarterPlayerScripts,game.Lighting,game.Players, game.SoundService, game.Chat, game.LocalizationService, game.TestService, game.ReplicatedStorage, game.ReplicatedFirst, game.MaterialService, game.StarterGui})

	for i, v in pairs(all) do
		if v.Name == name then
			return v
		end
	end
end
local function tablefind(table, item)
	local a = 0
	for i, v in pairs(table) do
		if v == item then
			a = a+1
		end
	end
	return a 
end
return {["script"]=findScript,["find"]=tablefind}
