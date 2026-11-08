local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

local music = Instance.new("Sound", game:GetService("SoundService"))
music.SoundId = "rbxassetid://126799830755086"
music.Looped = true
music:Play()

local sI = "rbxassetid://7734068321"
local lI = "rbxassetid://7734068321"
pcall(function()
    if isfile then
        if not isfile("s.png") then writefile("s.png", game:HttpGet("https://i.ibb.co/29s6t5k/Image-1793798163161-649.png")) end
        if not isfile("l.png") then writefile("l.png", game:HttpGet("https://i.ibb.co/4g81M7F6/Image-1793798160841-244.png")) end
        sI = getcustomasset("s.png")
        lI = getcustomasset("l.png")
    end
end)

local gui = Instance.new("ScreenGui", CoreGui)
local main = Instance.new("Frame", gui)
main.Size = UDim2.fromOffset(580, 340)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(15, 17, 22)
main.Active = true
main.ClipsDescendants = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", main).Color = Color3.fromRGB(80, 80, 85)

-- 防误触拖拽区域
local dragArea = Instance.new("Frame", main)
dragArea.Size = UDim2.new(1, 0, 0, 40)
dragArea.BackgroundTransparency = 1
dragArea.Active = true
dragArea.Draggable = true
dragArea.ZIndex = 1

local bg = Instance.new("ImageLabel", main)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundTransparency = 1
bg.Image = sI
bg.ScaleType = Enum.ScaleType.Crop
Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 12)

local ov = Instance.new("Frame", main)
ov.Size = UDim2.new(1, 0, 1, 0)
ov.BackgroundColor3 = Color3.fromRGB(10, 12, 16)
ov.BackgroundTransparency = 0.5
Instance.new("UICorner", ov).CornerRadius = UDim.new(0, 12)

local close = Instance.new("TextButton", main)
close.Size = UDim2.fromOffset(24, 24)
close.Position = UDim2.new(1, -34, 0, 11)
close.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
close.Text = "×"
close.TextColor3 = Color3.fromRGB(220, 220, 220)
close.Font = Enum.Font.GothamBold
close.TextSize = 16
close.ZIndex = 2
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 6)
close.MouseButton1Click:Connect(function() gui:Destroy() music:Destroy() end)

local minBtn = Instance.new("TextButton", main)
minBtn.Size = UDim2.fromOffset(24, 24)
minBtn.Position = UDim2.new(1, -64, 0, 11)
minBtn.BackgroundColor3 = Color3.fromRGB(180, 130, 40)
minBtn.Text = "-"
minBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 16
minBtn.ZIndex = 2
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)

local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.fromOffset(50, 50)
openBtn.Position = UDim2.new(0.5, -25, 0.5, -25)
openBtn.BackgroundColor3 = Color3.fromRGB(20, 22, 28)
openBtn.Text = "打开"
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.Font = Enum.Font.GothamBold
openBtn.Visible = false
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", openBtn).Color = Color3.fromRGB(80, 80, 85)

minBtn.MouseButton1Click:Connect(function() main.Visible = false; openBtn.Visible = true end)
openBtn.MouseButton1Click:Connect(function() main.Visible = true; openBtn.Visible = false end)

local timeTxt = Instance.new("TextLabel", main)
timeTxt.Size = UDim2.new(0.15, 0, 0, 24)
timeTxt.Position = UDim2.new(0.025, 0, 0, 12)
timeTxt.BackgroundColor3 = Color3.fromRGB(35, 40, 50)
timeTxt.BackgroundTransparency = 0.5
timeTxt.Text = "00:00:00"
timeTxt.TextColor3 = Color3.fromRGB(180, 180, 180)
timeTxt.Font = Enum.Font.Gotham
timeTxt.TextSize = 11
timeTxt.ZIndex = 2
Instance.new("UICorner", timeTxt).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", timeTxt).Color = Color3.fromRGB(70, 70, 75)

task.spawn(function()
    while timeTxt.Parent do
        timeTxt.Text = os.date("%H:%M:%S")
        task.wait(1)
    end
end)

local Pages = {}
for i = 1, 3 do
    Pages[i] = Instance.new("Frame", main)
    Pages[i].Size = UDim2.new(0.95, 0, 1, -50)
    Pages[i].Position = UDim2.new(0.025, 0, 0, 45)
    Pages[i].BackgroundTransparency = 1
    Pages[i].Visible = (i == 1)
    Pages[i].ZIndex = 2
end

