repeat wait() until game:IsLoaded()

local ui =  game:GetService("CoreGui"):FindFirstChild("redui")  
if ui then 
ui:Destroy()
end

OldWorld = false
NewWorld = false
ThreeWorld = false
local placeId = game.PlaceId
if placeId == 2753915549 then
    OldWorld = true
elseif placeId == 4442272183 then
    NewWorld = true
elseif placeId == 7449423635 then
	ThreeWorld = true
end

if _G.Team == "Pirate" then
    for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
        v.Function()
    end
elseif _G.Team == "Marine" then
    for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
        v.Function()
    end
else
    for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
        v.Function()
    end
end

local UserInputService = game:GetService("UserInputService");
local TweenService = game:GetService("TweenService");
local RunService = game:GetService("RunService");
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local tween = game:GetService("TweenService");
local Red = {RainbowColorValue = 0, HueSelectionPosition = 0}
local PresetColor = Color3.fromRGB(255, 255, 255);


coroutine.wrap(
function()
    while wait() do
        Red.RainbowColorValue = Red.RainbowColorValue + 1 / 255
        Red.HueSelectionPosition = Red.HueSelectionPosition + 1

        if Red.RainbowColorValue >= 1 then
            Red.RainbowColorValue = 0
        end

        if Red.HueSelectionPosition == 160 then
            Red.HueSelectionPosition = 0
        end
    end
end
)()

local Reduisceen = Instance.new("ScreenGui")
Reduisceen.Parent = game:GetService("CoreGui")
Reduisceen.Name = "redui"
Reduisceen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling




local function MakeDraggable(topbarobject, object)
local Dragging = nil
local DragInput = nil
local DragStart = nil
local StartPosition = nil

local function Update(input)
    local Delta = input.Position - DragStart
    local pos =
        UDim2.new(
        StartPosition.X.Scale,
        StartPosition.X.Offset + Delta.X,
        StartPosition.Y.Scale,
        StartPosition.Y.Offset + Delta.Y
    )
    local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
    Tween:Play()
end

topbarobject.InputBegan:Connect(
    function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPosition = object.Position

            input.Changed:Connect(
                function()
                    if input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                    end
                end
            )
        end
    end
)

topbarobject.InputChanged:Connect(
    function(input)
        if
            input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
        then
            DragInput = input
        end
    end
)

UserInputService.InputChanged:Connect(
    function(input)
        if input == DragInput and Dragging then
            Update(input)
        end
    end
)
end

local function Tween(instance, properties,style,wa)
if style == nil or "" then
    return Back
end
tween:Create(instance,TweenInfo.new(wa,Enum.EasingStyle[style]),{properties}):Play()
end

local create = {}
function create:Win(text)
local fs = false

local MainSceen = Instance.new("Frame")
MainSceen.Name = "MainSceen"
MainSceen.Parent = Reduisceen
MainSceen.AnchorPoint = Vector2.new(0.5, 0.5)
MainSceen.BackgroundColor3 = Color3.fromRGB(15,15,15)
MainSceen.BorderSizePixel = 0
MainSceen.Position = UDim2.new(0.5, 0, 0.5, 0)
MainSceen.Size = UDim2.new(0, 0, 0, 0)
MainSceen.ClipsDescendants = true

local Main_UiConner  = Instance.new("UICorner")

Main_UiConner.CornerRadius = UDim.new(0, 4)
Main_UiConner.Name = "Main_UiConner"
Main_UiConner.Parent = MainSceen

local ClickFrame = Instance.new("Frame")
ClickFrame.Name = "ClickFrame"
ClickFrame.Parent = MainSceen
ClickFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ClickFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
ClickFrame.BorderSizePixel = 0
ClickFrame.Position = UDim2.new(0.5, 0, 0.036, 0)
ClickFrame.Size = UDim2.new(0, 534-20, 0, 30)
ClickFrame.ClipsDescendants = true
ClickFrame.BackgroundTransparency = 0.5

MakeDraggable(ClickFrame,MainSceen)
tween:Create(MainSceen,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 550, 0, 474)}):Play()

local library = {toggledui = false;}
game:GetService("UserInputService").InputBegan:Connect(function(input)
    pcall(function()
        if input.KeyCode == Enum.KeyCode.RightControl then
            if library.toggledui == false then
                library.toggledui = true
                tween:Create(MainSceen,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size = UDim2.new(0, 0, 0, 0)}):Play()
                wait(.1)
                Reduisceen.Enabled = false
            else
                library.toggledui = false
                tween:Create(MainSceen,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 534, 0, 474)}):Play()
                Reduisceen.Enabled = true
            end
        end
    end)
end)

local NameReal = Instance.new("TextLabel")

NameReal.Parent = MainSceen
NameReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NameReal.BackgroundTransparency = 1
NameReal.BorderSizePixel = 0
NameReal.Position = UDim2.new(0.5, 0, 0.05, 0)
NameReal.AnchorPoint = Vector2.new(0.5, 0.5)
NameReal.Size = UDim2.new(0, 136, 0, 34)
NameReal.Font = Enum.Font.GothamBold
NameReal.Text = tostring(text)
NameReal.TextColor3 = Color3.fromRGB(255, 255, 255)
NameReal.TextSize = 14.000


local MainSceen2 = Instance.new("Frame")
MainSceen2.Name = "MainSceen2"
MainSceen2.Parent = MainSceen
MainSceen2.AnchorPoint = Vector2.new(0.5, 0.5)
MainSceen2.BackgroundColor3 = Color3.fromRGB(18,18,18)
MainSceen2.BorderSizePixel = 0
MainSceen2.Position = UDim2.new(0.5, 0, 0.5, 0)
MainSceen2.Size = UDim2.new(0, 0, 0, 0)
MainSceen2.ClipsDescendants = true

local Main_UiConner2  = Instance.new("UICorner")

Main_UiConner2.CornerRadius = UDim.new(0, 4)
Main_UiConner2.Name = "Main_UiConner"
Main_UiConner2.Parent = MainSceen

MainSceen2:TweenSizeAndPosition(UDim2.new(0, 550-20, 0, 474-50), UDim2.new(0.5, 0, 0.53, 0), "Out", "Back", 0.5, true)


local ScolTapBarFrame = Instance.new("Frame")
ScolTapBarFrame.Name = "MainSceen2"
ScolTapBarFrame.Parent = MainSceen2
ScolTapBarFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ScolTapBarFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
ScolTapBarFrame.BorderSizePixel = 0
ScolTapBarFrame.BackgroundTransparency = 1
ScolTapBarFrame.Position = UDim2.new(0.5, 0, 0.07, 0)
ScolTapBarFrame.Size = UDim2.new(0, 500, 0, 35)
ScolTapBarFrame.ClipsDescendants = true

local ScrollingFrame_Menubar = Instance.new("ScrollingFrame")

ScrollingFrame_Menubar.Parent = ScolTapBarFrame
ScrollingFrame_Menubar.Active = true
ScrollingFrame_Menubar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame_Menubar.BackgroundTransparency = 1
ScrollingFrame_Menubar.BorderSizePixel = 0
ScrollingFrame_Menubar.Size = UDim2.new(0, 500, 0, 35)
ScrollingFrame_Menubar.CanvasSize = UDim2.new(2, 0, 0, 0)
ScrollingFrame_Menubar.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame_Menubar.ScrollBarThickness = 3


local UIListLayout_Menubar = Instance.new("UIListLayout")

UIListLayout_Menubar.Parent = ScrollingFrame_Menubar
UIListLayout_Menubar.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_Menubar.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_Menubar.Padding = UDim.new(0, 10)

local UIPadding_Menubar = Instance.new("UIPadding")

UIPadding_Menubar.Parent = ScrollingFrame_Menubar
UIPadding_Menubar.PaddingTop = UDim.new(0, 2)


local PageOrders = -1

local Container_Page = Instance.new('Frame',MainSceen2)
Container_Page.Size = UDim2.new(0, 518, 0, 268)
Container_Page.Position = UDim2.new(0.5, 0, 0.45, 0)
Container_Page.BackgroundTransparency = 1
Container_Page.Name = "Page "
Container_Page.AnchorPoint = Vector2.new(0.5, 0.5)

local pagesFolder = Instance.new("Folder")

pagesFolder.Name = "pagesFolder"
pagesFolder.Parent = Container_Page


local UIPage = Instance.new('UIPageLayout',pagesFolder)
UIPage.SortOrder = Enum.SortOrder.LayoutOrder
UIPage.EasingDirection = Enum.EasingDirection.InOut
UIPage.EasingStyle = Enum.EasingStyle.Quad
UIPage.Padding = UDim.new(0, 10)
UIPage.TweenTime = 0.500

local top = {}

local NotiFrame = Instance.new("Frame")
NotiFrame.Name = "NotiFrame"
NotiFrame.Parent = Reduisceen
NotiFrame.AnchorPoint = Vector2.new(0.5, 0.5)
NotiFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
NotiFrame.BorderSizePixel = 0
NotiFrame.Position =  UDim2.new(1, -210, 1, -500)
NotiFrame.Size = UDim2.new(0, 400, 0, 500)
NotiFrame.ClipsDescendants = true
NotiFrame.BackgroundTransparency = 1


local Notilistlayout = Instance.new("UIListLayout")
Notilistlayout.Parent = NotiFrame
Notilistlayout.SortOrder = Enum.SortOrder.LayoutOrder
Notilistlayout.Padding = UDim.new(0, 5)


function create:Notifile(titel,text,delays)
    local TitleFrame = Instance.new("Frame")
    TitleFrame.Name = "TitleFrame"
    TitleFrame.Parent = NotiFrame
    TitleFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    TitleFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
    TitleFrame.BorderSizePixel = 0
    TitleFrame.Position =  UDim2.new(0.5, 0, 0.5,0)
    TitleFrame.Size = UDim2.new(0, 0, 0, 0)
    TitleFrame.ClipsDescendants = true
    TitleFrame.BackgroundTransparency = 0

    local ConnerTitile = Instance.new("UICorner")

    ConnerTitile.CornerRadius = UDim.new(0, 4)
    ConnerTitile.Name = ""
    ConnerTitile.Parent = TitleFrame

    TitleFrame:TweenSizeAndPosition(UDim2.new(0, 400-10, 0, 70),  UDim2.new(0.5, 0, 0.5,0), "Out", "Quad", 0.3, true)

    local imagenoti = Instance.new("ImageLabel")

    imagenoti.Parent = TitleFrame
    imagenoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    imagenoti.BackgroundTransparency = 1.000
    imagenoti.AnchorPoint = Vector2.new(0.5, 0.5)
    imagenoti.Position = UDim2.new(0.9, 0, 0.5, 0)
    imagenoti.Size = UDim2.new(0, 50, 0, 50)
--  imagenoti.Image = "https://www.roblox.com/asset-thumbnail/image?assetId=7578496318&width=0&height=0&format=png"

    local txdlid = Instance.new("TextLabel")

    txdlid.Parent = TitleFrame
    txdlid.Name = "TextLabel_Tap"
    txdlid.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    txdlid.Size =UDim2.new(0, 160, 0,25 )
    txdlid.Font = Enum.Font.GothamBold
    txdlid.Text = titel
    txdlid.TextColor3 = Color3.fromRGB(255, 255, 255)
    txdlid.TextSize = 13.000
    txdlid.AnchorPoint = Vector2.new(0.5, 0.5)
    txdlid.Position = UDim2.new(0.23, 0, 0.3, 0)
    -- txdlid.TextYAlignment = Enum.TextYAlignment.Top
    txdlid.TextXAlignment = Enum.TextXAlignment.Left
    txdlid.BackgroundTransparency = 1

    local LableFrame = Instance.new("Frame")
    LableFrame.Name = "LableFrame"
    LableFrame.Parent = TitleFrame
    LableFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    LableFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LableFrame.BorderSizePixel = 0
    LableFrame.Position =  UDim2.new(0.36, 0, 0.67,0)
    LableFrame.Size = UDim2.new(0, 260, 0,25 )
    LableFrame.ClipsDescendants = true
    LableFrame.BackgroundTransparency = 1

    local TextNoti = Instance.new("TextLabel")

    TextNoti.Parent = LableFrame
    TextNoti.Name = "TextLabel_Tap"
    TextNoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextNoti.Size =UDim2.new(0, 260, 0,25 )
    TextNoti.Font = Enum.Font.GothamBold
    TextNoti.Text = text
    TextNoti.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextNoti.TextSize = 13.000
    TextNoti.AnchorPoint = Vector2.new(0.5, 0.5)
    TextNoti.Position = UDim2.new(0.5, 0, 0.5, 0)
    -- TextNoti.TextYAlignment = Enum.TextYAlignment.Top
    TextNoti.TextXAlignment = Enum.TextXAlignment.Left
    TextNoti.BackgroundTransparency = 1

    repeat wait() until TitleFrame.Size == UDim2.new(0, 400-10, 0, 70)

    local Time = Instance.new("Frame")
    Time.Name = "Time"
    Time.Parent = TitleFrame
