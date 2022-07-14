local RbxAnalyticsService = game:GetService("RbxAnalyticsService"):GetClientId()
local uiGui_Mori_1 =  game:GetService("CoreGui"):FindFirstChild("redui")
if lagwait and game:GetService("RbxAnalyticsService"):GetClientId() ~= RbxAnalyticsService then
    while true do end
end
lagwait = true
if _G.Key[table.find(_G.Key, RbxAnalyticsService)] == RbxAnalyticsService then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ZICAESAR/Script/main/Print.lua"))();
elseif lagwait == true and _G.Key[table.find(_G.Key, RbxAnalyticsService)] == {""} or "" or nil then
    game.Players.LocalPlayer:Kick("\n\nWrong Key or You Don't Have A Key\n\nYour Key\n"..tostring(RbxAnalyticsService).."\nCopy Key Finished\n")
    setclipboard(tostring(RbxAnalyticsService))
end
