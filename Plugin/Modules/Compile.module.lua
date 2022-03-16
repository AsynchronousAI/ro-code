local usedNames = {}

local function module(name)
	return require(script.Parent[name])
end

local function dataCompile(dataObject)
	if dataObject ~= nil then
		local currentData = {}
		local function isA(requirement)
			return typeof(dataObject) == "Instance" and dataObject:IsA(requirement)
		end

		if isA("Script") or isA("LocalScript") or isA("ModuleScript") then
			if module("Locator").find(usedNames, dataObject.Name)>1 then
				warn(tostring(module("Locator").find(usedNames, dataObject.Name)).." scripts named "..dataObject.Name.." were found, Please give each object a individual name")
				return "Break"
			end
			currentData.Code = dataObject.Source
			--currentData.Attributes = getAttributes(dataObject)
			currentData.Name = dataObject.Name
			currentData.Parent = dataObject.Parent.Name
			table.insert(usedNames, dataObject.Name)
			return currentData
		end
	else 
		return nil -- Returns void (Non existent)
	end
end
local function function1clear()
	usedNames = {}
end
return {compile = dataCompile, clearCache = function1clear}
