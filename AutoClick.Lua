repeat wait() until game:IsLoaded()

if game:GetService("CoreGui"):FindFirstChild("AutoClick") then
   game:GetService("CoreGui"):FindFirstChild("AutoClick"):Destroy()
end

local UILib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ZICAESAR/Key-Loader/main/UILib.lua"))()

local win = UILib:Window("Lobby Hub (AutoClick)",Color3.fromRGB(244,0,0),Enum.KeyCode.RightControl)
local log = win:Tab("AutoClick")

log:Toggle("AutoClick (Slow)", false, function(vu)
Click2 = vu
end)

log:Toggle("AutoClick (Medium)", false, function(vu)
Click1 = vu
end)

log:Toggle("AutoClick (Fast)", false, function(vu)
Click3 = vu
end)

log:Toggle("AutoClick (Very Fast)", false, function(vu)
Click4 = vu
end)

log:Button("FPSBOOT", function()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
spawn(function()
	while wait() do
            if Click1 then
		for i,v in pairs(getconnections(game:GetService("Players").zizacaesar.PlayerGui.mainUI.clickerButton.MouseButton1Click)) do
			v.Function()
        end
    end
end)

spawn(function()
	while wait(.2) do
            if Click2 then
		for i,v in pairs(getconnections(game:GetService("Players").zizacaesar.PlayerGui.mainUI.clickerButton.MouseButton1Click)) do
			v.Function()
        	end
    	end
end)

spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
            if Click3 then
		for i,v in pairs(getconnections(game:GetService("Players").zizacaesar.PlayerGui.mainUI.clickerButton.MouseButton1Click)) do
			v.Function()
             	end
      	end)
end)

spawn(function()
	game:GetService("RunService").Heartbeat:Connect(function()
            if Click4 then
		for i,v in pairs(getconnections(game:GetService("Players").zizacaesar.PlayerGui.mainUI.clickerButton.MouseButton1Click)) do
			v.Function()
		for i,v in pairs(getconnections(game:GetService("Players").zizacaesar.PlayerGui.mainUI.clickerButton.MouseButton1Click)) do
			v.Function()
		for i,v in pairs(getconnections(game:GetService("Players").zizacaesar.PlayerGui.mainUI.clickerButton.MouseButton1Click)) do
			v.Function()
		for i,v in pairs(getconnections(game:GetService("Players").zizacaesar.PlayerGui.mainUI.clickerButton.MouseButton1Click)) do
			v.Function()
		     end
	         end
	     end
         end
    end)
end)