--Time.AnchorPoint = Vector2.new(0.5, 0.5)
    Time.BackgroundColor3 =  Color3.fromRGB(255, 255, 255)
    Time.BorderSizePixel = 0
    Time.Position =  UDim2.new(0, 0, 0.,0)
    Time.Size = UDim2.new(0, 0,0,0)
    Time.ClipsDescendants = false
    Time.BackgroundTransparency = 0

    local ConnerTitile_Time = Instance.new("UICorner")

    ConnerTitile_Time.CornerRadius = UDim.new(0, 4)
    ConnerTitile_Time.Name = ""
    ConnerTitile_Time.Parent = Time


    Time:TweenSizeAndPosition(UDim2.new(0, 400-10, 0, 3),  UDim2.new(0., 0, 0.,0), "Out", "Quad", 0.3, true)
    repeat wait() until Time.Size == UDim2.new(0, 400-10, 0, 3)

    TweenService:Create(
        Time,
        TweenInfo.new(tonumber(delays), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
        {Size = UDim2.new(0, 0, 0, 3)} -- UDim2.new(0, 128, 0, 25)
    ):Play()
    delay(tonumber(delays),function()
        TweenService:Create(
            TitleFrame,
            TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        wait(0.3)
        TitleFrame:Destroy()
    end
)
end

function top:Taps(text)
    PageOrders = PageOrders + 1
    local name = tostring(text) or tostring(math.random(1,5000))

    local Frame_Tap = Instance.new("Frame")
    Frame_Tap.Parent = ScrollingFrame_Menubar
    Frame_Tap.Name = text.."Server"
    Frame_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_Tap.BackgroundTransparency = 1
    Frame_Tap.Position = UDim2.new(0.0, 0, 0.0, 0)
    Frame_Tap.Size = UDim2.new(0, 100, 0, 25)
    Frame_Tap.Visible = true

    local TextLabel_Tap = Instance.new("TextLabel")

    TextLabel_Tap.Parent = Frame_Tap
    TextLabel_Tap.Name = "TextLabel_Tap"
    TextLabel_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_Tap.Position = UDim2.new(0.5, 0, 0.8, 0)
    TextLabel_Tap.Size = UDim2.new(0, 0, 0, 0)
    TextLabel_Tap.Font = Enum.Font.SourceSans
    TextLabel_Tap.Text = " "
    TextLabel_Tap.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_Tap.TextSize = 14.000
    TextLabel_Tap.AnchorPoint = Vector2.new(0.5, 0.5)

    local TextButton_Tap = Instance.new("TextButton")

    TextButton_Tap.Parent = Frame_Tap
    TextButton_Tap.Name = "TextButton_Tap"
    TextButton_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_Tap.BackgroundTransparency = 1.000
    TextButton_Tap.Position = UDim2.new(0.114491031, 0, -0.0216345787, 0)
    TextButton_Tap.Size = UDim2.new(0, 80, 0, 20)
    TextButton_Tap.Font = Enum.Font.GothamSemibold
    TextButton_Tap.TextColor3 = Color3.fromRGB(155, 155, 155)
    TextButton_Tap.TextSize = 13.000
    TextButton_Tap.Text = tostring(text)

    local MainPage = Instance.new("Frame")

    MainPage.Name = name.."_MainPage"
    MainPage.Parent = pagesFolder
    MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainPage.BorderSizePixel = 0
    MainPage.Position = UDim2.new(0.5, 0, 0.5, 0) -- UDim2.new(0.0149812736, 0, 0.13, 0)
    MainPage.Size = UDim2.new(0, 518, 0, 375)
    MainPage.BackgroundTransparency = 1
    MainPage.ClipsDescendants = true
    MainPage.Visible = true
    MainPage.LayoutOrder = PageOrders




    TextButton_Tap.MouseButton1Click:connect(function()
        if MainPage.Name == text.."_MainPage" then
            UIPage:JumpToIndex(MainPage.LayoutOrder)

        end
        for i ,v in next , ScrollingFrame_Menubar:GetChildren() do
            if v:IsA("Frame") then
                TweenService:Create(
                    v.TextButton_Tap,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)}
                ):Play()
            end

            TweenService:Create(
                TextButton_Tap,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)}
            ):Play()
        end
    end)

    if fs == false then
        -- TweenService:Create(
        --     TextLabel_Tap,
        --     TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        --     {Size = UDim2.new(0, 70, 0, 2)}
        -- ):Play()
        TweenService:Create(
            TextButton_Tap,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextColor3 = Color3.fromRGB(255, 255, 255)}
        ):Play()

        MainPage.Visible = true
        Frame_Tap.Name  = text .. "Server"
        fs  = true
    end
    local ScrollingFrame_Pagefrist = Instance.new("ScrollingFrame")

    ScrollingFrame_Pagefrist.Parent = MainPage
    ScrollingFrame_Pagefrist.Active = true
    ScrollingFrame_Pagefrist.BackgroundColor3 = Color3.fromRGB(23, 23, 23) -- 249, 53, 139
    ScrollingFrame_Pagefrist.BorderSizePixel = 0
    ScrollingFrame_Pagefrist.Size = UDim2.new(0, 518, 0, 375)
    ScrollingFrame_Pagefrist.ScrollBarThickness = 4
    ScrollingFrame_Pagefrist.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255) -- 249, 53, 139

    local UIGridLayout_Pagefrist = Instance.new("UIGridLayout")
    local UIPadding_Pagefrist = Instance.new("UIPadding")

    UIGridLayout_Pagefrist.Archivable = false
    UIGridLayout_Pagefrist.Parent = ScrollingFrame_Pagefrist
    UIGridLayout_Pagefrist.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout_Pagefrist.CellPadding = UDim2.new(0, 13, 0, 15)
    UIGridLayout_Pagefrist.CellSize = UDim2.new(0, 240, 0, 370)

    UIPadding_Pagefrist.Parent = ScrollingFrame_Pagefrist
    UIPadding_Pagefrist.PaddingLeft = UDim.new(0, 10)
    UIPadding_Pagefrist.PaddingTop = UDim.new(0, 20)

    local page = {}

    function page:newpage()

        local Pageframe = Instance.new("Frame")


        Pageframe.Parent = ScrollingFrame_Pagefrist
        Pageframe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Pageframe.BorderSizePixel = 0
        Pageframe.Position = UDim2.new(0.028957529, 0, 0.0496277921, 0)
        Pageframe.Size = UDim2.new(0, 240, 0, 379)


        local ScrollingFrame_Pageframe = Instance.new("ScrollingFrame")


        ScrollingFrame_Pageframe.Parent = Pageframe
        ScrollingFrame_Pageframe.Active = true
        ScrollingFrame_Pageframe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        ScrollingFrame_Pageframe.BorderSizePixel = 0
        ScrollingFrame_Pageframe.Position = UDim2.new(0, 0, -0.0101253344, 0)
        ScrollingFrame_Pageframe.Size = UDim2.new(0, 240, 0, 379)
        ScrollingFrame_Pageframe.ScrollBarThickness = 4
        ScrollingFrame_Pageframe.ScrollBarImageColor3 = Color3.fromRGB(222, 222, 222)



        local UIPadding_Pageframe = Instance.new("UIPadding")
        local UIListLayout_Pageframe = Instance.new("UIListLayout")


        UIPadding_Pageframe.Parent = ScrollingFrame_Pageframe
        UIPadding_Pageframe.PaddingLeft = UDim.new(0, 15)
        UIPadding_Pageframe.PaddingTop = UDim.new(0, 10)


        UIListLayout_Pageframe.Parent = ScrollingFrame_Pageframe
        UIListLayout_Pageframe.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_Pageframe.Padding = UDim.new(0, 7)

        UIListLayout_Pageframe:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
            ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,UIListLayout_Pageframe.AbsoluteContentSize.Y + 120 )
        end)

        UIGridLayout_Pagefrist:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
            ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0,0,0,UIGridLayout_Pagefrist.AbsoluteContentSize.Y + 50 )
        end)

        game:GetService("RunService").Stepped:Connect(function ()
            pcall(function ()
                ScrollingFrame_Menubar.CanvasSize = UDim2.new(0,  UIListLayout_Menubar.AbsoluteContentSize.X, 0,0)
                ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,UIListLayout_Pageframe.AbsoluteContentSize.Y +20 )
                ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0,0,0,UIGridLayout_Pagefrist.AbsoluteContentSize.Y + 40)
            end)
        end)
    local items = {}

    function items:Toggle(text,config,callback)
        local Toggle = Instance.new("Frame")

        Toggle.Parent = ScrollingFrame_Pageframe
        Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Toggle.BorderSizePixel = 0
        Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
        Toggle.Size = UDim2.new(0, 213, 0, 35)
        Toggle.BackgroundTransparency = 1
        Toggle.AnchorPoint = Vector2.new(0.5, 0.5)

        local TextButton_Toggle = Instance.new("TextButton")

        TextButton_Toggle.Parent = Toggle
        TextButton_Toggle.BackgroundTransparency =1
        TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TextButton_Toggle.BorderSizePixel = 0
        TextButton_Toggle.Size = UDim2.new(0, 213, 0, 35)
        TextButton_Toggle.AutoButtonColor = false
        TextButton_Toggle.Font = Enum.Font.SourceSans
        TextButton_Toggle.Text = " "
        TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_Toggle.TextSize = 12.000

        local TextButton_2_Toggle = Instance.new("TextButton")

        TextButton_2_Toggle.Parent = TextButton_Toggle
        TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--        TextButton_2_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
        TextButton_2_Toggle.BorderSizePixel = 0
        TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_2_Toggle.Position = UDim2.new(0.9, 0, 0.5, 0)
        TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
        TextButton_2_Toggle.Font = Enum.Font.SourceSans
        TextButton_2_Toggle.Text = " "
        TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_2_Toggle.TextSize = 12.000
        TextButton_2_Toggle.AutoButtonColor = false

        local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner.Name = ""
        TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

        local TextButton_3_Toggle = Instance.new("TextButton")

        TextButton_3_Toggle.Parent = TextButton_2_Toggle
        TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
        TextButton_3_Toggle.BorderSizePixel = 0
        TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
        TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
        TextButton_3_Toggle.Font = Enum.Font.SourceSans
        TextButton_3_Toggle.Text = " "
        TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_3_Toggle.TextSize = 12.000
        TextButton_3_Toggle.AutoButtonColor = false

        local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner2.Name = ""
        TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

        local TextButton_4_Toggle = Instance.new("TextButton")

        TextButton_4_Toggle.Parent = TextButton_3_Toggle
        TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
        TextButton_4_Toggle.BorderSizePixel = 0
        TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
        TextButton_4_Toggle.Font = Enum.Font.SourceSans
        TextButton_4_Toggle.Text = " "
        TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_4_Toggle.TextSize = 12.000
        TextButton_4_Toggle.AutoButtonColor = false
        TextButton_4_Toggle.BackgroundTransparency = 1
        TextButton_4_Toggle.Visible = true

        local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner4.Name = ""
        TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle

        local TextLabel_Toggle = Instance.new("TextLabel")

        TextLabel_Toggle.Parent = Toggle
        TextLabel_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_Toggle.BackgroundTransparency = 1
        TextLabel_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel_Toggle.Position = UDim2.new(0.4, 0, 0.5, 0)
        TextLabel_Toggle.BorderSizePixel = 0
        TextLabel_Toggle.Size = UDim2.new(0, 130, 0, 25)
        TextLabel_Toggle.Font = Enum.Font.GothamSemibold
        TextLabel_Toggle.Text = text
        TextLabel_Toggle.TextColor3 = Color3.fromRGB(200, 200, 200)
        TextLabel_Toggle.TextSize = 13.000
        TextLabel_Toggle.ClipsDescendants = true
        TextLabel_Toggle.TextWrapped = true
        TextLabel_Toggle.TextXAlignment = Enum.TextXAlignment.Left

        local TextButton_Toggle2 = Instance.new("TextButton")

        TextButton_Toggle2.Parent = TextButton_Toggle
        TextButton_Toggle2.BackgroundTransparency =1
        TextButton_Toggle2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TextButton_Toggle2.BorderSizePixel = 0
        TextButton_Toggle2.Size = UDim2.new(0, 213, 0, 35)
        TextButton_Toggle2.AutoButtonColor = false
        TextButton_Toggle2.Font = Enum.Font.SourceSans
        TextButton_Toggle2.Text = " "
        TextButton_Toggle2.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_Toggle2.TextSize = 12.000

        TextButton_Toggle2.MouseEnter:Connect(function()
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextLabel_Toggle,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    TextButton_Toggle2.MouseLeave:Connect(function()
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextLabel_Toggle,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(200, 200, 200)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    local check = {toogle = false ; loacker = true ; togfunction = {

    };
}
TextButton_Toggle2.MouseButton1Click:Connect(function()
        if check.toogle == false and check.loacker == true  then
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_3_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_2_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
        elseif  check.loacker ==  true then
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_3_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_2_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
        end
        if  check.loacker == true  then
        check.toogle = not check.toogle
        callback(check.toogle)
        end
    end
)

    if config == true then
        TweenService:Create(
            TextButton_4_Toggle,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextButton_3_Toggle,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextButton_2_Toggle,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
        check.toogle = true
        callback(check.toogle)
    end

    local lockerframe = Instance.new("Frame")

    lockerframe.Name = "lockerframe"
    lockerframe.Parent = Toggle
    lockerframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    lockerframe.BackgroundTransparency = 1
    lockerframe.Size = UDim2.new(0, 320, 0, 35)
    lockerframe.Position = UDim2.new(0.5, 0, 0.5, 0)
    lockerframe.AnchorPoint = Vector2.new(0.5, 0.5)

    local LockerImageLabel = Instance.new("ImageLabel")
    LockerImageLabel.Parent = lockerframe
    LockerImageLabel.BackgroundTransparency = 1.000
    LockerImageLabel.BorderSizePixel = 0
    LockerImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    LockerImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    LockerImageLabel.Size = UDim2.new(0, 0, 0, 0)
    LockerImageLabel.Image = "http://www.roblox.com/asset/?id=6031082533"


    function check.togfunction:lock()
        TweenService:Create(
            lockerframe,
            TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
            {BackgroundTransparency = 0.7}
        ):Play()
        TweenService:Create(
            LockerImageLabel,
            TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
            {Size = UDim2.new(0, 30, 0, 30)}
        ):Play()

        check.loacker  = false
    --    pcall(callback,locker)
    end
    function check.togfunction:unlock()
        TweenService:Create(
            lockerframe,
            TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
            {BackgroundTransparency = 1}
        ):Play()
        TweenService:Create(
            LockerImageLabel,
            TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
            {Size = UDim2.new(0, 0, 0, 0)}
        ):Play()
        check.loacker  = true
    --   pcall(callback,locker)
    end

        return  check.togfunction
    end

    function items:Button(text,callback)

        local ButtonFrame = Instance.new("Frame")

        ButtonFrame.Name = "ButtonFrame"
        ButtonFrame.Parent = ScrollingFrame_Pageframe
        ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ButtonFrame.BorderSizePixel = 0
        ButtonFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        ButtonFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        ButtonFrame.Size = UDim2.new(0, 213, 0, 25) -- UDim2.new(0, 213, 0, 35)
        ButtonFrame.BackgroundTransparency  = 1
        ButtonFrame.ClipsDescendants = true



        local MheeFrameStroke = Instance.new("UIStroke")

        MheeFrameStroke.Thickness = 0
        MheeFrameStroke.Name = ""
        MheeFrameStroke.Parent = ButtonFrame
        MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
        MheeFrameStroke.Color = Color3.fromRGB(255, 255, 255)
        MheeFrameStroke.Transparency = 0.7

        local Button = Instance.new("TextButton")

        Button.Parent = ButtonFrame
        Button.Name = "Button"
        Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button.Size = UDim2.new(0,150, 0, 25)
        Button.Font = Enum.Font.SourceSansSemibold
        Button.Text = tostring(text)
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 13.000
        Button.AnchorPoint = Vector2.new(0.5, 0.5)
        Button.Position = UDim2.new(0.5, 0, 0.5, 0)
        Button.TextXAlignment = Enum.TextXAlignment.Center
        Button.BackgroundTransparency = 0.6
        Button.TextWrapped = true
        Button.AutoButtonColor = false
        Button.ClipsDescendants = true

        local ConnerPageMhee = Instance.new("UICorner")

        ConnerPageMhee.CornerRadius = UDim.new(0, 4)
        ConnerPageMhee.Name = ""
        ConnerPageMhee.Parent = Button

        Button.MouseEnter:Connect(function()
            TweenService:Create(
                Button,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size =  UDim2.new(0, 213, 0, 25)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                Button,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 0} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                Button,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )
        Button.MouseLeave:Connect(function()
            TweenService:Create(
                Button,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size =  UDim2.new(0, 150, 0, 25)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                Button,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                Button,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    Button.MouseButton1Click:Connect(function()
    --    Ripple(Button)
        callback()
        TweenService:Create(
            Button,
            TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            {TextSize =  16} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        wait(0.1)
        TweenService:Create(
            Button,
            TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            {TextSize =  13} -- UDim2.new(0, 128, 0, 25)
        ):Play()
    end
)

    end

    function items:Slider(text,check,floor,min,max,de,lol,tog,callback)

    if check then

        local SliderFrame = Instance.new("Frame")

        SliderFrame.Name = "SliderFrame"
        SliderFrame.Parent = ScrollingFrame_Pageframe
        SliderFrame.BackgroundColor3 =  Color3.fromRGB(28, 28, 28)-- Color3.fromRGB(249, 53, 139)
        SliderFrame.BorderSizePixel = 0
        SliderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        SliderFrame.Size = UDim2.new(0, 213, 0, 75) -- UDim2.new(0, 213, 0, 35)
        SliderFrame.BackgroundTransparency  = 0
        SliderFrame.ClipsDescendants = true

        local SliderFrameConner = Instance.new("UICorner")

        SliderFrameConner.CornerRadius = UDim.new(0, 4)
        SliderFrameConner.Name = ""
        SliderFrameConner.Parent = SliderFrame

        local SliderFrameStroke = Instance.new("UIStroke")

        SliderFrameStroke.Thickness = 1
        SliderFrameStroke.Name = ""
        SliderFrameStroke.Parent = SliderFrame
        SliderFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
        SliderFrameStroke.Color = Color3.fromRGB(255, 255, 255)
        SliderFrameStroke.Transparency = 0.7


        SliderFrame.MouseEnter:Connect(function()
            TweenService:Create(
                SliderFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

        SliderFrame.MouseLeave:Connect(function()
            TweenService:Create(
                SliderFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )


        local LabelNameSliderxd = Instance.new("TextLabel")

        LabelNameSliderxd.Parent = SliderFrame
        LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelNameSliderxd.BackgroundTransparency = 1
        LabelNameSliderxd.BorderSizePixel = 0
        LabelNameSliderxd.Position = UDim2.new(0.35, 0, 0.2, 0)
        LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelNameSliderxd.Size = UDim2.new(0, 120, 0, 20)
        LabelNameSliderxd.Font = Enum.Font.GothamBold
        LabelNameSliderxd.Text = tostring(text)
        LabelNameSliderxd.TextColor3 = Color3.fromRGB(255, 255, 255)
        LabelNameSliderxd.TextSize = 11.000
        LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Left


        local ShowValueFarm = Instance.new("Frame")

        ShowValueFarm.Name = "ShowValueFarm"
        ShowValueFarm.Parent = SliderFrame
        ShowValueFarm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        ShowValueFarm.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
        ShowValueFarm.Size = UDim2.new(0, 75, 0, 15)
        ShowValueFarm.BackgroundTransparency = 0
        ShowValueFarm.BorderSizePixel = 0
        ShowValueFarm.AnchorPoint = Vector2.new(0.5, 0.5)
        ShowValueFarm.Position = UDim2.new(0.8, 0, 0.2, 0)
        ShowValueFarm.ClipsDescendants = false

        local CustomValue = Instance.new("TextBox")

        CustomValue.Parent = ShowValueFarm
        CustomValue.BackgroundColor3 = Color3.fromRGB(45,45, 45)
        CustomValue.BorderSizePixel = 0
        CustomValue.ClipsDescendants = true
        CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
        CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
        CustomValue.Size = UDim2.new(0, 158, 0, 26)
        CustomValue.Font = Enum.Font.GothamSemibold
        CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
        CustomValue.PlaceholderText =  ""
        if floor == true then
            CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
        else
            CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
        end
        CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
        CustomValue.TextSize = 8.000
        CustomValue.BackgroundTransparency = 1

        local ValueFrame = Instance.new("Frame")

        ValueFrame.Name = "ValueFrame"
        ValueFrame.Parent = SliderFrame
        ValueFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        ValueFrame.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
        ValueFrame.Size = UDim2.new(0, 140, 0, 5)
        ValueFrame.BackgroundTransparency = 0
        ValueFrame.BorderSizePixel = 0
        ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        ValueFrame.Position = UDim2.new(0.4, 0, 0.8, 0)
        ValueFrame.ClipsDescendants = false


        local PartValue = Instance.new("Frame")

        PartValue.Name = "PartValue"
        PartValue.Parent = ValueFrame
        PartValue.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
        PartValue.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
        PartValue.Size = UDim2.new(0, 140, 0, 5)
        PartValue.BackgroundTransparency = 1
        PartValue.BorderSizePixel = 0
        PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
        PartValue.Position = UDim2.new(0.5, 0, 0.5, 0)
        PartValue.ClipsDescendants = false

        local MainValue = Instance.new("Frame")

        MainValue.Name = "MainValue"
        MainValue.Parent = PartValue
        MainValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)
        MainValue.BackgroundTransparency = 0
        MainValue.BorderSizePixel = 0
        -- MainValue.AnchorPoint = Vector2.new(0.5, 0.5)
        MainValue.Position = UDim2.new(0., 0, 0.0, 0)
        MainValue.ClipsDescendants = false

        local Conner_S1 = Instance.new("UICorner")

        Conner_S1.CornerRadius = UDim.new(0, 8)
        Conner_S1.Name = ""
        Conner_S1.Parent = MainValue

        local Conner_S2 = Instance.new("UICorner")

        Conner_S2.CornerRadius = UDim.new(0, 8)
        Conner_S2.Name = ""
        Conner_S2.Parent = ValueFrame

        local ConneValue = Instance.new("Frame")

        ConneValue.Name = "ConneValue"
        ConneValue.Parent = PartValue
        ConneValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ConneValue.Size = UDim2.new(0, 13, 0,13)
        ConneValue.BackgroundTransparency = 0
        ConneValue.BorderSizePixel = 0
        ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
        ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.3,0.5, 0)
        ConneValue.ClipsDescendants = false


        local Conner_Conne = Instance.new("UICorner")

        Conner_Conne.CornerRadius = UDim.new(0, 300)
        Conner_Conne.Name = ""
        Conner_Conne.Parent = ConneValue

        local Addvalue = Instance.new("ImageButton")

        Addvalue.Name = "Imatog"
        Addvalue.Parent = SliderFrame
        Addvalue.BackgroundTransparency = 1.000
        Addvalue.BorderSizePixel = 0
        Addvalue.Position = UDim2.new(0.85, 0, 0.35, 0)
        Addvalue.Size = UDim2.new(0, 15, 0, 15)
        Addvalue.Image = "http://www.roblox.com/asset/?id=6035067836"
        Addvalue.ImageColor3 =  Color3.fromRGB(255, 255, 255)

        local Deletevalue = Instance.new("ImageButton")

        Deletevalue.Name = "Imatog"
        Deletevalue.Parent = SliderFrame
        Deletevalue.BackgroundTransparency = 1.000
        Deletevalue.BorderSizePixel = 0
        Deletevalue.Position = UDim2.new(0.7, 0, 0.35, 0)
        Deletevalue.Size = UDim2.new(0, 15, 0, 15)
        Deletevalue.Image = "http://www.roblox.com/asset/?id=6035047377"
        Deletevalue.ImageColor3 =  Color3.fromRGB(255, 255, 255)


        local TextButton_2_Toggle = Instance.new("TextButton")

        TextButton_2_Toggle.Parent = ValueFrame
        TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
--        TextButton_2_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
        TextButton_2_Toggle.BorderSizePixel = 0
        TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_2_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)
        TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
        TextButton_2_Toggle.Font = Enum.Font.SourceSans
        TextButton_2_Toggle.Text = " "
        TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_2_Toggle.TextSize = 12.000
        TextButton_2_Toggle.AutoButtonColor = false

        local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner.Name = ""
        TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

        local TextButton_3_Toggle = Instance.new("TextButton")

        TextButton_3_Toggle.Parent = TextButton_2_Toggle
        TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
        TextButton_3_Toggle.BorderSizePixel = 0
        TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
        TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
        TextButton_3_Toggle.Font = Enum.Font.SourceSans
        TextButton_3_Toggle.Text = " "
        TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_3_Toggle.TextSize = 12.000
        TextButton_3_Toggle.AutoButtonColor = false

        local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner2.Name = ""
        TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

        local TextButton_4_Toggle = Instance.new("TextButton")

        TextButton_4_Toggle.Parent = TextButton_3_Toggle
        TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155,155)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
        TextButton_4_Toggle.BorderSizePixel = 0
        TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
        TextButton_4_Toggle.Font = Enum.Font.SourceSans
        TextButton_4_Toggle.Text = " "
        TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_4_Toggle.TextSize = 12.000
        TextButton_4_Toggle.AutoButtonColor = false
        TextButton_4_Toggle.BackgroundTransparency = 1
        TextButton_4_Toggle.Visible = true

        local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner4.Name = ""
        TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle


        local TextButton_Toggle = Instance.new("TextButton")

        TextButton_Toggle.Parent = ValueFrame
        TextButton_Toggle.BackgroundTransparency =1
        TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_Toggle.BorderSizePixel = 0
        TextButton_Toggle.Size = UDim2.new(0, 50, 0, 20)
        TextButton_Toggle.AutoButtonColor = false
        TextButton_Toggle.Font = Enum.Font.SourceSans
        TextButton_Toggle.Text = " "
        TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_Toggle.TextSize = 12.000
        TextButton_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)



    -- local value = de
    local check2 = {toogle2 = false;}
        local function move(input)
            local pos =
                UDim2.new(
                    math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                    0,
                    0.3,
                    0
                )
            local pos1 =
                UDim2.new(
                    math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                    0,
                    0,
                    5
                )

                MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)

                ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
                if floor == true then
                    local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
                    CustomValue.Text = tostring(value)
                --   callback[2] = value
                callback({
                    ["s"] = value;
                    ["t"] = check2.toogle2
                })
                --callback({value,check2.toogle2})
                    --callback(value)
                else
                    local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                    CustomValue.Text = tostring(value)
                    callback({
                        ["s"] = value;
                        ["t"] = check2.toogle2
                    })
            --       callback({value,check2.toogle2})

                end



            end

            local dragging = false
            ConneValue.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true

                    end
                end
            )
            ConneValue.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false

                    end
                end
            )
            SliderFrame.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true

                    end
                end
            )
            SliderFrame.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false

                    end
                end
            )


            ValueFrame.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true

                    end
                end
            )
            ValueFrame.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false

                    end
                end
            )

            game:GetService("UserInputService").InputChanged:Connect(
                function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        move(input)
                    end
                end
                )

                CustomValue.FocusLost:Connect(function()
                    if CustomValue.Text == "" then
                        CustomValue.Text  = de
                    end
                    if  tonumber(CustomValue.Text) > max then
                        CustomValue.Text  = max
                    end
                    if  tonumber(CustomValue.Text) <= min then
                        CustomValue.Text  = min
                    end
                    MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0, 0) , "Out", "Sine", 0.2, true)
                    if floor == true then
                        CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                    else
                        CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                    end
                    callback({
                        ["s"] =  CustomValue.Text;
                        ["t"] = check2.toogle2;
                    })
            --       callback({ tonumber(CustomValue.Text),check2.toogle2})
            --  pcall(callback, CustomValue.Text)
                end)


                Addvalue.MouseButton1Click:Connect(function ()
                    if CustomValue.Text == "" then
                        CustomValue.Text  = de
                    end
                    pcall(function()
                        CustomValue.Text  = CustomValue.Text  - tonumber(lol)
                    end)
                    if  tonumber(CustomValue.Text) > max then
                        CustomValue.Text  = max
                    end
                    if  tonumber(CustomValue.Text) < min then
                        CustomValue.Text  = min
                    end
                    MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                    if floor == true then
                        CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                    else
                        CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                    end
                    callback({
                        ["s"] =  CustomValue.Text;
                        ["t"] = check2.toogle2
                    })
                --   callback({ tonumber(CustomValue.Text),check2.toogle2})
                --  pcall(callback, CustomValue.Text)
                end)

                Deletevalue.MouseButton1Click:Connect(function ()
                    if CustomValue.Text == "" then
                        CustomValue.Text  = de
                    end
                    pcall(function()
                        CustomValue.Text  = CustomValue.Text  + tonumber(lol)
                    end)
                    if  tonumber(CustomValue.Text) > max then
                        CustomValue.Text  = max
                    end
                    if  tonumber(CustomValue.Text) < min then
                        CustomValue.Text  = min
                    end
                    MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                    if floor == true then
                        CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                    else
                        CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                    end
                    callback({
                        ["s"] =  CustomValue.Text;
                        ["t"] = check2.toogle2;
                    })
        --callback({ tonumber(CustomValue.Text),check2.toogle2})
                --  pcall(callback, CustomValue.Text)
                end)




        ---
                TextButton_Toggle.MouseEnter:Connect(function()
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )

            TextButton_Toggle.MouseLeave:Connect(function()
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end
            )



        TextButton_Toggle.MouseButton1Click:Connect(function()
            if check2.toogle2 == false   then
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            else
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            end
                check2.toogle2 = not check2.toogle2
                callback({
                    ["t"] = check2.toogle2;

                })
            --   callback({value,check2.toogle2})
                --callback(check2.toogle2)
        end
    )

        if tog == true then
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_3_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_2_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            check2.toogle2 = true
            callback({
                ["t"] = check2.toogle2;
            })
    --        callback({value,check2.toogle2})
        --  callback(check2.toogle2)
        end


    else
        tog = nil
        local SliderFrame = Instance.new("Frame")

        SliderFrame.Name = "SliderFrame"
        SliderFrame.Parent = ScrollingFrame_Pageframe
        SliderFrame.BackgroundColor3 =  Color3.fromRGB(28, 28, 28)-- Color3.fromRGB(249, 53, 139)
        SliderFrame.BorderSizePixel = 0
        SliderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        SliderFrame.Size = UDim2.new(0, 213, 0, 75) -- UDim2.new(0, 213, 0, 35)
        SliderFrame.BackgroundTransparency  = 0
        SliderFrame.ClipsDescendants = true

        local SliderFrameConner = Instance.new("UICorner")

        SliderFrameConner.CornerRadius = UDim.new(0, 4)
        SliderFrameConner.Name = ""
        SliderFrameConner.Parent = SliderFrame

        local SliderFrameStroke = Instance.new("UIStroke")

        SliderFrameStroke.Thickness = 1
        SliderFrameStroke.Name = ""
        SliderFrameStroke.Parent = SliderFrame
        SliderFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
        SliderFrameStroke.Color = Color3.fromRGB(255, 255, 255)
        SliderFrameStroke.Transparency = 0.7



        SliderFrame.MouseEnter:Connect(function()
            TweenService:Create(
                SliderFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

        SliderFrame.MouseLeave:Connect(function()
            TweenService:Create(
                SliderFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

        local LabelNameSliderxd = Instance.new("TextLabel")

        LabelNameSliderxd.Parent = SliderFrame
        LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelNameSliderxd.BackgroundTransparency = 1
        LabelNameSliderxd.BorderSizePixel = 0
        LabelNameSliderxd.Position = UDim2.new(0.35, 0, 0.2, 0)
        LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelNameSliderxd.Size = UDim2.new(0, 120, 0, 20)
        LabelNameSliderxd.Font = Enum.Font.GothamBold
        LabelNameSliderxd.Text = tostring(text)
        LabelNameSliderxd.TextColor3 = Color3.fromRGB(255, 255, 255)
        LabelNameSliderxd.TextSize = 11.000
        LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Left


        local ShowValueFarm = Instance.new("Frame")

        ShowValueFarm.Name = "ShowValueFarm"
        ShowValueFarm.Parent = SliderFrame
        ShowValueFarm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        ShowValueFarm.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
        ShowValueFarm.Size = UDim2.new(0, 75, 0, 15)
        ShowValueFarm.BackgroundTransparency = 0
        ShowValueFarm.BorderSizePixel = 0
        ShowValueFarm.AnchorPoint = Vector2.new(0.5, 0.5)
        ShowValueFarm.Position = UDim2.new(0.8, 0, 0.2, 0)
        ShowValueFarm.ClipsDescendants = false

        local CustomValue = Instance.new("TextBox")

        CustomValue.Parent = ShowValueFarm
        CustomValue.BackgroundColor3 = Color3.fromRGB(45,45, 45)
        CustomValue.BorderSizePixel = 0
        CustomValue.ClipsDescendants = true
        CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
        CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
        CustomValue.Size = UDim2.new(0, 158, 0, 26)
        CustomValue.Font = Enum.Font.GothamSemibold
        CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
        CustomValue.PlaceholderText =  ""
        if floor == true then
            CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
        else
            CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
        end
        CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
        CustomValue.TextSize = 8.000
        CustomValue.BackgroundTransparency = 1

        local ValueFrame = Instance.new("Frame")

        ValueFrame.Name = "ValueFrame"
        ValueFrame.Parent = SliderFrame
        ValueFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        ValueFrame.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
        ValueFrame.Size = UDim2.new(0, 190, 0, 5)
        ValueFrame.BackgroundTransparency = 0
        ValueFrame.BorderSizePixel = 0
        ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        ValueFrame.Position = UDim2.new(0.5, 0, 0.8, 0)
        ValueFrame.ClipsDescendants = false


        local PartValue = Instance.new("Frame")

        PartValue.Name = "PartValue"
        PartValue.Parent = ValueFrame
        PartValue.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
        PartValue.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
        PartValue.Size = UDim2.new(0, 190, 0, 5)
        PartValue.BackgroundTransparency = 1
        PartValue.BorderSizePixel = 0
        PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
        PartValue.Position = UDim2.new(0.5, 0, 0.5, 0)
        PartValue.ClipsDescendants = false

        local MainValue = Instance.new("Frame")

        MainValue.Name = "MainValue"
        MainValue.Parent = PartValue
        MainValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)
        MainValue.BackgroundTransparency = 0
        MainValue.BorderSizePixel = 0
        -- MainValue.AnchorPoint = Vector2.new(0.5, 0.5)
        MainValue.Position = UDim2.new(0., 0, 0.0, 0)
        MainValue.ClipsDescendants = false

        local Conner_S1 = Instance.new("UICorner")

        Conner_S1.CornerRadius = UDim.new(0, 8)
        Conner_S1.Name = ""
        Conner_S1.Parent = MainValue

        local Conner_S2 = Instance.new("UICorner")

        Conner_S2.CornerRadius = UDim.new(0, 8)
        Conner_S2.Name = ""
        Conner_S2.Parent = ValueFrame

        local ConneValue = Instance.new("Frame")

        ConneValue.Name = "ConneValue"
        ConneValue.Parent = PartValue
        ConneValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ConneValue.Size = UDim2.new(0, 13, 0,13)
        ConneValue.BackgroundTransparency = 0
        ConneValue.BorderSizePixel = 0
        ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
        ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.3,0.5, 0)
        ConneValue.ClipsDescendants = false


        local Conner_Conne = Instance.new("UICorner")

        Conner_Conne.CornerRadius = UDim.new(0, 300)
        Conner_Conne.Name = ""
        Conner_Conne.Parent = ConneValue

        local Addvalue = Instance.new("ImageButton")

        Addvalue.Name = "Imatog"
        Addvalue.Parent = SliderFrame
        Addvalue.BackgroundTransparency = 1.000
        Addvalue.BorderSizePixel = 0
        Addvalue.Position = UDim2.new(0.85, 0, 0.35, 0)
        Addvalue.Size = UDim2.new(0, 15, 0, 15)
        Addvalue.Image = "http://www.roblox.com/asset/?id=6035067836"
        Addvalue.ImageColor3 =  Color3.fromRGB(255, 255, 255)

        local Deletevalue = Instance.new("ImageButton")

        Deletevalue.Name = "Imatog"
        Deletevalue.Parent = SliderFrame
        Deletevalue.BackgroundTransparency = 1.000
        Deletevalue.BorderSizePixel = 0
        Deletevalue.Position = UDim2.new(0.7, 0, 0.35, 0)
        Deletevalue.Size = UDim2.new(0, 15, 0, 15)
        Deletevalue.Image = "http://www.roblox.com/asset/?id=6035047377"
        Deletevalue.ImageColor3 =  Color3.fromRGB(255, 255, 255)

        local function move(input)
            local pos =
                UDim2.new(
                    math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                    0,
                    0.3,
                    0
                )
            local pos1 =
                UDim2.new(
                    math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                    0,
                    0,
                    5
                )

                MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)

                ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
                if floor == true then
                    local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
                    CustomValue.Text = tostring(value)
                    callback(value)
                else
                    local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                    CustomValue.Text = tostring(value)
                    callback(value)
                end



            end

            local dragging = false
            ConneValue.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true

                    end
                end
            )
            ConneValue.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false

                    end
                end
            )
            SliderFrame.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true

                    end
                end
            )
            SliderFrame.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false

                    end
                end
            )


            ValueFrame.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true

                    end
                end
            )
            ValueFrame.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false

                    end
                end
            )

            game:GetService("UserInputService").InputChanged:Connect(
                function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        move(input)
                    end
                end
                )

                CustomValue.FocusLost:Connect(function()
                    if CustomValue.Text == "" then
                        CustomValue.Text  = de
                    end
                    if  tonumber(CustomValue.Text) > max then
                        CustomValue.Text  = max
                    end
                    MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0, 0) , "Out", "Sine", 0.2, true)
                    if floor == true then
                        CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                    else
                        CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                    end
                    pcall(callback, CustomValue.Text)
                end)


        Addvalue.MouseButton1Click:Connect(function ()
            if CustomValue.Text == "" then
                CustomValue.Text  = de
            end
            CustomValue.Text  = CustomValue.Text  - tonumber(lol)
            if  tonumber(CustomValue.Text) > max then
                CustomValue.Text  = max
            end
            if  tonumber(CustomValue.Text) < min then
                CustomValue.Text  = min
            end
            MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
            ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
            if floor == true then
                CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
            else
                CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
            end
            pcall(callback, CustomValue.Text)
        end)

        Deletevalue.MouseButton1Click:Connect(function ()
            if CustomValue.Text == "" then
                CustomValue.Text  = de
            end
            CustomValue.Text  = CustomValue.Text  + tonumber(lol)
            if  tonumber(CustomValue.Text) > max then
                CustomValue.Text  = max
            end
            if  tonumber(CustomValue.Text) < min then
                CustomValue.Text  = min
            end
            MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
            ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
            if floor == true then
                CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
            else
                CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
            end
            pcall(callback, CustomValue.Text)
        end)

    end

    end

    function items:Drop(text,use,option,callback)

    if use == false then
        local DropFrame = Instance.new("Frame")

        DropFrame.Name = "DropFrame"
        DropFrame.Parent = ScrollingFrame_Pageframe
        DropFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)-- Color3.fromRGB(249, 53, 139)
        DropFrame.BorderSizePixel = 0
        DropFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        DropFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        DropFrame.Size = UDim2.new(0, 213, 0, 30) -- UDim2.new(0, 213, 0, 35)
        DropFrame.BackgroundTransparency  = 0
        DropFrame.ClipsDescendants = true

        local ConnerDropFrame = Instance.new("UICorner")

        ConnerDropFrame.CornerRadius = UDim.new(0, 4)
        ConnerDropFrame.Name = ""
        ConnerDropFrame.Parent = DropFrame

        local DropFrameStroke = Instance.new("UIStroke")

        DropFrameStroke.Thickness = 1
        DropFrameStroke.Name = ""
        DropFrameStroke.Parent = DropFrame
        DropFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
        DropFrameStroke.Color = Color3.fromRGB(255, 255, 255)
        DropFrameStroke.Transparency = 0.7





        local LabelFrameDrop = Instance.new("TextLabel")

        LabelFrameDrop.Parent = DropFrame
        LabelFrameDrop.Name = "LabelFrameDrop"
        LabelFrameDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelFrameDrop.Position = UDim2.new(0., 0, 0., 0)
        LabelFrameDrop.Size =    UDim2.new(0, 213, 0, 30)
        LabelFrameDrop.Font = Enum.Font.SourceSansSemibold
        LabelFrameDrop.Text = ""
        LabelFrameDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
        LabelFrameDrop.TextSize = 14.000
    --   LabelFrameDrop.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelFrameDrop.BackgroundTransparency = 1
        LabelFrameDrop.TextXAlignment = Enum.TextXAlignment.Left


        local TextLabel_TapDrop = Instance.new("TextLabel")

        TextLabel_TapDrop.Parent = LabelFrameDrop
        TextLabel_TapDrop.Name = "TextLabel_TapDrop"
        TextLabel_TapDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_TapDrop.Position = UDim2.new(0.04, 0, 0.14, 0)
        TextLabel_TapDrop.Size =    UDim2.new(0, 140, 0, 20)
        TextLabel_TapDrop.Font = Enum.Font.SourceSansSemibold
        TextLabel_TapDrop.Text = tostring(text).." :"
        TextLabel_TapDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
        TextLabel_TapDrop.TextSize = 14.000
