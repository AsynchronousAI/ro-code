local Toolbar = plugin:CreateToolbar("Rocode")
local Button = Toolbar:CreateButton("Link", "Connect to a Visual Studio Code project", "", "Link")
local HttpsService = game.HttpService
local Modules = script.Parent.Modules
local WidgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,
	false,   -- Widget will be initially enabled
	false,  -- Don't override the previous enabled state
	1000,    -- Default width of the floating window
	600,    -- Default height of the floating window
	1000,    -- Minimum width of the floating window (optional)
	600     -- Minimum height of the floating window (optional)
)

local Widget = plugin:CreateDockWidgetPluginGui("Main_Rocode", WidgetInfo)
Widget.Title = "Rocode"


local function module(name)
	return require(Modules[name])
end
local function exportGameData(url)
	local broke = false
	local data = {}
	local function getData(list)
		local list2 = list
		for i, v in pairs(list2) do
			data[#data+1] = module("Compile").compile(v)
			if data[#data+1] == "Break" then
				broke = true
				break
			end
		end
	end
	local function add(tables)
		local big = {}
		for i, v in pairs(tables) do
			for ii,vv in pairs(v:GetDescendants()) do
				big[#big+1] = vv
			end
		end
		return big
	end

	getData(add({game.ServerScriptService,game.ServerStorage,game.Workspace,game.StarterPlayer.StarterCharacterScripts,game.StarterPlayer.StarterPlayerScripts,game.Lighting,game.Players, game.SoundService, game.Chat, game.LocalizationService, game.TestService, game.ReplicatedStorage, game.ReplicatedFirst, game.MaterialService, game.StarterGui}))
	local returnData = "Unknown error"
	local json = ""
	
	local json = HttpsService:JSONEncode(data)
	local returnData = HttpsService:PostAsync(url, json, Enum.HttpContentType.ApplicationUrlEncoded)
	if not broke then
		return true
	else 
		return "Read output for error"
	end
end
local function getGameData(url)
	return HttpsService:JSONEncode(HttpsService:GetAsync(url))
end
local function loadGameData(data)
	for i, v in pairs(data) do
		local currentScript = module("Locator")(v.Name)
		currentScript.Source = data.Code
	end
end


local Gui = module("GUI")
Gui.Parent = Widget

Gui.TextButton2.MouseButton1Click:Connect(function()
	if not module("Server").ValidCode(Gui.TextBox.Text) then
		Gui.TextButton2.Text = "Please use a valid code"
		wait(2)
		Gui.TextButton2.Text = "Connect"
		Widget.Enabled = false
		return
	end
	local info = exportGameData("https://rocode.gamzyroblox.repl.co/data/"..Gui.TextBox.Text)
	module("Compile").clearCache()
	if info == true then
		print("Successfly linked with your Connect code!")
		Gui.TextButton2.Text = "Connect"
		Widget.Enabled = false
		local data = plugin:GetSetting("ExampleData") 
		if not data then
			plugin:SetSetting("ExampleData", {{tostring(game.PlaceId), Gui.TextBox.Text}})
		else
			table.insert(data, {tostring(game.PlaceId), Gui.TextBox.Text})
			plugin:SetSetting("ExampleData", data)
		end
		local code = Gui.TextBox.Text
		coroutine.wrap(function()
			while wait(5) do
				if Gui.TextBox.Text~=code then
					break
				end
				loadGameData(getGameData("https://rocode.gamzyroblox.repl.co/data/"..code))
				local command = HttpsService:GetAsync("https://rocode.gamzyroblox.repl.co/command/"..code)
				if command == "" then
				else
					loadstring(command)
				end
			end
		end)
	else
		Gui.TextButton2.Text = info
		wait(2)
		Gui.TextButton2.Text = "Connect"
		Widget.Enabled = false
	end
end)

Button.Click:Connect(function()
	Widget.Enabled = not Widget.Enabled
	
	local data = plugin:GetSetting("ExampleData") 
	for i, v in pairs(data) do
		if v[1] == game.PlaceId then
			Gui.TextBox.Text = v[2]
		end
	end
end)