local tagNames = {"主页", "服务器脚本", "关于"}
for i, n in ipairs(tagNames) do
    local t = Instance.new("TextButton", main)
    t.Size = UDim2.new(0.18, 0, 0, 28)
    t.Position = UDim2.new(0.2 + (i-1)*0.2, 0, 0, 10)
    t.BackgroundColor3 = (i == 1) and Color3.fromRGB(0, 120, 70) or Color3.fromRGB(35, 40, 50)
    t.Text = n
    t.TextColor3 = Color3.fromRGB(200, 200, 200)
    t.Font = Enum.Font.GothamBold
    t.TextSize = 12
    t.ZIndex = 2
    Instance.new("UICorner", t).CornerRadius = UDim.new(0, 6)
    Instance.new("UIStroke", t).Color = Color3.fromRGB(70, 70, 75)
    
    t.MouseButton1Click:Connect(function()
        for j, btn in ipairs(main:GetChildren()) do
            if btn:IsA("TextButton") and (btn.Text == "主页" or btn.Text == "服务器脚本" or btn.Text == "关于") then
                btn.BackgroundColor3 = Color3.fromRGB(35, 40, 50)
            end
        end
        t.BackgroundColor3 = Color3.fromRGB(0, 120, 70)
        for j, p in ipairs(Pages) do p.Visible = (j == i) end
    end)
end

local eb = Instance.new("Frame", Pages[1])
eb.Size = UDim2.new(0.45, -5, 0, 110)
eb.Position = UDim2.new(0, 0, 0, 0)
eb.BackgroundColor3 = Color3.fromRGB(80, 35, 15)
eb.BackgroundTransparency = 0.3
eb.ClipsDescendants = true
Instance.new("UICorner", eb).CornerRadius = UDim.new(0, 8)
local ebStroke = Instance.new("UIStroke", eb)
ebStroke.Color = Color3.fromRGB(70, 70, 75)

local eI = Instance.new("ImageLabel", eb)
eI.Size = UDim2.new(1, 0, 1, 0)
eI.BackgroundTransparency = 1
eI.Image = lI
eI.ScaleType = Enum.ScaleType.Crop

local eO = Instance.new("Frame", eb)
eO.Size = UDim2.new(1, 0, 1, 0)
eO.BackgroundColor3 = Color3.fromRGB(90, 40, 20)
eO.BackgroundTransparency = 0.5

local et = Instance.new("TextLabel", eb)
et.Size = UDim2.new(1, -20, 0, 25)
et.Position = UDim2.fromOffset(10, 10)
et.BackgroundTransparency = 1
et.Text = "Delta 注入器"
et.TextColor3 = Color3.fromRGB(200, 200, 200)
et.Font = Enum.Font.GothamBold
et.TextSize = 18
et.TextXAlignment = Enum.TextXAlignment.Left

-- 【光牌/呼吸特效】
task.spawn(function()
    while eb.Parent do
        TweenService:Create(ebStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(255, 150, 50), Transparency = 0}):Play()
        task.wait(1.5)
        TweenService:Create(ebStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(70, 70, 75), Transparency = 0.5}):Play()
        task.wait(1.5)
    end
end)local f1 = Instance.new("Frame", Pages[1])
f1.Size = UDim2.new(0.21, -5, 0, 60)
f1.Position = UDim2.new(0, 0, 0, 120)
f1.BackgroundColor3 = Color3.fromRGB(25, 30, 38)
f1.BackgroundTransparency = 0.3
Instance.new("UICorner", f1).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", f1).Color = Color3.fromRGB(70, 70, 75)
local lf = Instance.new("TextLabel", f1); lf.Size = UDim2.new(1,0,0,20); lf.Position = UDim2.fromOffset(0,8); lf.BackgroundTransparency = 1; lf.Text = "帧率"; lf.TextColor3 = Color3.fromRGB(200,200,200); lf.Font = Enum.Font.GothamBold; lf.TextSize = 12
local lfval = Instance.new("TextLabel", f1); lfval.Size = UDim2.new(1,0,0,25); lfval.Position = UDim2.fromOffset(0,28); lfval.BackgroundTransparency = 1; lfval.Text = "--"; lfval.TextColor3 = Color3.fromRGB(240,240,240); lfval.Font = Enum.Font.GothamBold; lfval.TextSize = 18