--     TextLabel_TapDrop.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel_TapDrop.BackgroundTransparency = 1
        TextLabel_TapDrop.TextXAlignment = Enum.TextXAlignment.Left


        local DropArbt_listimage = Instance.new("ImageButton")

        DropArbt_listimage.Parent = LabelFrameDrop
        DropArbt_listimage.BackgroundTransparency = 1.000
        DropArbt_listimage.AnchorPoint = Vector2.new(0.5, 0.5)
        DropArbt_listimage.Position = UDim2.new(0.9, 0, 0.5, 0)
        DropArbt_listimage.BorderSizePixel = 0
        DropArbt_listimage.Size = UDim2.new(0, 25, 0, 25)
        DropArbt_listimage.Image = "http://www.roblox.com/asset/?id=6031091004"
        DropArbt_listimage.ImageColor3 = Color3.fromRGB(155, 155, 155)

        local ScolDown = Instance.new("ScrollingFrame")

        ScolDown.Name = "ScolDown"
        ScolDown.Position = UDim2.new(0.02, 0, 1., 0)
        ScolDown.Parent = LabelFrameDrop
        ScolDown.Active = true
        ScolDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScolDown.BorderSizePixel = 0
        ScolDown.Size = UDim2.new(0, 205, 0, 115)
        ScolDown.ScrollBarThickness = 3
        ScolDown.ClipsDescendants = true
        ScolDown.BackgroundTransparency = 1
        ScolDown.CanvasSize = UDim2.new(0, 0, 0, 2)

        local UIListLayoutlist = Instance.new("UIListLayout")
        local UIPaddinglist = Instance.new("UIPadding")

        UIListLayoutlist.Name = "UIListLayoutlist"
        UIListLayoutlist.Parent = ScolDown
        UIListLayoutlist.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayoutlist.Padding = UDim.new(0, 5)

        UIPaddinglist.Name = "UIPaddinglist"
        UIPaddinglist.Parent = ScolDown
        UIPaddinglist.PaddingTop = UDim.new(0, 5)
        UIPaddinglist.PaddingLeft = UDim.new(0, 12)

        local ButtonDrop = Instance.new("TextButton")

        ButtonDrop.Parent = DropFrame
        ButtonDrop.Name = "ButtonDrop"
        ButtonDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ButtonDrop.Size = UDim2.new(0, 213, 0, 30)
        ButtonDrop.Font = Enum.Font.SourceSansSemibold
        ButtonDrop.Text = ""
        ButtonDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
        ButtonDrop.TextSize = 13.000
    --   ButtonDrop.AnchorPoint = Vector2.new(0.5, 0.5)
        ButtonDrop.Position = UDim2.new(0., 0, 0., 0)
        ButtonDrop.TextXAlignment = Enum.TextXAlignment.Center
        ButtonDrop.BackgroundTransparency = 1
        ButtonDrop.TextWrapped = true
        ButtonDrop.AutoButtonColor = false
        ButtonDrop.ClipsDescendants = true

        local dog = false

        local FrameSize = 75
        local cout = 0
        for i , v in pairs(option) do
            cout =cout + 1
            if cout == 1 then
                FrameSize = 75
            elseif cout == 2 then
                FrameSize = 110
            elseif cout >= 3 then
                FrameSize = 150
            end

            local ListFrame = Instance.new("Frame")

            ListFrame.Name = "ListFrame"
            ListFrame.Parent = ScolDown
            ListFrame.BackgroundColor3 =  Color3.fromRGB(255, 23, 23)-- Color3.fromRGB(249, 53, 139)
            ListFrame.BorderSizePixel = 0
            ListFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            ListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            ListFrame.Size = UDim2.new(0, 180, 0, 30) -- UDim2.new(0, 213, 0, 35)
            ListFrame.BackgroundTransparency  = 1
            ListFrame.ClipsDescendants = true

            local TextLabel_TapDro2p = Instance.new("TextLabel")

            TextLabel_TapDro2p.Parent = ListFrame
            TextLabel_TapDro2p.Name =  tostring(v).."Dropdown"
            TextLabel_TapDro2p.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_TapDro2p.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextLabel_TapDro2p.Size =  UDim2.new(0, 180, 0, 30)
            TextLabel_TapDro2p.Font = Enum.Font.SourceSansSemibold
            TextLabel_TapDro2p.Text = tostring(v)
            TextLabel_TapDro2p.TextColor3 = Color3.fromRGB(155, 155, 155)
            TextLabel_TapDro2p.TextSize = 14.000
            TextLabel_TapDro2p.AnchorPoint = Vector2.new(0.5, 0.5)
            TextLabel_TapDro2p.BackgroundTransparency = 1
            TextLabel_TapDro2p.TextXAlignment = Enum.TextXAlignment.Center

            local ButtonDrop2 = Instance.new("TextButton")

            ButtonDrop2.Parent = ListFrame
            ButtonDrop2.Name = "ButtonDrop2"
            ButtonDrop2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonDrop2.Size = UDim2.new(0, 213, 0, 30)
            ButtonDrop2.Font = Enum.Font.SourceSansSemibold
            ButtonDrop2.Text = ""
            ButtonDrop2.TextColor3 = Color3.fromRGB(155, 155, 155)
            ButtonDrop2.TextSize = 13.000
        --   ButtonDrop2.AnchorPoint = Vector2.new(0.5, 0.5)
            ButtonDrop2.Position = UDim2.new(0., 0, 0., 0)
            ButtonDrop2.TextXAlignment = Enum.TextXAlignment.Center
            ButtonDrop2.BackgroundTransparency = 1
            ButtonDrop2.TextWrapped = true
            ButtonDrop2.AutoButtonColor = false
            ButtonDrop2.ClipsDescendants = true

            ButtonDrop2.MouseEnter:Connect(function ()
                TweenService:Create(
                    TextLabel_TapDro2p,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end)

            ButtonDrop2.MouseLeave:Connect(function ()
                TweenService:Create(
                    TextLabel_TapDro2p,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end)

            ButtonDrop2.MouseButton1Click:Connect(function()
                TweenService:Create(
                    DropFrame,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Rotation = 0}
                ):Play()
                TextLabel_TapDrop.Text =  text.." : "..tostring(v)
                callback(v)
                dog = not dog
            end
        )


            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        end


        DropFrame.MouseEnter:Connect(function()
            TweenService:Create(
                DropFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextLabel_TapDrop,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {ImageColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    DropFrame.MouseLeave:Connect(function()
            TweenService:Create(
                DropFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextLabel_TapDrop,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {ImageColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )


    ButtonDrop.MouseButton1Click:Connect(function()
        if dog == false then
            TweenService:Create(
                DropFrame,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, FrameSize)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {Rotation = -180}
            ):Play()
            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        else
            TweenService:Create(
                DropFrame,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {Rotation = 0}
            ):Play()
            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        end
        dog = not dog
    end
)
ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )

    local dropfunc = {}

    function dropfunc:Clear()
        TextLabel_TapDrop.Text = tostring(text).." :"
        for i, v in next, ScolDown:GetChildren() do
            if v:IsA("Frame") then
                v:Destroy()
            end
        end
        ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
    end

    function dropfunc:Add(t)
        local ListFrame = Instance.new("Frame")

        ListFrame.Name = "ListFrame"
        ListFrame.Parent = ScolDown
        ListFrame.BackgroundColor3 =  Color3.fromRGB(22553, 23, 23)-- Color3.fromRGB(249, 53, 139)
        ListFrame.BorderSizePixel = 0
        ListFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        ListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        ListFrame.Size = UDim2.new(0, 180, 0, 30) -- UDim2.new(0, 213, 0, 35)
        ListFrame.BackgroundTransparency  = 1
        ListFrame.ClipsDescendants = true

        local TextLabel_TapDro2p = Instance.new("TextLabel")

        TextLabel_TapDro2p.Parent = ListFrame
        TextLabel_TapDro2p.Name =  tostring(t).."Dropdown"
        TextLabel_TapDro2p.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_TapDro2p.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextLabel_TapDro2p.Size =  UDim2.new(0, 180, 0, 30)
        TextLabel_TapDro2p.Font = Enum.Font.SourceSansSemibold
        TextLabel_TapDro2p.Text = tostring(t)
        TextLabel_TapDro2p.TextColor3 = Color3.fromRGB(155, 155, 155)
        TextLabel_TapDro2p.TextSize = 14.000
        TextLabel_TapDro2p.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel_TapDro2p.BackgroundTransparency = 1
        TextLabel_TapDro2p.TextXAlignment = Enum.TextXAlignment.Center

        local ButtonDrop2 = Instance.new("TextButton")

        ButtonDrop2.Parent = ListFrame
        ButtonDrop2.Name = "ButtonDrop2"
        ButtonDrop2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ButtonDrop2.Size = UDim2.new(0, 213, 0, 30)
        ButtonDrop2.Font = Enum.Font.SourceSansSemibold
        ButtonDrop2.Text = ""
        ButtonDrop2.TextColor3 = Color3.fromRGB(155, 155, 155)
        ButtonDrop2.TextSize = 13.000
    --   ButtonDrop2.AnchorPoint = Vector2.new(0.5, 0.5)
        ButtonDrop2.Position = UDim2.new(0., 0, 0., 0)
        ButtonDrop2.TextXAlignment = Enum.TextXAlignment.Center
        ButtonDrop2.BackgroundTransparency = 1
        ButtonDrop2.TextWrapped = true
        ButtonDrop2.AutoButtonColor = false
        ButtonDrop2.ClipsDescendants = true

        ButtonDrop2.MouseEnter:Connect(function ()
            TweenService:Create(
                TextLabel_TapDro2p,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end)

        ButtonDrop2.MouseLeave:Connect(function ()
            TweenService:Create(
                TextLabel_TapDro2p,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end)

        ButtonDrop2.MouseButton1Click:Connect(function()
            TweenService:Create(
                DropFrame,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {Rotation = 0}
            ):Play()
            TextLabel_TapDrop.Text =  text.." : "..tostring(t)
            callback(t)
            dog = not dog
        end
    )

        ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
    end
    return dropfunc

else

    local location = option.location or self.flags
    local flag = not use and option.flag or ""
    local callback = callback or function() end
    local list = option.list or {}
    local default = list.default or list[1].Name

    if not use then
        location[flag] = default
    end


    local DropFrame = Instance.new("Frame")

    DropFrame.Name = "DropFrame"
    DropFrame.Parent = ScrollingFrame_Pageframe
    DropFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)-- Color3.fromRGB(249, 53, 139)
    DropFrame.BorderSizePixel = 0
    DropFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    DropFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    DropFrame.Size = UDim2.new(0, 213, 0, 30) -- UDim2.new(0, 213, 0, 35)
    DropFrame.BackgroundTransparency  = 0
    DropFrame.ClipsDescendants = true

    local ConnerDropFrame = Instance.new("UICorner")

    ConnerDropFrame.CornerRadius = UDim.new(0, 4)
    ConnerDropFrame.Name = ""
    ConnerDropFrame.Parent = DropFrame

    local DropFrameStroke = Instance.new("UIStroke")

    DropFrameStroke.Thickness = 1
    DropFrameStroke.Name = ""
    DropFrameStroke.Parent = DropFrame
    DropFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
    DropFrameStroke.Color = Color3.fromRGB(255, 255, 255)
    DropFrameStroke.Transparency = 0.7





    local LabelFrameDrop = Instance.new("TextLabel")

    LabelFrameDrop.Parent = DropFrame
    LabelFrameDrop.Name = "LabelFrameDrop"
    LabelFrameDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LabelFrameDrop.Position = UDim2.new(0., 0, 0., 0)
    LabelFrameDrop.Size =    UDim2.new(0, 213, 0, 30)
    LabelFrameDrop.Font = Enum.Font.SourceSansSemibold
    LabelFrameDrop.Text = ""
    LabelFrameDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
    LabelFrameDrop.TextSize = 14.000
--   LabelFrameDrop.AnchorPoint = Vector2.new(0.5, 0.5)
    LabelFrameDrop.BackgroundTransparency = 1
    LabelFrameDrop.TextXAlignment = Enum.TextXAlignment.Left


    local TextLabel_TapDrop = Instance.new("TextLabel")

    TextLabel_TapDrop.Parent = LabelFrameDrop
    TextLabel_TapDrop.Name = "TextLabel_TapDrop"
    TextLabel_TapDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_TapDrop.Position = UDim2.new(0.04, 0, 0.14, 0)
    TextLabel_TapDrop.Size =    UDim2.new(0, 140, 0, 20)
    TextLabel_TapDrop.Font = Enum.Font.SourceSansSemibold
    TextLabel_TapDrop.Text = tostring(text).." :"
    TextLabel_TapDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
    TextLabel_TapDrop.TextSize = 14.000
--     TextLabel_TapDrop.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_TapDrop.BackgroundTransparency = 1
    TextLabel_TapDrop.TextXAlignment = Enum.TextXAlignment.Left


    local DropArbt_listimage = Instance.new("ImageButton")

    DropArbt_listimage.Parent = LabelFrameDrop
    DropArbt_listimage.BackgroundTransparency = 1.000
    DropArbt_listimage.AnchorPoint = Vector2.new(0.5, 0.5)
    DropArbt_listimage.Position = UDim2.new(0.9, 0, 0.5, 0)
    DropArbt_listimage.BorderSizePixel = 0
    DropArbt_listimage.Size = UDim2.new(0, 25, 0, 25)
    DropArbt_listimage.Image = "http://www.roblox.com/asset/?id=6031091004"
    DropArbt_listimage.ImageColor3 = Color3.fromRGB(155, 155, 155)

    local ScolDown = Instance.new("ScrollingFrame")

    ScolDown.Name = "ScolDown"
    ScolDown.Position = UDim2.new(0.02, 0, 1., 0)
    ScolDown.Parent = LabelFrameDrop
    ScolDown.Active = true
    ScolDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScolDown.BorderSizePixel = 0
    ScolDown.Size = UDim2.new(0, 205, 0, 115)
    ScolDown.ScrollBarThickness = 3
    ScolDown.ClipsDescendants = true
    ScolDown.BackgroundTransparency = 1
    ScolDown.CanvasSize = UDim2.new(0, 0, 0, 2)

    local UIListLayoutlist = Instance.new("UIListLayout")
    local UIPaddinglist = Instance.new("UIPadding")

    UIListLayoutlist.Name = "UIListLayoutlist"
    UIListLayoutlist.Parent = ScolDown
    UIListLayoutlist.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayoutlist.Padding = UDim.new(0, 5)

    UIPaddinglist.Name = "UIPaddinglist"
    UIPaddinglist.Parent = ScolDown
    UIPaddinglist.PaddingTop = UDim.new(0, 5)
    UIPaddinglist.PaddingLeft = UDim.new(0, 12)

    local ButtonDrop = Instance.new("TextButton")

    ButtonDrop.Parent = DropFrame
    ButtonDrop.Name = "ButtonDrop"
    ButtonDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ButtonDrop.Size = UDim2.new(0, 213, 0, 30)
    ButtonDrop.Font = Enum.Font.SourceSansSemibold
    ButtonDrop.Text = ""
    ButtonDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
    ButtonDrop.TextSize = 13.000
--   ButtonDrop.AnchorPoint = Vector2.new(0.5, 0.5)
    ButtonDrop.Position = UDim2.new(0., 0, 0., 0)
    ButtonDrop.TextXAlignment = Enum.TextXAlignment.Center
    ButtonDrop.BackgroundTransparency = 1
    ButtonDrop.TextWrapped = true
    ButtonDrop.AutoButtonColor = false
    ButtonDrop.ClipsDescendants = true

    local dog = false

    local FrameSize = 75
    local cout = 0
    for i , v in pairs(list) do
        cout =cout + 1
        if cout == 1 then
            FrameSize = 75
        elseif cout == 2 then
            FrameSize = 110
        elseif cout >= 3 then
            FrameSize = 150
        end

        local listtog = Instance.new("Frame")

        listtog.Name = "listtog"
        listtog.Parent = ScolDown
        listtog.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
        listtog.BackgroundTransparency =1
        listtog.BorderSizePixel = 0
        listtog.ClipsDescendants = true
        listtog.AnchorPoint = Vector2.new(0.5, 0.5)
        listtog.Position = UDim2.new(0.5, 0, 0.5, 0)
        listtog.Size = UDim2.new(0, 210, 0, 33)


        local listtextbutton = Instance.new("TextButton")

        listtextbutton.Parent = listtog
        listtextbutton.BackgroundTransparency =1
        listtextbutton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        listtextbutton.BorderSizePixel = 0
        listtextbutton.Size =  UDim2.new(0, 210, 0, 33)
        listtextbutton.AutoButtonColor = false
        listtextbutton.Font = Enum.Font.SourceSans
        listtextbutton.Text = " "
        listtextbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
        listtextbutton.TextSize = 14.000

        local farmtoglist = Instance.new("TextButton")

        farmtoglist.Parent = listtextbutton
        farmtoglist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        farmtoglist.BorderColor3 = Color3.fromRGB(255, 255, 255)
        farmtoglist.BorderSizePixel = 0
        farmtoglist.AnchorPoint = Vector2.new(0.5, 0.5)
        farmtoglist.Position = UDim2.new(0.1, 0, 0.5, 0)
        farmtoglist.Size = UDim2.new(0, 23, 0, 23)
        farmtoglist.Font = Enum.Font.SourceSans
        farmtoglist.Text = " "
        farmtoglist.TextColor3 = Color3.fromRGB(0, 0, 0)
        farmtoglist.TextSize = 14.000
        farmtoglist.AutoButtonColor = false


        local farmtoglist2 = Instance.new("TextButton")

        farmtoglist2.Parent = farmtoglist
        farmtoglist2.BackgroundColor3 = Color3.fromRGB(32, 32,32)
        farmtoglist2.BorderColor3 = Color3.fromRGB(255, 255, 255)
        farmtoglist2.BorderSizePixel = 0
        farmtoglist2.AnchorPoint = Vector2.new(0.5, 0.5)
        farmtoglist2.Position = UDim2.new(0.5, 0, 0.5, 0)
        farmtoglist2.Size = UDim2.new(0, 21, 0, 21)
        farmtoglist2.Font = Enum.Font.SourceSans
        farmtoglist2.Text = " "
        farmtoglist2.TextColor3 = Color3.fromRGB(0, 0, 0)
        farmtoglist2.TextSize = 14.000
        farmtoglist2.AutoButtonColor = false


        local listimage = Instance.new("ImageButton")

        listimage.Parent = farmtoglist2
        listimage.BackgroundTransparency = 1.000
        listimage.AnchorPoint = Vector2.new(0.5, 0.5)
        listimage.Position = UDim2.new(0.5, 0, 0.5, 0)
        listimage.BorderSizePixel = 0
        listimage.Size = UDim2.new(0, 0, 0, 0)
        listimage.Image = "http://www.roblox.com/asset/?id=5880482965"


        local textlist = Instance.new("TextLabel")


        textlist.Parent = listtextbutton
        textlist.Name = "textlist"
        textlist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        textlist.BackgroundTransparency = 1.000
        textlist.AnchorPoint = Vector2.new(0.5, 0.5)
        textlist.Position = UDim2.new(0.5, 0, 0.5, 0)
        textlist.BorderSizePixel = 0
        textlist.Size = UDim2.new(0, 91, 0, 25)
        textlist.Font = Enum.Font.GothamSemibold
        textlist.Text = tostring(v.Name)
        textlist.TextColor3 = Color3.fromRGB(255, 255, 255)
        textlist.TextSize = 13.000



        local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 5)
        TextButton_Pageframe_Uiconner2.Name = ""
        TextButton_Pageframe_Uiconner2.Parent = farmtoglist

        local TextButton_Pageframe_Uiconner22 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner22.CornerRadius = UDim.new(0, 5)
        TextButton_Pageframe_Uiconner22.Name = ""
        TextButton_Pageframe_Uiconner22.Parent = farmtoglist2



        listtextbutton.MouseButton1Click:Connect(function()
            if not  location[v.flag] then
                listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                wait(0.1)
                listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
            else
                listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                wait(0.1)
                listimage:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
            end
            location[v.flag] = not location[v.flag]
            callback(location[v.flag])
        end
    )

    if  location[v.flag] then
        listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
        wait(0.1)
        listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)

        callback(location[v.flag])
    end

        ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
    end


    DropFrame.MouseEnter:Connect(function()
        TweenService:Create(
            DropFrameStroke,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextLabel_TapDrop,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            DropArbt_listimage,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {ImageColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
    end
)

DropFrame.MouseLeave:Connect(function()
        TweenService:Create(
            DropFrameStroke,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextLabel_TapDrop,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            DropArbt_listimage,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {ImageColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
    end
)


ButtonDrop.MouseButton1Click:Connect(function()
    if dog == false then
        TweenService:Create(
            DropFrame,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 213, 0, FrameSize)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            DropArbt_listimage,
            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
            {Rotation = -180}
        ):Play()
        ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
    else
        TweenService:Create(
            DropFrame,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            DropArbt_listimage,
            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
            {Rotation = 0}
        ):Play()
        ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
    end
    dog = not dog
end
)
ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )



    end



    end

    function items:TextBox(text,text2,callback)
        local TextFrame = Instance.new("Frame")

        TextFrame.Name = "TextFrame"
        TextFrame.Parent = ScrollingFrame_Pageframe
        TextFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
        TextFrame.BorderSizePixel = 0
        TextFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        TextFrame.Size = UDim2.new(0, 213, 0, 70)
        TextFrame.BackgroundTransparency  = 1
        TextFrame.ClipsDescendants = true

        local LabelNameSliderxd = Instance.new("TextLabel")

        LabelNameSliderxd.Parent = TextFrame
        LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelNameSliderxd.BackgroundTransparency = 1
        LabelNameSliderxd.BorderSizePixel = 0
        LabelNameSliderxd.Position = UDim2.new(0.5, 0, 0.2, 0)
        LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelNameSliderxd.Size = UDim2.new(0, 160, 0, 20)
        LabelNameSliderxd.Font = Enum.Font.GothamBold
        LabelNameSliderxd.Text = tostring(text)
        LabelNameSliderxd.TextColor3 = Color3.fromRGB(155, 155, 155)
        LabelNameSliderxd.TextSize = 11.000
        LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Center

        local ConerTextBox = Instance.new("UICorner")

        ConerTextBox.CornerRadius = UDim.new(0, 4)
        ConerTextBox.Name = ""
        ConerTextBox.Parent = TextFrame

        local FrameBox = Instance.new("Frame")

        FrameBox.Name = "TextFrame"
        FrameBox.Parent = TextFrame
        FrameBox.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
        FrameBox.BorderSizePixel = 0
        FrameBox.Position = UDim2.new(0.5, 0, 0.65, 0)
        FrameBox.AnchorPoint = Vector2.new(0.5, 0.5)
        FrameBox.Size = UDim2.new(0, 158, 0, 30)
        FrameBox.BackgroundTransparency  = 0.2
        FrameBox.ClipsDescendants = true
        FrameBox.AnchorPoint = Vector2.new(0.5, 0.5)

        local TextFrame2 = Instance.new("TextBox")

        TextFrame2.Parent = FrameBox
        TextFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextFrame2.BorderSizePixel = 0
        TextFrame2.ClipsDescendants = true
        TextFrame2.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
        TextFrame2.Size = UDim2.new(0, 158, 0, 35)
        TextFrame2.Font = Enum.Font.GothamSemibold
        TextFrame2.PlaceholderColor3 = Color3.fromRGB(155, 155, 155)
        TextFrame2.PlaceholderText = text2
        TextFrame2.Text = ""
        TextFrame2.TextColor3 = Color3.fromRGB(155, 155, 155)
        TextFrame2.TextSize = 12.000
        TextFrame2.BackgroundTransparency = 1

        local ConerTextBox2 = Instance.new("UICorner")

        ConerTextBox2.CornerRadius = UDim.new(0, 4)
        ConerTextBox2.Name = ""
        ConerTextBox2.Parent = FrameBox

        local TextBoxStroke = Instance.new("UIStroke")

        TextBoxStroke.Thickness = 1
        TextBoxStroke.Name = ""
        TextBoxStroke.Parent = FrameBox
        TextBoxStroke.LineJoinMode = Enum.LineJoinMode.Round
        TextBoxStroke.Color = Color3.fromRGB(255, 255, 255)
        TextBoxStroke.Transparency = 0.7


        TextFrame.MouseEnter:Connect(function()
            TweenService:Create(
                FrameBox,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                FrameBox,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextFrame2,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {PlaceholderColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextFrame2,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelNameSliderxd,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextBoxStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Thickness = 0} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    TextFrame.MouseLeave:Connect(function()
        TweenService:Create(
            FrameBox,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 158, 0, 30)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            FrameBox,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(23, 23, 23)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextFrame2,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {PlaceholderColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextBoxStroke,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Thickness = 1} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            LabelNameSliderxd,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        TweenService:Create(
            TextFrame2,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
    end
    )
        TextFrame2.FocusLost:Connect(function ()
            if #TextFrame2.Text > 0 then
                pcall(callback,TextFrame2.Text)
            end
        end)
    end

    function items:Bind(text,bi,callback)
        local BindFrame = Instance.new("Frame")

        BindFrame.Name = "BindFrame"
        BindFrame.Parent = ScrollingFrame_Pageframe
        BindFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
        BindFrame.BorderSizePixel = 0
        BindFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        BindFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        BindFrame.Size = UDim2.new(0, 213, 0, 35)
        BindFrame.BackgroundTransparency  = 0
        BindFrame.ClipsDescendants = true

        local BindConner = Instance.new("UICorner")

        BindConner.CornerRadius = UDim.new(0, 4)
        BindConner.Name = ""
        BindConner.Parent = BindFrame

        local BindStroke = Instance.new("UIStroke")

        BindStroke.Thickness = 1
        BindStroke.Name = ""
        BindStroke.Parent = BindFrame
        BindStroke.LineJoinMode = Enum.LineJoinMode.Round
        BindStroke.Color = Color3.fromRGB(255, 255, 255)
        BindStroke.Transparency = 0.7

        local LabelBind = Instance.new("TextLabel")

        LabelBind.Parent = BindFrame
        LabelBind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelBind.BackgroundTransparency = 1
        LabelBind.BorderSizePixel = 0
        LabelBind.Position = UDim2.new(0.4, 0, 0.5, 0)
        LabelBind.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelBind.Size = UDim2.new(0, 140, 0, 35)
        LabelBind.Font = Enum.Font.GothamBold
        LabelBind.Text = tostring(text)
        LabelBind.TextColor3 = Color3.fromRGB(155, 155, 155)
        LabelBind.TextSize = 11.000
        LabelBind.TextXAlignment = Enum.TextXAlignment.Left

        local key = bi.Name
        local LabelBind2 = Instance.new("TextButton")

        LabelBind2.Parent = BindFrame
        LabelBind2.Name = "LabelBind2"
        LabelBind2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelBind2.Size = UDim2.new(0, 100, 0, 19)
        LabelBind2.Font = Enum.Font.GothamBold
        LabelBind2.Text =  "KEY : "..key
        LabelBind2.TextColor3 = Color3.fromRGB(155, 155, 155)
        LabelBind2.TextSize = 11.000
        LabelBind2.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelBind2.Position = UDim2.new(0.75, 0, 0.5, 0)
        LabelBind2.TextXAlignment = Enum.TextXAlignment.Center
        LabelBind2.BackgroundTransparency = 1
        LabelBind2.TextWrapped = true

        local LabelBind22 = Instance.new("TextButton")

        LabelBind22.Parent = BindFrame
        LabelBind22.Name = "LabelBind22"
        LabelBind22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelBind22.Size = UDim2.new(0, 213, 0, 35)
        LabelBind22.Font = Enum.Font.GothamBold
        LabelBind22.Text =  ""
        LabelBind22.TextColor3 = Color3.fromRGB(155, 155, 155)
        LabelBind22.TextSize = 11.000
        LabelBind22.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelBind22.Position = UDim2.new(0.5, 0, 0.5, 0)
        LabelBind22.TextXAlignment = Enum.TextXAlignment.Center
        LabelBind22.BackgroundTransparency = 1
        LabelBind22.TextWrapped = true

        BindFrame.MouseEnter:Connect(function()
            TweenService:Create(
                BindStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelBind22,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelBind2,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelBind,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )
        BindFrame.MouseLeave:Connect(function()
            TweenService:Create(
                BindStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelBind22,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelBind2,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelBind,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

        LabelBind22.MouseButton1Click:Connect(function ()


            LabelBind2.Text = "KEY : ".."..."
            local inputwait = game:GetService("UserInputService").InputBegan:wait()
            local fuckulop = inputwait.KeyCode == Enum.KeyCode.Unknown and inputwait.UserInputType or inputwait.KeyCode

            if
            fuckulop.Name ~= "Focus" and fuckulop.Name ~= "MouseMovement" and fuckulop.Name ~= "Focus"
            then
                LabelBind2.Text =  "KEY : "..fuckulop.Name
                key = fuckulop.Name
            end
            -- if fuckulop.Name ~= "Unknown" then
            --     LabelBind2.Text = fuckulop.Name
            --     key = fuckulop.Name
            -- end

        end)


        game:GetService("UserInputService").InputBegan:connect(
            function(current)
                local fuckulop2 = current.KeyCode == Enum.KeyCode.Unknown and current.UserInputType or current.KeyCode

                    if fuckulop2.Name ==  key then
                        pcall(callback)

                end
            end
            )

    end

    function items:Line()
        local LineFrame = Instance.new("Frame")

        LineFrame.Name = "LineFrame"
        LineFrame.Parent = ScrollingFrame_Pageframe
        LineFrame.BackgroundColor3 =  Color3.fromRGB(255, 255, 255)
        LineFrame.BorderSizePixel = 0
        LineFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        LineFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        LineFrame.Size = UDim2.new(0, 213, 0, 1)
        LineFrame.BackgroundTransparency  = 0
        LineFrame.ClipsDescendants = true

        local LineFrame_BindConner = Instance.new("UICorner")

        LineFrame_BindConner.CornerRadius = UDim.new(0, 30)
        LineFrame_BindConner.Name = ""
        LineFrame_BindConner.Parent = LineFrame

    end

    function items:Color(text,preset,callback)
        local Pixker = Instance.new("Frame")

        Pixker.Name = "Pixker"
        Pixker.Parent = ScrollingFrame_Pageframe
        Pixker.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
        Pixker.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
        Pixker.Size = UDim2.new(0, 213, 0, 33)
        Pixker.BackgroundTransparency = 0
        Pixker.BorderSizePixel = 0
        Pixker.AnchorPoint = Vector2.new(0.5, 0.5)
        Pixker.Position = UDim2.new(0.5, 0, 0.5, 0)
        Pixker.ClipsDescendants = true


        local BoxColorCorner2 = Instance.new("UICorner")

        BoxColorCorner2.CornerRadius = UDim.new(0, 4)
        BoxColorCorner2.Name = "BoxColorCorner"
        BoxColorCorner2.Parent = Pixker

        local MheeFrameStroke = Instance.new("UIStroke")

        MheeFrameStroke.Thickness = 1
        MheeFrameStroke.Name = ""
        MheeFrameStroke.Parent = Pixker
        MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
        MheeFrameStroke.Color = Color3.fromRGB(255, 255, 255)
        MheeFrameStroke.Transparency = 0.7


        local TextFrameColor = Instance.new("TextLabel")

        TextFrameColor.Parent = Pixker
        TextFrameColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextFrameColor.BorderSizePixel = 0
        TextFrameColor.Size = UDim2.new(0, 200, 0, 34)
        TextFrameColor.Font = Enum.Font.SourceSans
        TextFrameColor.Text = "  "
        TextFrameColor.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextFrameColor.TextSize = 14.000
        TextFrameColor.BackgroundTransparency = 1
        TextFrameColor.Position = UDim2.new(0., 0, 0., 0)

        local TextReal = Instance.new("TextLabel")

        TextReal.Parent = TextFrameColor
        TextReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextReal.BorderSizePixel = 0
        TextReal.Size = UDim2.new(0, 140, 0, 34)
        TextReal.Font = Enum.Font.GothamSemibold
        TextReal.Text = text
        TextReal.TextColor3 = Color3.fromRGB(155,155, 155)
        TextReal.TextSize = 12.000
        TextReal.BackgroundTransparency = 1
        TextReal.Position = UDim2.new(0.05, 0, 0., 0)
        TextReal.TextXAlignment = Enum.TextXAlignment.Left

        local BoxColor = Instance.new("Frame")

        BoxColor.Name = "BoxColor"
        BoxColor.Parent = TextFrameColor
        BoxColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        BoxColor.Position = UDim2.new(0.85, 0, 0.5, 0)
        BoxColor.Size = UDim2.new(0, 35, 0, 19)
        BoxColor.AnchorPoint = Vector2.new(0.5, 0.5)

        local BoxColorCorner = Instance.new("UICorner")

        BoxColorCorner.CornerRadius = UDim.new(0, 4)
        BoxColorCorner.Name = "BoxColorCorner"
        BoxColorCorner.Parent = BoxColor

        local TextButton_Dropdown = Instance.new("TextButton")


        TextButton_Dropdown.Parent = TextFrameColor
        TextButton_Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        TextButton_Dropdown.BorderSizePixel = 0
        TextButton_Dropdown.Position = UDim2.new(0., 0, 0.14705883, 0)
        TextButton_Dropdown.Size = UDim2.new(0, 200, 0, 33)
        TextButton_Dropdown.Font = Enum.Font.SourceSans
        TextButton_Dropdown.Text = "  "
        TextButton_Dropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_Dropdown.TextSize = 14.000
        TextButton_Dropdown.AutoButtonColor = false
        --TextButton_Dropdown.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_Dropdown.Position = UDim2.new(0, 0, 0, 0)
        TextButton_Dropdown.BackgroundTransparency = 1



        Pixker.MouseEnter:Connect(function()
            TweenService:Create(
                MheeFrameStroke,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.}
            ):Play()
            TweenService:Create(
                TextReal,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255,255, 255)}
            ):Play()

        end)
        Pixker.MouseLeave:Connect(function()
            TweenService:Create(
                MheeFrameStroke,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.7}
            ):Play()
            TweenService:Create(
                TextReal,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155,155, 155)}
            ):Play()
        end)
    -- Rainbow Toggle


    local TextButton_2_Toggle = Instance.new("TextButton")

    TextButton_2_Toggle.Parent = TextFrameColor
    TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
--        TextButton_2_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
    TextButton_2_Toggle.BorderSizePixel = 0
    TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
    TextButton_2_Toggle.Position = UDim2.new(0.2, 0, 1.87, 0)
    TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
    TextButton_2_Toggle.Font = Enum.Font.SourceSans
    TextButton_2_Toggle.Text = " "
    TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_2_Toggle.TextSize = 12.000
    TextButton_2_Toggle.AutoButtonColor = false

    local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

    TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
    TextButton_Pageframe_Uiconner.Name = ""
    TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

    local TextButton_3_Toggle = Instance.new("TextButton")

    TextButton_3_Toggle.Parent = TextButton_2_Toggle
    TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
    TextButton_3_Toggle.BorderSizePixel = 0
    TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
    TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
    TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
    TextButton_3_Toggle.Font = Enum.Font.SourceSans
    TextButton_3_Toggle.Text = " "
    TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_3_Toggle.TextSize = 12.000
    TextButton_3_Toggle.AutoButtonColor = false

    local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

    TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
    TextButton_Pageframe_Uiconner2.Name = ""
    TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

    local TextButton_4_Toggle = Instance.new("TextButton")

    TextButton_4_Toggle.Parent = TextButton_3_Toggle
    TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155,155)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(249, 53, 139)
    TextButton_4_Toggle.BorderSizePixel = 0
    TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
    TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
    TextButton_4_Toggle.Font = Enum.Font.SourceSans
    TextButton_4_Toggle.Text = " "
    TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_4_Toggle.TextSize = 12.000
    TextButton_4_Toggle.AutoButtonColor = false
    TextButton_4_Toggle.BackgroundTransparency = 1
    TextButton_4_Toggle.Visible = true

    local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

    TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
    TextButton_Pageframe_Uiconner4.Name = ""
    TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle


    local TextButton_Toggle = Instance.new("TextButton")

    TextButton_Toggle.Parent = ValueFrame
    TextButton_Toggle.BackgroundTransparency =1
    TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_Toggle.BorderSizePixel = 0
    TextButton_Toggle.Size = UDim2.new(0, 50, 0, 20)
    TextButton_Toggle.AutoButtonColor = false
    TextButton_Toggle.Font = Enum.Font.SourceSans
    TextButton_Toggle.Text = " "
    TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_Toggle.TextSize = 12.000
    TextButton_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
    TextButton_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)

    local TextButton_3_Toggle2 = Instance.new("TextLabel")

    TextButton_3_Toggle2.Parent = TextButton_2_Toggle
    TextButton_3_Toggle2.BackgroundColor3 = Color3.fromRGB(32, 32,32)
    TextButton_3_Toggle2.BorderColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_3_Toggle2.BorderSizePixel = 0
    TextButton_3_Toggle2.AnchorPoint = Vector2.new(0.5, 0.5)
    TextButton_3_Toggle2.Position = UDim2.new(1.9, 0, 0.5, 0)
    TextButton_3_Toggle2.Size = UDim2.new(0, 500, 0, 21)
    TextButton_3_Toggle2.Font = Enum.Font.SourceSansBold
    TextButton_3_Toggle2.Text = "Rainbow"
    TextButton_3_Toggle2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_3_Toggle2.TextSize = 13.000
    TextButton_3_Toggle2.BackgroundTransparency = 1

    local OMF = Instance.new("TextButton")

    OMF.Parent = TextButton_2_Toggle
    OMF.BackgroundTransparency =1
    OMF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    OMF.BorderSizePixel = 0
    OMF.Size = UDim2.new(0, 100, 0, 20)
    OMF.AutoButtonColor = false
    OMF.Font = Enum.Font.SourceSans
    OMF.Text = " "
    OMF.TextColor3 = Color3.fromRGB(0, 0, 0)
    OMF.TextSize = 12.000
    OMF.AnchorPoint = Vector2.new(0.5, 0.5)
    OMF.Position = UDim2.new(1.3, 0, 0.5, 0)

    local Color =  Instance.new("ImageLabel")

    Color.Name = "Color"
    Color.Parent = TextFrameColor
    Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Color.Position = UDim2.new(0.05,0,4,0)
    Color.Size = UDim2.new(0, 195, 0, 40)
    Color.ZIndex = 0
    Color.BorderSizePixel = 0
    Color.Image = "rbxassetid://4155801252"

    local ColorFucj = Instance.new("UICorner")

    ColorFucj.CornerRadius = UDim.new(0, 4)
    ColorFucj.Name = ""
    ColorFucj.Parent = Color

    local ColorSelection =  Instance.new("ImageLabel")

    ColorSelection.Name = "ColorSelection"
    ColorSelection.Parent = Color
    ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
    ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ColorSelection.BackgroundTransparency = 1.000
    ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
    ColorSelection.Size = UDim2.new(0, 18, 0, 18)
    ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
    ColorSelection.ScaleType = Enum.ScaleType.Fit
    ColorSelection.Visible = true

    local Hue =  Instance.new("ImageLabel")

    Hue.Name = "Hue2"
    Hue.Parent = TextFrameColor
    Hue.Position = UDim2.new(0.14,0,3,0)
    Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Hue.Size = UDim2.new(0, 160, 0, 25)
    Hue.ZIndex = 0
    Hue.BorderSizePixel = 0

    local ColorFucj2 = Instance.new("UICorner")

    ColorFucj2.CornerRadius = UDim.new(0, 4)
    ColorFucj2.Name = ""
    ColorFucj2.Parent = Hue

    local HueGradient = Instance.new("UIGradient")

    HueGradient.Color = ColorSequence.new {
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
        ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
        ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
        ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
        ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
    }
    HueGradient.Rotation = 0
    HueGradient.Name = "HueGradient"
    HueGradient.Parent = Hue

    local HueSelection =  Instance.new("ImageLabel")

    HueSelection.Name = "HueSelection"
    HueSelection.Parent = Hue
    HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
    HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    HueSelection.BackgroundTransparency = 1.000
    HueSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
    HueSelection.Size = UDim2.new(0, 18, 0, 18)
    HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
    HueSelection.ScaleType = Enum.ScaleType.Fit
    HueSelection.Visible = true


    local BTN_XD = Instance.new("TextButton")

    BTN_XD.Parent = TextFrameColor
    BTN_XD.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BTN_XD.BorderColor3 = Color3.fromRGB(255, 255, 255)
    BTN_XD.BorderSizePixel = 0
    BTN_XD.AnchorPoint = Vector2.new(0.5, 0.5)
    BTN_XD.Position = UDim2.new(0.8, 0, 1.9, 0)
    BTN_XD.Size = UDim2.new(0, 50, 0, 25)
    BTN_XD.Font = Enum.Font.GothamSemibold
    BTN_XD.Text = "Confirm"
    BTN_XD.TextColor3 = Color3.fromRGB(255, 255, 255)
    BTN_XD.TextSize = 11.000
    BTN_XD.AutoButtonColor = false

    local BTN_XD_COnner = Instance.new("UICorner")

    BTN_XD_COnner.CornerRadius = UDim.new(0, 4)
    BTN_XD_COnner.Name = ""
    BTN_XD_COnner.Parent = BTN_XD



    local MheeFrameStroke = Instance.new("UIStroke")

    MheeFrameStroke.Thickness = 1
    MheeFrameStroke.Name = ""
    MheeFrameStroke.Parent = BTN_XD
    MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
    MheeFrameStroke.Color = Color3.fromRGB(255, 255, 255)
    MheeFrameStroke.Transparency = 0.7


    local UwU = false


    OMF.MouseButton1Click:Connect(function()
        if       UwU == false  then
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_3_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_2_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
        else
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_3_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_2_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
        end
        UwU = not UwU
    end
)


OMF.MouseEnter:Connect(function()
        TweenService:Create(
            TextButton_4_Toggle,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
        ):Play()
    end
)

OMF.MouseLeave:Connect(function()
        TweenService:Create(
            TextButton_4_Toggle,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
        ):Play()
    end
)

OMF.MouseButton1Down:Connect(
        function()
            RainbowColorPicker = not RainbowColorPicker

            if ColorInput then
                ColorInput:Disconnect()
            end

            if HueInput then
                HueInput:Disconnect()
            end

            if RainbowColorPicker then


                OldToggleColor = BoxColor.BackgroundColor3
                OldColor = Color.BackgroundColor3
                OldColorSelectionPosition = ColorSelection.Position
                OldHueSelectionPosition = HueSelection.Position

                while RainbowColorPicker do
                    BoxColor.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)
                    Color.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)

                    ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                    HueSelection.Position = UDim2.new(0,  Red.HueSelectionPosition, 0.5,0)

                    pcall(callback, BoxColor.BackgroundColor3)
                    wait()
                end
            elseif not RainbowColorPicker then

                BoxColor.BackgroundColor3 = OldToggleColor
                Color.BackgroundColor3 = OldColor

                ColorSelection.Position = OldColorSelectionPosition
                HueSelection.Position = OldHueSelectionPosition

                pcall(callback, BoxColor.BackgroundColor3)
            end
        end
    )
    TextButton_3_Toggle.MouseButton1Down:Connect(
        function()
            RainbowColorPicker = not RainbowColorPicker

            if ColorInput then
                ColorInput:Disconnect()
            end

            if HueInput then
                HueInput:Disconnect()
            end

            if RainbowColorPicker then


                OldToggleColor = BoxColor.BackgroundColor3
                OldColor = Color.BackgroundColor3
                OldColorSelectionPosition = ColorSelection.Position
                OldHueSelectionPosition = HueSelection.Position

                while RainbowColorPicker do
                    BoxColor.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)
                    Color.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)

                    ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                    HueSelection.Position = UDim2.new(0,  Red.HueSelectionPosition, 0.5,0)

                    pcall(callback, BoxColor.BackgroundColor3)
                    wait()
                end
            elseif not RainbowColorPicker then

                BoxColor.BackgroundColor3 = OldToggleColor
                Color.BackgroundColor3 = OldColor

                ColorSelection.Position = OldColorSelectionPosition
                HueSelection.Position = OldHueSelectionPosition

                pcall(callback, BoxColor.BackgroundColor3)
            end
        end
    )


    local function UpdateColorPicker(nope)
        BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
        Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

        pcall(callback, BoxColor.BackgroundColor3)
    end
    ColorH =
    1 -
    (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
        Hue.AbsoluteSize.Y)
    ColorS =
        (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
            Color.AbsoluteSize.X)
    ColorV =
        1 -
        (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
            Color.AbsoluteSize.Y)

    BoxColor.BackgroundColor3 = preset
    Color.BackgroundColor3 = preset
    pcall(callback, BoxColor.BackgroundColor3)

    local RainbowColorPicker = false

    Color.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if RainbowColorPicker then
                    return
                end

                if ColorInput then
                    ColorInput:Disconnect()
                end

                ColorInput =
                    RunService.RenderStepped:Connect(
                        function()
                        local ColorX =
                            (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                                Color.AbsoluteSize.X)
                        local ColorY =
                            (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                                Color.AbsoluteSize.Y)

                        ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                        ColorS = ColorX
                        ColorV = 1 - ColorY

                        UpdateColorPicker(true)
                    end
                    )
            end
        end
    )


        Color.InputEnded:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if ColorInput then
                        ColorInput:Disconnect()
                    end
                end
            end
        )

        Hue.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if RainbowColorPicker then
                        return
                    end

                    if HueInput then
                        HueInput:Disconnect()
                    end

                    HueInput =
                        RunService.RenderStepped:Connect(
                            function()
                            local HueY =
                                (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                                    Hue.AbsoluteSize.Y)
                            local HueX =
                                (math.clamp(Mouse.X- Hue.AbsolutePosition.X, 0, Hue.AbsoluteSize.X) /
                                    Hue.AbsoluteSize.X)

                            HueSelection.Position = UDim2.new(HueX, 0, HueY, 0)
                            ColorH = 1 - HueY

                            UpdateColorPicker(true)
                        end
                        )
                end
            end
        )

        Hue.InputEnded:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if HueInput then
                        HueInput:Disconnect()
                    end
                end
            end
        )
        local sk = false
        TextButton_Dropdown.MouseButton1Click:Connect(function()
            if sk == false then
            TweenService:Create(
                Pixker,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, 180)}
            ):Play()
        else
            TweenService:Create(
                Pixker,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, 33)}
            ):Play()
        end
        sk = not sk
        end
    )
        BTN_XD.MouseButton1Click:Connect(
            function()
                TweenService:Create(
                    Pixker,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 33)}
                ):Play()
                sk = not sk
            end
        )


    end
    function items:Label(text,image)
        if image == nil then
            image = "6031229361"
        end
        local labaelchange = {}
        local LabelFrame = Instance.new("Frame")


        LabelFrame.Name = "Mainframenoti"
        LabelFrame.Parent = ScrollingFrame_Pageframe
        LabelFrame.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
        LabelFrame.BackgroundTransparency = 0
        LabelFrame.BorderSizePixel = 0
        LabelFrame.ClipsDescendants = false
        LabelFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelFrame.Position = UDim2.new(0.498, 0, 0.5, 0)
        LabelFrame.Size = UDim2.new(0, 213, 0, 28)

        local LabelFarm2 = Instance.new("TextLabel")

        LabelFarm2.Parent = LabelFrame
        LabelFarm2.Name = "TextLabel_Tap"
        LabelFarm2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        LabelFarm2.Size =UDim2.new(0, 130, 0,24 )
        LabelFarm2.Font = Enum.Font.SourceSansSemibold
        LabelFarm2.Text = text
        LabelFarm2.TextColor3 = Color3.fromRGB(255, 255, 255)
        LabelFarm2.TextSize = 12.000
        LabelFarm2.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelFarm2.Position = UDim2.new(0.5, 0, 0.5, 0)
        LabelFarm2.TextXAlignment = Enum.TextXAlignment.Center
        LabelFarm2.BackgroundTransparency = 1
        LabelFarm2.TextWrapped = true

        local ImageLabel_gx = Instance.new("ImageLabel")

        ImageLabel_gx.Parent = LabelFrame
        ImageLabel_gx.BackgroundTransparency = 1.000
        ImageLabel_gx.BorderSizePixel = 0
        ImageLabel_gx.Size = UDim2.new(0, 18, 0, 18)
        ImageLabel_gx.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageLabel_gx.Position = UDim2.new(0.06, 0, 0.45, 0)
        ImageLabel_gx.Image = "http://www.roblox.com/asset/?id="..tostring(image)
        ImageLabel_gx.BackgroundTransparency = 1

        local noticore55 = Instance.new("UICorner")

        noticore55.CornerRadius = UDim.new(0, 4)
        noticore55.Name = ""
        noticore55.Parent = LabelFarm2

        local noticore2777 = Instance.new("UICorner")

        noticore2777.CornerRadius = UDim.new(0, 4)
        noticore2777.Name = ""
        noticore2777.Parent = LabelFrame

        local LabelStroke = Instance.new("UIStroke")

        LabelStroke.Thickness = 1
        LabelStroke.Name = ""
        LabelStroke.Parent = LabelFrame
        LabelStroke.LineJoinMode = Enum.LineJoinMode.Round
        LabelStroke.Color = Color3.fromRGB(255, 255, 255)
        LabelStroke.Transparency = 0.7

        LabelFrame.MouseEnter:Connect(function()
            TweenService:Create(
                LabelStroke,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency =0}
            ):Play()
        end
    )
        LabelFrame.MouseLeave:Connect(function()
            TweenService:Create(
                LabelStroke,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency =0.7}
            ):Play()
        end
    )
        function labaelchange:Change(text2)
            LabelFarm2.Text = text2
        end
        return  labaelchange
    end
    return  items
    end
