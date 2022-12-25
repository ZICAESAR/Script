--getgenv().Key = "A657811A48L148E38919_IT"

--[[
	Admin : A657811A48L148E38919_IT
	Dev : M158A98633A8814DO74Bb9_IT
	Mod : LOCKER_MOD_M2975484h5478ac8484v4b8
]]--

--obf start
local main = {
	["1"] = rconsoleprint,
	["2"] = hookfunc,
	["3"] = hookfunction,
	["4"] = replaceclosure,
	["5"] = setreadonly,
	["6"] = make_writeable,
	["7"] = print,
	["8"] = warn,
	["9"] = writefile,
	["10"] = appendfile,
	["11"] = setclipboard,
}
if getgenv().AntihookFF1 == nil then
	getgenv().AntihookFF1 = {
		["print"] = false,
		["hook"] = false
	}
end
local azx 
azx = hookfunc(rconsoleprint, function (...)
	if getgenv().AntihookFF1["print"] == true then
		return azx(...)
	else
		return 
	end
end)
local al 
al = hookfunc(hookfunction, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return al(...)
	else
		return 
	end
	
end)
local al 
al = hookfunc(setclipboard, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return al(...)
	else
		return 
	end
end)
local an 
an = hookfunc(replaceclosure, function (...)
	if getgenv().AntihookFF1["print"] == true then
		return an(...)
	else
		return 
	end
	
end)
local ay 
ay = hookfunc(setreadonly, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return ay(...)
	else
		return 
	end
	
end)
local ae 
ae = hookfunc(make_writeable, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return ae(...)
	else
		return 
	end
end)
local av 
av = hookfunc(print, function (...)
	if getgenv().AntihookFF1["print"] == true then
		return av(...)
	else
		return 
	end
end)
local at 
at = hookfunc(warn, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return at(...)
	else
		return 
	end
end)
local aw 
aw = hookfunc(writefile, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return aw(...)
	else
		return 
	end
end)
local aq
aq = hookfunc(appendfile, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return aq(...)
	else
		return 
	end
end)
local dsa
dsa = hookfunc(clonefunction,function(...)
    if getgenv().AntihookFF1["hook"] == true then
		return dsa(...)
	else
		return 
	end
end)
local as 
as = hookfunc(hookfunc, function (...)
	if getgenv().AntihookFF1["hook"] == true then
		return as(...)
	else
		return 
	end
end)

getgenv().rconsoleprint = function(...)
	if getgenv().AntihookFF1["print"] == true then
		return main["1"](...)
	else
		return "Secret"
	end
end
getgenv().hookfunc = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["2"](...)
	else
		return "Secret"
	end
end
getgenv().hookfunction = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["3"](...)
	else
		return "Secret"
	end
end
getgenv().replaceclosure = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["4"](...)
	else
		return "Secret"
	end
end
getgenv().setreadonly = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["5"](...)
	else
		return "Secret"
	end
end
getgenv().make_writeable = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["6"](...)
	else
		return "Secret"
	end
end
getgenv().print = function(...)
	if getgenv().AntihookFF1["print"] == true then
		return main["7"](...)
	else
		return "Secret"
	end
end
getgenv().warn = function(...)
	if getgenv().AntihookFF1["print"] == true then
		return main["8"](...)
	else
		return "Secret"
	end
end
getgenv().writefile = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["9"](...)
	else
		return "Secret"
	end
end
getgenv().appendfile = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["10"](...)
	else
		return "Secret"
	end
end
getgenv().setclipboard = function(...)
	if getgenv().AntihookFF1["hook"] == true then
		return main["11"](...)
	else
		return "Secret"
	end
end
spawn(function()
    game:GetService("RunService").RenderStepped:connect(function()
        game.CoreGui.ChildAdded:connect(function(p1)
        	if p1:FindFirstChild("PropertiesFrame") or p1:FindFirstChild("ExplorerPanel") or p1:FindFirstChild("SaveInstance") then -- Dark Dex frames/children
                game.Players.LocalPlayer:Kick("\n\nAnti Dark Dex\n")
                wait(.1)
        		while true do end
        	end
        end)
    end)
end)
--[[spawn(function()
    game:GetService("RunService").RenderStepped:connect(function()
        for i,v in pairs (game:GetService("CoreGui"):GetChildren())do
            if v.Name == "DevConsoleMaster" then
                v.Enabled = false
                v:Destroy()
                game.Players.LocalPlayer:Kick("\n\nAnti Dev Console\n")
                wait(.1)
                while true do end
            end
        end
    end)
end)]]
game.CoreGui.ChildAdded:connect(function(q)
    game.RunService.RenderStepped:connect(function()
        if q.Name == "UI LIB" or q.Name == "spyu" then
            while true do end
        end
    end)
end)
local UIS = game:GetService("UserInputService")
local keydown = false
UIS.InputBegan:Connect(function(Input)
    if Input.KeyCode == Enum.KeyCode.Insert then
        keydown = true
        game.Players.localPlayer:Kick("\n\nAnti Console Synapse X\n")
        while true do
        end
    end
end)
    local urlHttp = "https://discord.com/api/webhooks"
    local urlCrl = "1056152047818391583"
    local url =  urlHttp .. "/" .. urlCrl .. "/" .. "h14e6Zi2v4va27JIabwblW7_CP6ctnMuMzEs4IWR7pwcKwnDHmxNVBHcMf-DVJ5MABgb"
    local data = {
        ["content"] = "",
        ["embeds"] = {
            {
                ["title"] = "API SERVICES",
                ["description"] = "API LOADING...\nPlease Check UI",
                ["type"] = "rich",
            }
        }
    }
    local data = game:GetService("HttpService"):JSONEncode(data)
    local header = {["content-type"] = "application/json"}
    local request = http_request or request or HttpPost or syn.request
    local serversdata = {Url = url, Body = data, Method = "POST", Headers = header}
	local ts = game:GetService("TeleportService")
	local p = game:GetService("Players").LocalPlayer
	local Key = getgenv().Key
    request(serversdata)
    if true or false then
        function a:Admin()
            if Key == "A657811A48L148E38919_IT" then
				warn("API IS LOADING")
			else
				game.Players.LocalPlayer:Kick()
                ts:Teleport(game.PlaceId, p)
            end
        end
        function a:Dev()
            if Key == "M158A98633A8814DO74Bb9_IT" then
				warn("API IS LOADING")
			else
				game.Players.LocalPlayer:Kick()
				ts:Teleport(game.PlaceId, p)
            end
        end
        function a:Mod()
            if Key == "LOCKER_MOD_M2975484h5478ac8484v4b8" then
				warn("API IS LOADING")
			else
				game.Players.LocalPlayer:Kick()
				ts:Teleport(game.PlaceId, p)
            end
        end
    end

--obf end