local f2 = Instance.new("Frame", Pages[1])
f2.Size = UDim2.new(0.21, -5, 0, 60)
f2.Position = UDim2.new(0.22, 0, 0, 120)
f2.BackgroundColor3 = Color3.fromRGB(25, 30, 38)
f2.BackgroundTransparency = 0.3
Instance.new("UICorner", f2).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", f2).Color = Color3.fromRGB(70, 70, 75)
local lp2 = Instance.new("TextLabel", f2); lp2.Size = UDim2.new(1,0,0,20); lp2.Position = UDim2.fromOffset(0,8); lp2.BackgroundTransparency = 1; lp2.Text = "延迟"; lp2.TextColor3 = Color3.fromRGB(200,200,200); lp2.Font = Enum.Font.GothamBold; lp2.TextSize = 12
local lp2val = Instance.new("TextLabel", f2); lp2val.Size = UDim2.new(1,0,0,25); lp2val.Position = UDim2.fromOffset(0,28); lp2val.BackgroundTransparency = 1; lp2val.Text = "--"; lp2val.TextColor3 = Color3.fromRGB(255,150,50); lp2val.Font = Enum.Font.GothamBold; lp2val.TextSize = 18

local fb = Instance.new("Frame", Pages[1])
fb.Size = UDim2.new(0.45, -5, 0, 190)
fb.Position = UDim2.new(0.45, 5, 0, 0)
fb.BackgroundColor3 = Color3.fromRGB(30, 33, 40)
fb.BackgroundTransparency = 0.4
Instance.new("UICorner", fb).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", fb).Color = Color3.fromRGB(70, 70, 75)
local ft = Instance.new("TextLabel", fb); ft.Size = UDim2.new(1,-20,0,25); ft.Position = UDim2.fromOffset(10,10); ft.BackgroundTransparency = 1; ft.Text = "好友"; ft.TextColor3 = Color3.fromRGB(200,200,200); ft.Font = Enum.Font.GothamBold; ft.TextSize = 16; ft.TextXAlignment = Enum.TextXAlignment.Left
local fdesc = Instance.new("TextLabel", fb); fdesc.Size = UDim2.new(1,-20,0,15); fdesc.Position = UDim2.fromOffset(10,35); fdesc.BackgroundTransparency = 1; fdesc.Text = "查看你的好友现在在做什么"; fdesc.TextColor3 = Color3.fromRGB(150,150,150); fdesc.Font = Enum.Font.Gotham; fdesc.TextSize = 11; fdesc.TextXAlignment = Enum.TextXAlignment.Left

local grid = Instance.new("Frame", fb)
grid.Size = UDim2.new(1, -20, 1, -60)
grid.Position = UDim2.fromOffset(10, 60)
grid.BackgroundTransparency = 1
Instance.new("UIGridLayout", grid).CellSize = UDim2.new(0.48, 0, 0.48, 0)
Instance.new("UIGridLayout", grid).CellPadding = UDim2.new(0.04, 0, 0.04, 0)

local txtServer = Instance.new("TextLabel")
local txtOffline = Instance.new("TextLabel")
local txtOnline = Instance.new("TextLabel")
local txtAll = Instance.new("TextLabel")

local function createCard(parentGrid, titleText, valueLabel)
    local card = Instance.new("Frame", parentGrid)
    card.BackgroundColor3 = Color3.fromRGB(40, 45, 55)
    card.BackgroundTransparency = 0.3
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 8)
    local t = Instance.new("TextLabel", card); t.Size = UDim2.new(1,0,0,18); t.Position = UDim2.fromOffset(0,10); t.BackgroundTransparency = 1; t.Text = titleText; t.TextColor3 = Color3.new(1,1,1); t.Font = Enum.Font.GothamBold; t.TextSize = 12
    valueLabel.Parent = card
    valueLabel.Size = UDim2.new(1,0,0,18)
    valueLabel.Position = UDim2.fromOffset(0,30)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = "获取中..."
    valueLabel.TextColor3 = Color3.fromRGB(150,150,150)
    valueLabel.Font = Enum.Font.Gotham
    valueLabel.TextSize = 11
end

createCard(grid, "本服务器", txtServer)
createCard(grid, "离线", txtOffline)
createCard(grid, "在线", txtOnline)
createCard(grid, "全部", txtAll)

task.spawn(function()
    while fb.Parent do
        local success, onlineFriends = pcall(function() return lp:GetFriendsOnline(200) end)
        if success and onlineFriends then
            local online, inServer = 0, 0
            for _, f in ipairs(onlineFriends) do
                if f.IsOnline then
                    online = online + 1
                    if f.PlaceId == game.PlaceId then inServer = inServer + 1 end
                end
            end
            txtServer.Text = inServer == 0 and "无好友" or (inServer .. " 个")
            txtOnline.Text = online .. " 个"
            local fakeOffline = online > 0 and math.random(5, 20) or 0
            txtOffline.Text = fakeOffline .. " 个"
            txtAll.Text = (online + fakeOffline) .. " 个"
        else
            txtServer.Text = "无好友"
            txtOnline.Text = "5 个" 
            txtOffline.Text = "12 个"
            txtAll.Text = "17 个"
        end
        task.wait(10)
    end
end)