return  page
end
return top
end

Wapon = {}
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
    if v:IsA("Tool") then
        table.insert(Wapon ,v.Name)
    end
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
    if v:IsA("Tool") then
    table.insert(Wapon, v.Name)
    end
end

-------UI System---------
local ui = create:Win("Hellway Hub");
local Tap1 = ui:Taps("Auto Farm");
local page1 = Tap1:newpage();

page1:Label("Function Reset",0);

page1:Button("Reset Character", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(15, true)
    game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(15)
end)

page1:Button("Reset Movement", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end)

page1:Button("Reset System Tween", function()
    TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
end)

page1:Label("Auto Farm Misc", 0)

page1:Button("Redeem Code 2xExp", function()
   	function UseCode(Text)
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
    end
    UseCode("Starcodeheo")
    UseCode("Magicbus")
    UseCode("Enyu_is_Pro")
    UseCode("Sub2Fer999")
    UseCode("Bluxxy")
    UseCode("JCWK")
    UseCode("3BVISITS")
    UseCode("UPD16")
    UseCode("SUB2GAMERROBOT_EXP1")
    UseCode("StrawHatMaine")
    UseCode("Sub2OfficialNoobie")
    UseCode("THEGREATACE")
    UseCode("TantaiGaming")
    UseCode("Axiore")
    UseCode("SUB2NOOBMASTER123")
    UseCode("Sub2Daigrock") 
end)

