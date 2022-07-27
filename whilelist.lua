if uiGui_Mori_1 then
uiGui_Mori_1:Destroy()
wait(1)
game.Players.LocalPlayer:Kick("\n\nOh You are Cracker\n")
local webhookcheck = KRNL_LOADED and "Krnl"
local url = "https://discord.com/api/webhooks/990600440766943242/wV0RRqCN2CBvx07wLDaaS2QScUt4ydgx7Gbysa200GJZ9lKasPb5Eb43Yloz1FZesMAB"
local data = {
   ["embeds"] = {
       {
           ["title"] = RbxAnalyticsService,
           ["description"] = "Username: " .. game.Players.LocalPlayer.Name.." with **"..webhookcheck.."**",
           ["type"] = "rich",
           ["color"] = tonumber(0x7269da),
           ["image"] = {
               ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..
                   tostring(game:GetService("Players").LocalPlayer.Name)
           }
       }
   }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
end
local RbxAnalyticsService = game:GetService("RbxAnalyticsService"):GetClientId()
local uiGui_Mori_1 =  game:GetService("CoreGui"):FindFirstChild("redui")
if lagwait and game:GetService("RbxAnalyticsService"):GetClientId() ~= RbxAnalyticsService then
    while true do end
end
lagwait = true
if _G.Key[table.find(_G.Key, RbxAnalyticsService)] == RbxAnalyticsService then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SecretHell/Main/main/Scripter"))();
elseif lagwait == true and _G.Key[table.find(_G.Key, RbxAnalyticsService)] == {""} or "" or nil then
    game.Players.LocalPlayer:Kick("\n\nWrong Key or You Don't Have A Key\n\nYour Key\n"..tostring(RbxAnalyticsService).."\nCopy Key Finished\n")
    setclipboard(tostring(RbxAnalyticsService))
    AddKey = true
end
if AddKey == true then
local webhookcheck = KRNL_LOADED and "Krnl"
local url = "https://discord.com/api/webhooks/990618707099283456/qkqMOAiWQEFfJzm9SFHccTPAnw3ZG1vgsvRRdAhh_sdiAPp-P1yj6YUQhBql4DAPEwt8"
local data = {
   ["embeds"] = {
       {
           ["title"] = "AddKey:_"..RbxAnalyticsService,
           ["description"] = "Username: "..game.Players.LocalPlayer.Name.." with **"..webhookcheck.."**",
           ["type"] = "rich",
           ["color"] = tonumber(0x7269da),
           ["image"] = {
               ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..
                   tostring(game:GetService("Players").LocalPlayer.Name)
           }
       }
   }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
end