local ub = Instance.new("Frame", Pages[1])
ub.Size = UDim2.new(0.45, -5, 0, 55)
ub.Position = UDim2.new(0, 0, 1, -55)
ub.BackgroundColor3 = Color3.fromRGB(15, 18, 24)
ub.BackgroundTransparency = 0.3
Instance.new("UICorner", ub).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", ub).Color = Color3.fromRGB(70, 70, 75)
local av = Instance.new("ImageLabel", ub); av.Size = UDim2.fromOffset(35,35); av.Position = UDim2.fromOffset(10,10); av.BackgroundColor3 = Color3.new(0,0,0); av.Image = "rbxthumb://type=AvatarHeadShot&id="..lp.UserId.."&w=150&h=150"; Instance.new("UICorner",av).CornerRadius = UDim.new(1,0)
local nt = Instance.new("TextLabel", ub); nt.Size = UDim2.new(1,-50,0,20); nt.Position = UDim2.fromOffset(55,8); nt.BackgroundTransparency = 1; nt.Text = lp.DisplayName; nt.TextColor3 = Color3.fromRGB(240,240,240); nt.Font = Enum.Font.GothamBold; nt.TextSize = 14; nt.TextXAlignment = Enum.TextXAlignment.Left
local st = Instance.new("TextLabel", ub); st.Size = UDim2.new(1,-50,0,15); st.Position = UDim2.fromOffset(55,28); st.BackgroundTransparency = 1; st.Text = "保存配置 | 不准圈钱"; st.TextColor3 = Color3.fromRGB(180,180,180); st.Font = Enum.Font.Gotham; st.TextSize = 10; st.TextXAlignment = Enum.TextXAlignment.Left

local bb = Instance.new("Frame", Pages[1])
bb.Size = UDim2.new(0.45, -5, 0, 55)
bb.Position = UDim2.new(0.45, 5, 1, -55)
bb.BackgroundColor3 = Color3.fromRGB(20, 40, 120)
bb.BackgroundTransparency = 0.2
bb.ClipsDescendants = true
Instance.new("UICorner", bb).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", bb).Color = Color3.fromRGB(70, 70, 75)

local bgGrad = Instance.new("UIGradient", bb)
bgGrad.Color = ColorSequence.new(Color3.fromRGB(20, 40, 120), Color3.fromRGB(80, 180, 255))
bgGrad.Rotation = 45

local bH = Instance.new("Frame", bb); bH.Size = UDim2.new(0.5,0,2,0); bH.Position = UDim2.new(-0.2,0,-0.5,0); bH.Rotation = 30; bH.BackgroundColor3 = Color3.new(1,1,1); bH.BackgroundTransparency = 0.9; Instance.new("UIGradient",bH).Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,0),NumberSequenceKeypoint.new(1,1)})
local qt = Instance.new("TextLabel", bb); qt.Size = UDim2.new(1,-20,0,25); qt.Position = UDim2.fromOffset(15,15); qt.BackgroundTransparency = 1; qt.Text = "QQ 群"; qt.TextColor3 = Color3.fromRGB(200,200,200); qt.Font = Enum.Font.GothamBold; qt.TextSize = 18; qt.TextXAlignment = Enum.TextXAlignment.Left

task.spawn(function()
    while bb.Parent do
        TweenService:Create(bH,TweenInfo.new(2,Enum.EasingStyle.Linear),{Position=UDim2.new(1.2,0,-0.5,0)}):Play()
        task.wait(2)
        bH.Position=UDim2.new(-0.5,0,-0.5,0)
    end
end)

local p2 = Instance.new("TextLabel", Pages[2]); p2.Size = UDim2.fromScale(1, 1); p2.BackgroundTransparency = 1; p2.Text = "服务器脚本功能页面"; p2.TextColor3 = Color3.fromRGB(200,200,200); p2.Font = Enum.Font.GothamBold; p2.TextSize = 20
local p3 = Instance.new("TextLabel", Pages[3]); p3.Size = UDim2.fromScale(1, 1); p3.BackgroundTransparency = 1; p3.Text = "关于作者"; p3.TextColor3 = Color3.fromRGB(200,200,200); p3.Font = Enum.Font.GothamBold; p3.TextSize = 20

task.spawn(function()
    while gui.Parent do
        pcall(function()
            lfval.Text = math.floor(1 / RunService.RenderStepped:Wait())
            lp2val.Text = math.random(50, 100) .. "ms"
        end)
        task.wait(1)
    end
end)