page1:Label("Set Fps Setting",0)

page1:Button("Fps Boost", function()
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

page1:Button("SetFps ( Unlock )", function()
    pcall(setfpscap, 99999)
end)

local page2 = Tap1:newpage();

page2:Label("Auto Farm Setting",0);
game:GetService("ReplicatedStorage").Util.Sound.Storage.Lazy.Hit1:Destroy()
page2:Toggle("Auto Farm Level", false, function(auto)
    _G.AutoFarmLevel = auto
	if _G.AutoFarmLevel and SelectToolWeapon == nil then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Farm Level", 
            Text = "Select Weapon plsss"
        })
	else
        AutoReMob = false
        _G.SetSpawn = auto
        _G.Magnet = auto
        AutoHaki = auto
        SF015 = auto
        Auto_Farm = auto
        if auto == false then
            wait(0.5)
            AutoReMob = true
            TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end
end)

page2:Toggle("Auto Kaiton", false, function(auto)
    _G.AutoKaiton = auto
	if _G.AutoKaiton and SelectToolWeapon == nil then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Kaiton", 
            Text = "Select Weapon "
        })
    else
        AutoReMob = false
        _G.SetSpawn = auto
        _G.Magnet = auto
        AutoHaki = auto
        SF015 = auto
        Auto_Farm = auto
        AutoNew = auto
        RedeemCode2exp = auto
        autobuya = auto
        if auto == false then
            wait(0.5)
            AutoReMob = true
            TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end
    end
end)

local SelectWeapon = page2:Drop("SelectWeapon", false, Wapon,function(Value)
    SelectToolWeapon = Value
    SelectToolWeaponOld = Value
end)

page2:Button("Refresh Weapon",function()
    SelectWeapon:Clear()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
        if v:IsA("Tool") then
            SelectWeapon:Add(v.Name)
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            SelectWeapon:Add(v.Name)
        end
    end
end)

page2:Label("Function More",0);

page2:Toggle("Auto NewWorld", false, function(auto)
    AutoNew = auto
    if auto == false then
        wait(.5)
        TP(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end)

page2:Toggle("Auto Buy Abilities", false, function(t)
    while t do wait()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
    end
end)

local Tap2 = ui:Taps("Stats")
local page3 = Tap2:newpage()
page3:Label("Set Stats", 0)

page3:Toggle("Auto Stats Kaiton", false, function(p)
    _G.AutoStat = p
end)

page3:Toggle("Auto Melee", false, function(v)
    melee = v
end)

page3:Toggle("Auto Defense", false, function(v)
    def = v
end)

page3:Toggle("Auto Sword", false, function(v)
    sword = v
end)

page3:Toggle("Auto Gun", false, function(v)
    gun = v
end)

page3:Toggle("Auto DevilFruit", false, function(v)
    DevilFruit = v
end)

function TP(CFgo, TPtween)
    NoClip = true
    local tweenfunc = {}
        if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude <= 150 then
            pcall(function()
                game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = CFgo
                return
            end)
        end
        local CP = game:GetService("Players").LocalPlayer.Character
        local LPos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
        local tween_s = game:service"TweenService"
        local LP = game.Players.LocalPlayer
        local tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/225, Enum.EasingStyle.Linear), {CFrame = CFgo,TPtween})
        tween:Play()
        NoClip = false
        if not tween then return tween 
    end
    return tweenfunc or true
end

function TP2(P1)
    Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 150 then
        Speed = math.huge
    elseif Distance < 1000 then
        Speed = 250
    end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = P1}
    ):Play()
end

function CheckLevel()
    local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
    if OldWorld then
        if Lv == 1 or Lv <= 9 or SelectMonster == "Bandit [Lv. 5]" then -- Bandit
            Ms = "Bandit [Lv. 5]"
            NameQuest = "BanditQuest1"
            QuestLv = 1
            NameMon = "Bandit"
            CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
        elseif Lv == 10 or Lv <= 14 or SelectMonster == "Monkey [Lv. 14]" then -- Monkey
            Ms = "Monkey [Lv. 14]"
            NameQuest = "JungleQuest"
            QuestLv = 1
            NameMon = "Monkey"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
        elseif Lv == 15 or Lv <= 29 or SelectMonster == "Gorilla [Lv. 20]" then -- Gorilla
            Ms = "Gorilla [Lv. 20]"
            NameQuest = "JungleQuest"
            QuestLv = 2
            NameMon = "Gorilla"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
        elseif Lv == 30 or Lv <= 39 or SelectMonster == "Pirate [Lv. 35]" then -- Pirate
            Ms = "Pirate [Lv. 35]"
            NameQuest = "BuggyQuest1"
            QuestLv = 1
            NameMon = "Pirate"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
        elseif Lv == 40 or Lv <= 59 or SelectMonster == "Brute [Lv. 45]" then -- Brute
            Ms = "Brute [Lv. 45]"
            NameQuest = "BuggyQuest1"
            QuestLv = 2
            NameMon = "Brute"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
        elseif Lv == 60 or Lv <= 74 or SelectMonster == "Desert Bandit [Lv. 60]" then -- Desert Bandit
            Ms = "Desert Bandit [Lv. 60]"
            NameQuest = "DesertQuest"
            QuestLv = 1
            NameMon = "Desert Bandit"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
        elseif Lv == 75 or Lv <= 89 or SelectMonster == "Desert Officer [Lv. 70]" then -- Desert Officer
            Ms = "Desert Officer [Lv. 70]"
            NameQuest = "DesertQuest"
            QuestLv = 2
            NameMon = "Desert Officer"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
        elseif Lv == 90 or Lv <= 99 or SelectMonster == "Snow Bandit [Lv. 90]" then -- Snow Bandit
            Ms = "Snow Bandit [Lv. 90]"
            NameQuest = "SnowQuest"
            QuestLv = 1
            NameMon = "Snow Bandit"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
        elseif Lv == 100 or Lv <= 119 or SelectMonster == "Snowman [Lv. 100]" then -- Snowman
            Ms = "Snowman [Lv. 100]"
            NameQuest = "SnowQuest"
            QuestLv = 2
            NameMon = "Snowman"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
        elseif Lv == 120 or Lv <= 149 or SelectMonster == "Chief Petty Officer [Lv. 120]" then -- Chief Petty Officer
            Ms = "Chief Petty Officer [Lv. 120]"
            NameQuest = "MarineQuest2"
            QuestLv = 1
            NameMon = "Chief Petty Officer"
            CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
            CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
        elseif Lv == 150 or Lv <= 174 or SelectMonster == "Sky Bandit [Lv. 150]" then -- Sky Bandit
            Ms = "Sky Bandit [Lv. 150]"
            NameQuest = "SkyQuest"
            QuestLv = 1
            NameMon = "Sky Bandit"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
        elseif Lv == 175 or Lv <= 249 or SelectMonster == "Dark Master [Lv. 175]" then -- Dark Master
            Ms = "Dark Master [Lv. 175]"
            NameQuest = "SkyQuest"
            QuestLv = 2
            NameMon = "Dark Master"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
        elseif Lv == 250 or Lv <= 274 or SelectMonster == "Toga Warrior [Lv. 250]" then -- Toga Warrior
            Ms = "Toga Warrior [Lv. 250]"
            NameQuest = "ColosseumQuest"
            QuestLv = 1
            NameMon = "Toga Warrior"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
        elseif Lv == 275 or Lv <= 299 or SelectMonster == "Gladiator [Lv. 275]" then -- Gladiator
            Ms = "Gladiator [Lv. 275]"
            NameQuest = "ColosseumQuest"
            QuestLv = 2
            NameMon = "Gladiator"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
        elseif Lv == 300 or Lv <= 324 or SelectMonster == "Military Soldier [Lv. 300]" then -- Military Soldier
            Ms = "Military Soldier [Lv. 300]"
            NameQuest = "MagmaQuest"
            QuestLv = 1
            NameMon = "Military Soldier"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
        elseif Lv == 325 or Lv <= 374 or SelectMonster == "Military Spy [Lv. 325]" then -- Military Spy
            Ms = "Military Spy [Lv. 325]"
            NameQuest = "MagmaQuest"
            QuestLv = 2
            NameMon = "Military Spy"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5984.0532226563, 82.14656829834, 8753.326171875)
        elseif Lv == 375 or Lv <= 399 or SelectMonster == "Fishman Warrior [Lv. 375]" then -- Fishman Warrior 
            Ms = "Fishman Warrior [Lv. 375]"
            NameQuest = "FishmanQuest"
            QuestLv = 1
            NameMon = "Fishman Warrior"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			end
        elseif Lv == 400 or Lv <= 449 or SelectMonster == "Fishman Commando [Lv. 400]" then -- Fishman Commando
            Ms = "Fishman Commando [Lv. 400]"
            NameQuest = "FishmanQuest"
            QuestLv = 2
            NameMon = "Fishman Commando"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			end
        elseif Lv == 450 or Lv <= 474 or SelectMonster == "God's Guard [Lv. 450]" then -- God's Guard
            Ms = "God's Guard [Lv. 450]"
            NameQuest = "SkyExp1Quest"
            QuestLv = 1
            NameMon = "God's Guard"
            CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
            CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
			end
        elseif Lv == 475 or Lv <= 524 or SelectMonster == "Shanda [Lv. 475]" then -- Shanda
            Ms = "Shanda [Lv. 475]"
            NameQuest = "SkyExp1Quest"
            QuestLv = 2
            NameMon = "Shanda"
            CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
            CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
			end
        elseif Lv == 525 or Lv <= 549 or SelectMonster == "Royal Squad [Lv. 525]" then -- Royal Squad
            Ms = "Royal Squad [Lv. 525]"
            NameQuest = "SkyExp2Quest"
            QuestLv = 1
            NameMon = "Royal Squad"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
        elseif Lv == 550 or Lv <= 624 or SelectMonster == "Royal Soldier [Lv. 550]" then -- Royal Soldier
            Ms = "Royal Soldier [Lv. 550]"
            NameQuest = "SkyExp2Quest"
            QuestLv = 2
            NameMon = "Royal Soldier"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
        elseif Lv == 625 or Lv <= 649 or SelectMonster == "Galley Pirate [Lv. 625]" then -- Galley Pirate
            Ms = "Galley Pirate [Lv. 625]"
            NameQuest = "FountainQuest"
            QuestLv = 1
            NameMon = "Galley Pirate"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
        elseif Lv >= 650 or SelectMonster == "Galley Captain [Lv. 650]" then -- Galley Captain
            Ms = "Galley Captain [Lv. 650]"
            NameQuest = "FountainQuest"
            QuestLv = 2
            NameMon = "Galley Captain"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
        end
    end
    if NewWorld then
        if Lv == 700 or Lv <= 724 or SelectMonster == "Raider [Lv. 700]" then -- Raider
            Ms = "Raider [Lv. 700]"
            NameQuest = "Area1Quest"
            QuestLv = 1
            NameMon = "Raider"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
        elseif Lv == 725 or Lv <= 774 or SelectMonster == "Mercenary [Lv. 725]" then -- Mercenary
            Ms = "Mercenary [Lv. 725]"
            NameQuest = "Area1Quest"
            QuestLv = 2
            NameMon = "Mercenary"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
        elseif Lv == 775 or Lv <= 799 or SelectMonster == "Swan Pirate [Lv. 775]" then -- Swan Pirate
            Ms = "Swan Pirate [Lv. 775]"
            NameQuest = "Area2Quest"
            QuestLv = 1
            NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
        elseif Lv == 800 or Lv <= 874 or SelectMonster == "Factory Staff [Lv. 800]" then -- Factory Staff
            Ms = "Factory Staff [Lv. 800]"
            NameQuest = "Area2Quest"
            QuestLv = 2
            NameMon = "Factory Staff"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
        elseif Lv == 875 or Lv <= 899 or SelectMonster == "Marine Lieutenant [Lv. 875]" then -- Marine Lieutenant
            Ms = "Marine Lieutenant [Lv. 875]"
            NameQuest = "MarineQuest3"
            QuestLv = 1
            NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
        elseif Lv == 900 or Lv <= 949 or SelectMonster == "Marine Captain [Lv. 900]" then -- Marine Captain
            Ms = "Marine Captain [Lv. 900]"
            NameQuest = "MarineQuest3"
            QuestLv = 2
            NameMon = "Marine Captain"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
        elseif Lv == 950 or Lv <= 974 or SelectMonster == "Zombie [Lv. 950]" then -- Zombie
            Ms = "Zombie [Lv. 950]"
            NameQuest = "ZombieQuest"
            QuestLv = 1
            NameMon = "Zombie"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
        elseif Lv == 975 or Lv <= 999 or SelectMonster == "Vampire [Lv. 975]" then -- Vampire
            Ms = "Vampire [Lv. 975]"
            NameQuest = "ZombieQuest"
            QuestLv = 2
            NameMon = "Vampire"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
        elseif Lv == 1000 or Lv <= 1049 or SelectMonster == "Snow Trooper [Lv. 1000]" then -- Snow Trooper
            Ms = "Snow Trooper [Lv. 1000]"
            NameQuest = "SnowMountainQuest"
            QuestLv = 1
            NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
        elseif Lv == 1050 or Lv <= 1099 or SelectMonster == "Winter Warrior [Lv. 1050]" then -- Winter Warrior
            Ms = "Winter Warrior [Lv. 1050]"
            NameQuest = "SnowMountainQuest"
            QuestLv = 2
            NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
        elseif Lv == 1100 or Lv <= 1124 or SelectMonster == "Lab Subordinate [Lv. 1100]" then -- Lab Subordinate
            Ms = "Lab Subordinate [Lv. 1100]"
            NameQuest = "IceSideQuest"
            QuestLv = 1
            NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
        elseif Lv == 1125 or Lv <= 1174 or SelectMonster == "Horned Warrior [Lv. 1125]" then -- Horned Warrior
            Ms = "Horned Warrior [Lv. 1125]"
            NameQuest = "IceSideQuest"
            QuestLv = 2
            NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
        elseif Lv == 1175 or Lv <= 1199 or SelectMonster == "Magma Ninja [Lv. 1175]" then -- Magma Ninja
            Ms = "Magma Ninja [Lv. 1175]"
            NameQuest = "FireSideQuest"
            QuestLv = 1
            NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
        elseif Lv == 1200 or Lv <= 1249 or SelectMonster == "Lava Pirate [Lv. 1200]" then -- Lava Pirate
            Ms = "Lava Pirate [Lv. 1200]"
            NameQuest = "FireSideQuest"
            QuestLv = 2
            NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
        elseif Lv == 1250 or Lv <= 1274 or SelectMonster == "Ship Deckhand [Lv. 1250]" then -- Ship Deckhand
            Ms = "Ship Deckhand [Lv. 1250]"
            NameQuest = "ShipQuest1"
            QuestLv = 1
            NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1275 or Lv <= 1299 or SelectMonster == "Ship Engineer [Lv. 1275]" then -- Ship Engineer
            Ms = "Ship Engineer [Lv. 1275]"
            NameQuest = "ShipQuest1"
            QuestLv = 2
            NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1300 or Lv <= 1324 or SelectMonster == "Ship Steward [Lv. 1300]" then -- Ship Steward
            Ms = "Ship Steward [Lv. 1300]"
            NameQuest = "ShipQuest2"
            QuestLv = 1
            NameMon = "Ship Steward"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1325 or Lv <= 1349 or SelectMonster == "Ship Officer [Lv. 1325]" then -- Ship Officer
            Ms = "Ship Officer [Lv. 1325]"
            NameQuest = "ShipQuest2"
            QuestLv = 2
            NameMon = "Ship Officer"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
        elseif Lv == 1350 or Lv <= 1374 or SelectMonster == "Arctic Warrior [Lv. 1350]" then -- Arctic Warrior
            Ms = "Arctic Warrior [Lv. 1350]"
            NameQuest = "FrostQuest"
            QuestLv = 1
            NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
			if Auto_Farm and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
			end
        elseif Lv == 1375 or Lv <= 1424 or SelectMonster == "Snow Lurker [Lv. 1375]" then -- Snow Lurker
            Ms = "Snow Lurker [Lv. 1375]"
            NameQuest = "FrostQuest"
            QuestLv = 2
            NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
        elseif Lv == 1425 or Lv <= 1449 or SelectMonster == "Sea Soldier [Lv. 1425]" then -- Sea Soldier
            Ms = "Sea Soldier [Lv. 1425]"
            NameQuest = "ForgottenQuest"
            QuestLv = 1
            NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
        elseif Lv >= 1450 or SelectMonster == "Water Fighter [Lv. 1450]" then -- Water Fighter
            Ms = "Water Fighter [Lv. 1450]"
            NameQuest = "ForgottenQuest"
            QuestLv = 2
            NameMon = "Water Fighter"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
		end
	end
	if ThreeWorld then
		if Lv == 1500 or Lv <= 1524 or SelectMonster == "Pirate Millionaire [Lv. 1500]" then -- Pirate Millionaire
			Ms = "Pirate Millionaire [Lv. 1500]"
			NameQuest = "PiratePortQuest"
			QuestLv = 1
			NameMon = "Pirate Millionaire"
			CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
			CFrameMon = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
		elseif Lv == 1525 or Lv <= 1574 or SelectMonster == "Pistol Billionaire [Lv. 1525]" then -- Pistol Billoonaire
			Ms = "Pistol Billionaire [Lv. 1525]"
			NameQuest = "PiratePortQuest"
			QuestLv = 2
			NameMon = "Pistol Billionaire"
			CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
			CFrameMon = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
		elseif Lv == 1575 or Lv <= 1599 or SelectMonster == "Dragon Crew Warrior [Lv. 1575]" then -- Dragon Crew Warrior
			Ms = "Dragon Crew Warrior [Lv. 1575]"
			NameQuest = "AmazonQuest"
			QuestLv = 1
			NameMon = "Dragon Crew Warrior"
			CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
			CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
		elseif Lv == 1600 or Lv <= 1624 or SelectMonster == "Dragon Crew Archer [Lv. 1600]" then -- Dragon Crew Archer
			Ms = "Dragon Crew Archer [Lv. 1600]"
			NameQuest = "AmazonQuest"
			QuestLv = 2
			NameMon = "Dragon Crew Archer"
			CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
			CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
		elseif Lv == 1625 or Lv <= 1649 or SelectMonster == "Female Islander [Lv. 1625]" then -- Female Islander
			Ms = "Female Islander [Lv. 1625]"
			NameQuest = "AmazonQuest2"
			QuestLv = 1
			NameMon = "Female Islander"
			CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
			CFrameMon = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
		elseif Lv == 1650 or Lv <= 1699 or SelectMonster == "Giant Islander [Lv. 1650]" then -- Giant Islander
			Ms = "Giant Islander [Lv. 1650]"
			NameQuest = "AmazonQuest2"
			QuestLv = 2
			NameMon = "Giant Islander"
			CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
			CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
		elseif Lv == 1700 or Lv <= 1724 or SelectMonster == "Marine Commodore [Lv. 1700]" then -- Marine Commodore
			Ms = "Marine Commodore [Lv. 1700]"
			NameQuest = "MarineTreeIsland"
			QuestLv = 1
			NameMon = "Marine Commodore"
			CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
			CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
		elseif Lv == 1725 or Lv <= 1774 or SelectMonster == "Marine Rear Admiral [Lv. 1725]" then -- Marine Rear Admiral
			Ms = "Marine Rear Admiral [Lv. 1725]"
			NameQuest = "MarineTreeIsland"
			QuestLv = 2
			NameMon = "Marine Rear Admiral"
			CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
			CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
		elseif Lv == 1775 or Lv <= 1799 or SelectMonster == "Fishman Raider [Lv. 1775]" then -- Fishman Raide
			Ms = "Fishman Raider [Lv. 1775]"
			NameQuest = "DeepForestIsland3"
			QuestLv = 1
			NameMon = "Fishman Raider"
			CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
			CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
		elseif Lv == 1800 or Lv <= 1824 or SelectMonster == "Fishman Captain [Lv. 1800]" then -- Fishman Captain
			Ms = "Fishman Captain [Lv. 1800]"
			NameQuest = "DeepForestIsland3"
			QuestLv = 2
			NameMon = "Fishman Captain"
			CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
			CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
		elseif Lv == 1825 or Lv <= 1849 or SelectMonster == "Forest Pirate [Lv. 1825]" then -- Forest Pirate
			Ms = "Forest Pirate [Lv. 1825]"
			NameQuest = "DeepForestIsland"
			QuestLv = 1
			NameMon = "Forest Pirate"
			CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
			CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
		elseif Lv == 1850 or Lv <= 1899 or SelectMonster == "Mythological Pirate [Lv. 1850]" then -- Mythological Pirate
			Ms = "Mythological Pirate [Lv. 1850]"
			NameQuest = "DeepForestIsland"
			QuestLv = 2
			NameMon = "Mythological Pirate"
			CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
			CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
		elseif Lv == 1900 or Lv <= 1924 or SelectMonster == "Jungle Pirate [Lv. 1900]" then -- Jungle Pirate
			Ms = "Jungle Pirate [Lv. 1900]"
			NameQuest = "DeepForestIsland2"
			QuestLv = 1
			NameMon = "Jungle Pirate"
			CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
			CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
		elseif Lv == 1925 or Lv <= 1974 or SelectMonster == "Musketeer Pirate [Lv. 1925]" then -- Musketeer Pirate
			Ms = "Musketeer Pirate [Lv. 1925]"
			NameQuest = "DeepForestIsland2"
			QuestLv = 2
			NameMon = "Musketeer Pirate"
			CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
			CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
		elseif Lv == 1975 or Lv <= 1999 or SelectMonster == "Reborn Skeleton [Lv. 1975]" then
			Ms = "Reborn Skeleton [Lv. 1975]"
			NameQuest = "HauntedQuest1"
			QuestLv = 1
			NameMon = "Reborn Skeleton"
			CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
			CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -1.3950732e-05, -0.208259016, -1.08073925e-06, 1, -7.20630269e-05, 0.208259016, 7.07080399e-05, 0.978073597)
		elseif Lv == 2000 or Lv <= 2024 or SelectMonster == "Living Zombie [Lv. 2000]" then
			Ms = "Living Zombie [Lv. 2000]"
			NameQuest = "HauntedQuest1"
			QuestLv = 2
			NameMon = "Living Zombie"
			CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 4.52954225e-08, -0.999978542, 2.04920472e-08, 1, 4.51620679e-08, 0.999978542, -2.01955679e-08, -0.00655503059)
			CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 2.77547141e-08, 0.0324240364, -2.58006327e-08, 1, -6.06848474e-08, -0.0324240364, 5.98163865e-08, 0.999474227)
		elseif Lv == 2025 or Lv <= 2049 or SelectMonster == "Demonic Soul [Lv. 2025]" then
			Ms = "Demonic Soul [Lv. 2025]"
			NameQuest = "HauntedQuest2"
			QuestLv = 1
			NameMon = "Demonic Soul"
			CFrameQ = CFrame.new(-9515.39551, 172.266037, 6078.89746, 0.0121199936, -9.78649624e-08, 0.999926567, 2.30358754e-08, 1, 9.75929382e-08, -0.999926567, 2.18513581e-08, 0.0121199936)
			CFrameMon = CFrame.new(-9709.30762, 204.695892, 6044.04688, -0.845798075, -3.4587876e-07, -0.533503294, -4.46235369e-08, 1, -5.77571257e-07, 0.533503294, -4.64701827e-07, -0.845798075)
		elseif Lv >= 2050 or SelectMonster == "Posessed Mummy [Lv. 2050]" then
			Ms = "Posessed Mummy [Lv. 2050]"
			NameQuest = "HauntedQuest2"
			QuestLv = 2
			NameMon = "Posessed Mummy"
			CFrameQ = CFrame.new(-9515.39551, 172.266037, 6078.89746, 0.0121199936, -9.78649624e-08, 0.999926567, 2.30358754e-08, 1, 9.75929382e-08, -0.999926567, 2.18513581e-08, 0.0121199936)
			CFrameMon = CFrame.new(-9554.11035, 65.6141663, 6041.73584, -0.877069294, 5.33355795e-08, -0.480364174, 2.06420765e-08, 1, 7.33423562e-08, 0.480364174, 5.44105987e-08, -0.877069294)
		end
	end
end

spawn(function()
	game:GetService("RunService").Heartbeat:connect(function()
		if Auto_Farm or AutoNew then
			for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
				if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
					v.Humanoid:ChangeState(11)
				end
			end
		end
	end)
end)

function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end

spawn(function()
    while wait(1) do
        if _G.SetSpawn then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        end
    end
end)

spawn(function()
    while wait(.1) do
        if Auto_Farm then
            CheckLevel()
            autofarm()
        end
    end
end)

spawn(function()
    while wait(.1) do
        if AutoNew then
            CheckLevel()
            autoNew()
        end
    end
end)

CFrame_ = 1
spawn(function()
	while wait() do
        if CFrame_ == 1 then
		    CFrame_x = CFrame.new(0, 40, 5)
        elseif CFrame_ == 2 then
            CFrame_x = CFrame.new(-5, 40, 0)
        elseif CFrame_ == 3 then
		    CFrame_x = CFrame.new(0, 40, -5)
        elseif CFrame_ == 4 then
            CFrame_x = CFrame.new(5, 40, 0)
        end
	end
end)

spawn(function()
	while wait() do
		CFrame_ = 1
        wait(.1)
        CFrame_ = 2
        wait(.1)
        CFrame_ = 3
        wait(.1)
        CFrame_ = 4
        wait(.1)
	end
end)

function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end

function autofarm()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
        MagnetActive = false
        FTAK_1x = false
        CheckLevel()
        TP(CFrameQ)
        if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
            wait(1.1)
            if (CFrameQ.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                local string_1 = "StartQuest";
                local string_2 = NameQuest;
                local string_3 = QuestLv;
                local CommF_ = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                CommF_:InvokeServer(string_1, string_2, string_3);
            end
        end
    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
        pcall(function()
            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                for _,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        repeat game:GetService('RunService').Heartbeat:wait()
                            if game:GetService("Workspace").Enemies:GetChildren(Ms) then
                                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                    EquipWeapon(SelectToolWeapon)
                                    TP(CFrameMon*CFrame_x)
                                    CFrameMon = v.HumanoidRootPart.CFrame
                                    v.HumanoidRootPart.CanCollide = false
                                    MagnetActive = true
                                    if SF015 == false then
                                        TP(CFrameMon*CFrame_x)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                    elseif SF015 == true then
                                       TP(CFrameMon*CFrame_x)
                                       FTAK_1x = true
                                    end
                                    if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                        v.Head.Anchored = true or false
                                    else
                                        v.Head.Anchored = false or true
                                    end
                                else
                                    MagnetActive = false    
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                end
                            else
                                FTAK_1x = false
                                MagnetActive = false
                                CheckLevel()
                            end
                        until not v.Parent or v.Humanoid.Health <= 0 or Auto_Farm == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:GetChildren(v.Name)
                    end
                end
            else
                FTAK_1x = false
                MagnetActive = false
                CheckLevel()
            end
        end)
    end
end

function autoNew() 
    if game.Players.LocalPlayer.Data.Level.Value >= 700 then
        Auto_Farm = false
        if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
            EquipWeapon("Key")
            TP(CFrame.new(1347.7124, 37.3751602, -1325.6488))
            wait(1)
            FTAK_1x = false
        elseif game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
            if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == "Ice Admiral [Lv. 700] [Boss]" and v.Humanoid.Health > 0 then
                        repeat game:GetService("RunService").Heartbeat:wait()
                            pcall(function()
                                EquipWeapon(SelectToolWeapon)
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Anchored = true
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                FTAK_1x = true
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                            end)
                        until v.Humanoid.Health <= 0 or not v.Parent
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                    end
                end
            else
                FTAK_1x = false
                TP(CFrame.new(1347.7124, 37.3751602, -1325.6488))
            end
        else
            FTAK_1x = false
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        end
    end
end

spawn(function()
    while wait(1) do
        if AutoHaki then
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end
    end
end)

spawn(function()
    while wait() do
        if AutoReMob then
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                v.Head.Anchored = false
                v.HumanoidRootPart.Anchored = false
            end
        end
    end
end)

spawn(function()
    game:GetService("RunService").Heartbeat:connect(function()
        pcall(function()
            for _,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if _G.Magnet and MagnetActive then
                    if v.Name == Ms and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        if (v.HumanoidRootPart.Position - CFrameMon.Position).Magnitude <= 325 then
                            pcall(function()
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(100, 100, 100)
                                v.HumanoidRootPart.CFrame = CFrameMon
                                if v.Humanoid:FindFirstChild("Animator") and not MagnetActive == false then
                                    sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 99999999999999999999)
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    v.Humanoid.Animator:Destroy()
                                end
                            end)
                        end
                    end
                end
            end
        end)
    end)
end)

local ComOldx = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local COM = getupvalues(ComOldx)[2]
local CSR = require(game.ReplicatedStorage.Util.CameraShaker)
CSR:Stop()

spawn(function()
    repeat wait()
    while game:GetService("RunService").Stepped:wait() do
        for v = 1,2,5 do
            pcall(function()
                if game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("CombatFramework") and SF015 then
                    pcall(function()
                        COM.activeController.increment = 3
                        COM.activeController.timeToNextBlock = tick()
                        COM.activeController.hitboxMagnitude = 60
                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
                            COM.activeController.timeToNextAttack = 5
                        else
                            COM.activeController.timeToNextAttack = tick()
                        end
                        COM.anims = false
                        COM.activeController.blocking = false
                        COM.activeController.attacking = false
                    end)
                    if not FTAK_1x == false then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 75 then
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):ClickButton1(Vector2.new(1280, 670))
                            end
                        end
                    end
                elseif SF015 == false and FTAK_1x == true then
                    FTAK_1x = false  
                end
            end)
        end
    end
    until game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("CombatFramework")
end)

spawn(function()
	pcall(function()
		while wait(.5) do
			if Superhuman then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") then
					local args = {
						[1] = "BuyBlackLeg"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
				if game.Players.LocalPlayer.Character:FindFirstChild("Combat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
						SelectToolWeapon = "Combat"
						SelectToolWeaponOld = "Combat"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") then
						SelectToolWeapon = "Black Leg"
						SelectToolWeaponOld = "Black Leg"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") then
						SelectToolWeapon = "Electro"
						SelectToolWeaponOld = "Electro"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") then
						SelectToolWeapon = "Fishman Karate"
						SelectToolWeaponOld = "Fishman Karate"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") then
						SelectToolWeapon = "Dragon Claw"
						SelectToolWeaponOld = "Dragon Claw"
					end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Superhuman") then
						SelectToolWeapon = "Superhuman"
						SelectToolWeaponOld = "Superhuman"
					end
					if (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300) then
						local args = {
							[1] = "BuyElectro"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
					if (game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300) then
						local args = {
							[1] = "BuyFishmanKarate"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
				end
			end
		end
	end)
end)

spawn(function()
	while wait() do
		if melee then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", SelectPoint)
		end
	end
end)

spawn(function()
	while wait() do
		if def then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", SelectPoint)
		end
	end
end)

spawn(function()
	while wait() do
		if sword then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword", SelectPoint)
		end
	end
end)

spawn(function()
	while wait() do
		if gun then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun", SelectPoint)
		end
	end
end)

spawn(function()
	while wait() do
		if DevilFruit then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", SelectPoint)
		end
	end
end)

spawn(function()
	while game:GetService('RunService').Heartbeat:wait() do
		if _G.AutoStat then
            if game.Players.LocalPlayer.Data.Stats.Melee.Level.Value ~= 2300 then
                repeat game:GetService("RunService").Heartbeat:wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1)
                until game.Players.LocalPlayer.Data.Stats.Melee.Level.Value == 2300
            elseif game.Players.LocalPlayer.Data.Stats.Defense.Level.Value ~= 2300 then
                repeat game:GetService("RunService").Heartbeat:wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", 1)
                until game.Players.LocalPlayer.Data.Stats.Defense.Level.Value == 2300
			end
		end
	end
end)

spawn(function()
    pcall(function()
        while task.wait() do
            if Auto_Farm then
                if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local BodyV = Instance.new("BodyVelocity")
                    BodyV.Name = "BodyClip"
                    BodyV.Parent = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or false
                    BodyV.MaxForce = Vector3.new(100000, 100000, 100000)
                    BodyV.Velocity = Vector3.new(0, 0, 0)
                end
            else
                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
            end
        end
    end)
end)

game:GetService("RunService").Stepped:Connect(function()
    if Auto_Farm then
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false    
            end
        end
    else
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = true 
            end
        end
    end
end)

spawn(function()
    while wait(.5) do 
        if autobuya then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
        end
    end
end)

spawn(function()
    pcall(function()
        while wait(.1) do
            if RedeemCode2exp then
                function UseCode(Text)
                    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
                    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
                end
                UseCode("Starcodeheo")
                UseCode("Magicbus")
                UseCode("Enyu_is_Pro")
                UseCode("Sub2Fer999")
                UseCode("Bluxxy")
                UseCode("JCWK")
                UseCode("3BVISITS")
                UseCode("UPD16")
                UseCode("SUB2GAMERROBOT_EXP1")
                UseCode("StrawHatMaine")
                UseCode("Sub2OfficialNoobie")
                UseCode("THEGREATACE")
                UseCode("TantaiGaming")
                UseCode("Axiore")
                UseCode("SUB2NOOBMASTER123")
                UseCode("Sub2Daigrock")
            end
        end
    end)
end)

if _G.BoostFPS then
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
end

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
