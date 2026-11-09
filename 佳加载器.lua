-- 1
local G=(type(getgenv)=="function" and getgenv()) or _G
pcall(function() local o=G.Sony if o then pcall(function() o.ui:Destroy() end) pcall(function() o.snd:Destroy() end) end local c=game:GetService("CoreGui"):FindFirstChild("SonyUI") if c then c:Destroy() end end)
local S={} G.Sony=S
local lp=game:GetService("Players").LocalPlayer
S.lp=lp S.T=game:GetService("TweenService") S.R=game:GetService("RunService") S.U=game:GetService("UserInputService")
S.F=Enum.Font.Fantasy S.G=Enum.Font.Gotham S.GB=Enum.Font.GothamBold
S.NAME="SONIC" S.CENTER="SONIC CENTER" S.VER="1.6" S.OWNER="李佳"
S.fps,S.ping,S.song=0,"--",""
S.grads={}
for _,e in ipairs({
 {{10,132,255},{52,198,216},{123,240,208},"海蓝"},{{17,153,142},{56,239,125},{198,255,221},"青碧"},
 {{123,75,255},{200,109,215},{255,158,196},"紫霞"},{{247,151,30},{255,210,0},{255,233,168},"金橙"},
 {{46,49,146},{27,255,255},{212,249,255},"冰蓝"},{{0,160,140},{120,255,220},{235,255,248},"薄荷"},
 {{255,110,120},{255,180,150},{255,235,210},"珊瑚"},{{40,90,180},{90,230,180},{200,140,255},"极光"},
 {{20,70,110},{90,200,220},{220,250,255},"琉璃"},{{90,80,140},{190,150,210},{255,215,190},"暮云"},
 {{255,140,180},{255,205,220},{255,245,250},"浅樱"},{{0,120,130},{70,220,200},{190,255,235},"松石"},
 {{190,110,20},{255,190,90},{255,240,190},"琥珀"},{{70,90,150},{120,170,225},{190,220,250},"星夜"},
 {{210,235,235},{150,225,225},{235,255,250},"奶白青"}
}) do
 local function c(t) return Color3.fromRGB(t[1],t[2],t[3]) end
 table.insert(S.grads,{ColorSequence.new({ColorSequenceKeypoint.new(0,c(e[1])),ColorSequenceKeypoint.new(0.5,c(e[2])),ColorSequenceKeypoint.new(1,c(e[3]))}),e[4]})
end
S.gradIdx=1 S.gradName=S.grads[1][2]
S.noticeText={"墨墨","来啦 · 慢一点也没关系","界面我顺手捋过一遍，不合眼的地方跟我说","好，进去看看"}
S.fx={anim=true,slide=30,rot=5,bounce=true,ripple=true,noticeSpin=true,avDrop=true,minScale=true,openBounce=true,
closeSpin=true,sweep=true,barShine=true,gradFlow=true,breath=true,glow=true,shine=true,edgeGlow=true,gradCycle=false,
bgOn=true,softBg=false,ov=0.97,showBar=true,barW=240,barR=10,tabGlow=true,waterBase=true,gradMain=true,
quality=2,fpscap=0,shadows=false,postfx=false,fog=false,dlss5=false,liveFps=true,friendAuto=true,songSkip=true,
winOn=true,debounce=true,clickTip=false,flashOn=true,miniDrag=true,miniAuto=false,miniBlur=true,miniEdge=true,
dragInertia=false,selfCheck=true,newsFont=11,newsTone=1,newsPicTop=true}
S.fxSpec={} S.FXSIDE={} S.fxDefault={}
S.localAsset=function(n) local a=nil pcall(function() if isfile and isfile(n) and readfile and getcustomasset then local d=readfile(n) if type(d)=="string" and #d>800 then a=getcustomasset(n) end end end) return a end
S.bgI=S.localAsset("sony_bg.png") S.newsI=S.localAsset("sony_news.png")
S.cardI=S.localAsset("sony_card.jpg") S.headI=S.localAsset("sony_head.jpg")
S.thumb="rbxthumb://type=AvatarHeadShot&id="..lp.UserId.."&w=150&h=150"
local ui=Instance.new("ScreenGui") S.ui=ui ui.Name="SonyUI"
pcall(function() ui.ResetOnSpawn=false end)
pcall(function() ui.Parent=game:GetService("CoreGui") end)
if not ui.Parent then pcall(function() ui.Parent=lp:WaitForChild("PlayerGui") end) end
if not ui.Parent then pcall(function() if gethui then ui.Parent=gethui() end end) end
local snd=Instance.new("Sound",game:GetService("SoundService")) S.snd=snd S.music=snd
snd.SoundId="rbxassetid://126799830755086" snd.Looped=true pcall(function() snd:Play() end)
S.flash=function(x)
 if S.fx.flashOn==false then return end
 local q=Instance.new("TextLabel",ui) q.Size=UDim2.new(0,260,0,24) q.Position=UDim2.new(0.5,-130,0,0.03)
 q.BackgroundTransparency=1 q.Text=x q.TextColor3=Color3.new(1,1,1) q.Font=S.GB q.TextSize=13 q.ZIndex=260
 task.delay(1.5,function() if q.Parent then q:Destroy() end end)
end
S.ready=1 S.flash("1 OK · 18 段版，纯本地读图")
-- 2
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.T then
 local T=S.T
 function S.C(o,r) pcall(function() Instance.new("UICorner",o).CornerRadius=UDim.new(0,r) end) end
 function S.K(o,c,t) local x=nil pcall(function() x=Instance.new("UIStroke",o) x.Color=c x.Thickness=t or 1 end) return x end
 S.bounce=function(b) if not b then return end pcall(function() local u=b:FindFirstChild("B") or Instance.new("UIScale",b) u.Name="B" u.Scale=0.92 T:Create(u,TweenInfo.new(0.22,Enum.EasingStyle.Back),{Scale=1}):Play() end) end
 S.ripple=function(b)
  if S.fx.ripple==false then return end
  pcall(function() local r=Instance.new("Frame",b) r.Size=UDim2.fromOffset(10,10) r.Position=UDim2.new(0.5,-5,0.5,-5)
   r.BackgroundColor3=Color3.new(1,1,1) r.BackgroundTransparency=0.62 r.ZIndex=(b.ZIndex or 1)+1 S.C(r,5)
   T:Create(r,TweenInfo.new(0.34),{Size=UDim2.new(1,0,1,0),Position=UDim2.new(0,0,0,0),BackgroundTransparency=1}):Play()
   task.delay(0.36,function() if r.Parent then r:Destroy() end end) end)
 end
 function S.tap(b,f)
  local l=0 local g=function() local z=tick() if S.fx.debounce and z-l<0.25 then return end l=z
   if S.fx.bounce then S.bounce(b) end S.ripple(b)
   if S.fx.clickTip and S.flash then S.flash("收到啦") end pcall(f) end
  pcall(function() b.Activated:Connect(g) end) pcall(function() b.MouseButton1Click:Connect(g) end)
 end
 S.drag=function(w,g2)
  if not w or not g2 then return end pcall(function() w.Active=true g2.Active=true end)
  local f=false local ax,ay,px,py=0,0,0,0
  g2.InputBegan:Connect(function(i) if w==S.miniWin and S.fx.miniDrag==false then return end
   if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then f=true ax,ay=i.Position.X,i.Position.Y px,py=w.Position.X.Offset,w.Position.Y.Offset end end)
  S.U.InputChanged:Connect(function(i) if f and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then pcall(function() w.Position=UDim2.new(w.Position.X.Scale,px+i.Position.X-ax,w.Position.Y.Scale,py+i.Position.Y-ay) end) end end)
  S.U.InputEnded:Connect(function() if f and S.fx.dragInertia then pcall(function() local u=w:FindFirstChild("DI") or Instance.new("UIScale",w) u.Name="DI" u.Scale=0.98 T:Create(u,TweenInfo.new(0.18,Enum.EasingStyle.Back),{Scale=1}):Play() end) end f=false end)
 end
 S.setGrad=function(i) S.gradIdx=((i-1)%#S.grads)+1 local e=S.grads[S.gradIdx] S.gradName=e[2]
  pcall(function() if S.hg then S.hg.Color=e[1] end if S.fx.gradMain and S.undGrad then S.undGrad.Color=e[1] end if S.bgGrad then S.bgGrad.Color=e[1] end end)
  if S.miniTitle then S.miniTitle.Text=e[2] end end
 S.applyBar=function(c) if S.h then S.h.BackgroundColor3=c end
  if S.hg then pcall(function() S.hg.Color=ColorSequence.new(c,Color3.new(1-c.r*0.4,1-c.g*0.4,1-c.b*0.4)) end) end
  S.customColor=c if S.prev then S.prev.BackgroundColor3=c end end
 S.update=function() local h=S.h if not h then return end
  h.Text=S.fx.showBar==false and ("Æ  "..S.NAME) or ("Æ  "..S.NAME.." · "..S.fps.."帧 · "..S.ping..(S.song~="" and (" · "..S.song) or ""))
  h.Size=UDim2.fromOffset(S.fx.barW or 240,38) end
 S.show=function(i)
  if not S.Pages or not S.Pages[i] then return end
  local old=S.cur or 1 S.cur=i
  for j,b in ipairs(S.btns or {}) do pcall(function() T:Create(b,TweenInfo.new(0.2),{BackgroundColor3=(j==i) and Color3.fromRGB(0,150,90) or Color3.fromRGB(35,40,50)}):Play() end) end
  for j,q in ipairs(S.Pages) do if j~=i then q.Visible=false end end
  if S.fx.miniAuto and S.miniWin then S.miniWin.Visible=false if S.miniBar then S.miniBar.Visible=true end end
  local p=S.Pages[i] p.Visible=true
  if S.fx.anim==false then p.Position=UDim2.new(0.5,0,0,46) p.Rotation=0 return end
  local sl=S.fx.slide or 30 local ro=S.fx.rot or 5
  p.Rotation=(i>=old) and ro or -ro p.Position=UDim2.new(0.5,(i>=old) and sl or -sl,0,46)
  pcall(function() T:Create(p,TweenInfo.new(0.36,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,0,0,46),Rotation=0}):Play() end)
 end
 S.enter=function()
  if S.entered then return end local m=S.main
  if not m then if S.flash then S.flash("先跑到第4段") end return end
  S.entered=true local n,ns,dim,sc=S.n,S.ns,S.dim,S.sc
  if S.fx.noticeSpin and n and ns then
   pcall(function() T:Create(n,TweenInfo.new(0.62,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Rotation=540}):Play() end)
   pcall(function() T:Create(ns,TweenInfo.new(0.62,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Scale=0.05}):Play() end)
  elseif n and ns then ns.Scale=1 end
  m.Visible=true
  if S.fx.openBounce then m.Rotation=-180 if sc then sc.Scale=0.25 end
   if sc then pcall(function() T:Create(sc,TweenInfo.new(0.78,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=1}):Play() end) end
   pcall(function() T:Create(m,TweenInfo.new(0.78,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Rotation=0}):Play() end)
  else m.Rotation=0 if sc then sc.Scale=1 end end
  S.cur=1 for j,q in ipairs(S.Pages or {}) do q.Visible=(j==1) end
  if S.update then S.update() end
  task.delay(S.fx.openBounce and 0.64 or 0.1,function() if dim and dim.Parent then dim:Destroy() end end)
 end
 S.minFn=function()
  local m,h,sc=S.main,S.h,S.sc if not m or not h then return end
  if S.fx.minScale==false or S.fx.anim==false then m.Visible=false h.Visible=true if S.update then S.update() end return end
  if sc then pcall(function() T:Create(sc,TweenInfo.new(0.36,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Scale=0.05}):Play() end) end
  pcall(function() T:Create(m,TweenInfo.new(0.36),{Rotation=14}):Play() end)
  task.delay(0.37,function() m.Visible=false m.Rotation=0 if sc then sc.Scale=1 end h.Visible=true
   if S.hs then S.hs.Scale=0.3 pcall(function() T:Create(S.hs,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Scale=1}):Play() end) end
   if S.update then S.update() end end)
 end
 S.openWin=function()
  local m,h,sc=S.main,S.h,S.sc if not m or not h or not S.entered then return end
  h.Visible=false m.Visible=true m.Position=UDim2.new(0.5,0,0.5,0) m.Rotation=0
  if S.fx.anim==false or S.fx.openBounce==false then if sc then sc.Scale=1 end return end
  if sc then sc.Scale=0.3 pcall(function() T:Create(sc,TweenInfo.new(0.45,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=1}):Play() end) end
  if S.show then S.show(S.cur or 1) end end
 local closing=false
 S.closeFn=function()
  if closing then return end closing=true local m,sc,ui=S.main,S.sc,S.ui if not m or not ui then return end
  if S.fx.closeSpin then pcall(function() T:Create(m,TweenInfo.new(0.42,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Rotation=22}):Play() end)
   if sc then pcall(function() T:Create(sc,TweenInfo.new(0.42,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Scale=0.02}):Play() end) end end
  task.delay(S.fx.closeSpin and 0.44 or 0.05,function() pcall(function() ui:Destroy() if S.snd then S.snd:Destroy() end end) G.Sony=nil end)
 end
 S.ready=2 S.flash("2 OK · 动作只在这段定一次")
end
-- 3
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.ui then
 local T=S.T local tx=S.noticeText
 local dim=Instance.new("Frame",S.ui) S.dim=dim dim.Size=UDim2.new(1,0,1,0) dim.BackgroundTransparency=1 dim.ZIndex=200 dim.Active=true
 local n=Instance.new("Frame",dim) S.n=n n.Size=UDim2.fromOffset(320,290) n.Position=UDim2.new(0.5,0,0.5,0)
 n.AnchorPoint=Vector2.new(0.5,0.5) n.BackgroundColor3=Color3.fromRGB(26,30,42) n.ZIndex=201 n.Active=true n.Rotation=-180
 S.C(n,18) S.K(n,Color3.fromRGB(235,110,190),1.6)
 local ns=Instance.new("UIScale",n) S.ns=ns ns.Scale=0.2
 pcall(function() T:Create(ns,TweenInfo.new(0.7,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=1}):Play() end)
 pcall(function() T:Create(n,TweenInfo.new(0.7,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Rotation=0}):Play() end)
 local av=Instance.new("Frame",n) av.Size=UDim2.fromOffset(72,72) av.Position=UDim2.new(0.5,-36,0,-420) av.BackgroundTransparency=1 av.ZIndex=203
 local rim=Instance.new("Frame",av) rim.Size=UDim2.fromOffset(80,80) rim.Position=UDim2.fromOffset(-4,-4) rim.BackgroundTransparency=1 rim.ZIndex=203 S.C(rim,40) S.K(rim,Color3.fromRGB(0,229,255),3)
 local cut=Instance.new("Frame",rim) cut.Size=UDim2.fromOffset(20,12) cut.Position=UDim2.new(0.5,-10,0,-3) cut.BackgroundColor3=Color3.fromRGB(26,30,42) cut.BorderSizePixel=0 cut.ZIndex=204
 local im=Instance.new("ImageLabel",av) S.nh=im im.Size=UDim2.fromOffset(64,64) im.Position=UDim2.fromOffset(4,4)
 im.BackgroundColor3=Color3.fromRGB(52,62,84) im.Image=S.headI or "" im.ScaleType=Enum.ScaleType.Crop im.ZIndex=204 S.C(im,32)
 if S.fx.avDrop then pcall(function() T:Create(av,TweenInfo.new(0.8,Enum.EasingStyle.Bounce,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-36,0,18)}):Play() end) else av.Position=UDim2.new(0.5,-36,0,18) end
 task.delay(0.82,function() if av.Parent then pcall(function() T:Create(av,TweenInfo.new(0.9,Enum.EasingStyle.Sine),{Rotation=720}):Play() end) end end)
 local a=Instance.new("TextLabel",n) a.Size=UDim2.new(1,-20,0,30) a.Position=UDim2.fromOffset(10,100) a.BackgroundTransparency=1 a.Text=tx[1] a.TextColor3=Color3.fromRGB(0,229,255) a.Font=S.F a.TextSize=21 a.ZIndex=202
 local b=Instance.new("TextLabel",n) b.Size=UDim2.new(1,-20,0,18) b.Position=UDim2.fromOffset(10,132) b.BackgroundTransparency=1 b.Text=tx[2] b.TextColor3=Color3.fromRGB(165,185,210) b.Font=S.G b.TextSize=11 b.ZIndex=202
 local c=Instance.new("TextLabel",n) c.Size=UDim2.new(1,-40,0,18) c.Position=UDim2.fromOffset(20,164) c.BackgroundTransparency=1 c.Text=tx[3] c.TextColor3=Color3.fromRGB(150,170,195) c.Font=S.G c.TextSize=10 c.ZIndex=202
 local go=Instance.new("TextButton",n) S.go=go go.Size=UDim2.fromOffset(200,44) go.Position=UDim2.new(0.5,-100,0,210)
 go.BackgroundColor3=Color3.fromRGB(205,168,55) go.Text=tx[4] go.TextColor3=Color3.fromRGB(18,28,24) go.Font=S.F go.TextSize=15 go.ZIndex=250 go.Active=true S.C(go,22)
 S.tap(go,function() if S.enter then S.enter() end end)
 S.ready=3 S.flash("3 OK · 公告框架动作没动")
end
-- 4
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.ui then
 local ui=S.ui S.names={"主页","服务器脚本","关于","音乐","外观","配置"} S.cur=1
 local m=Instance.new("Frame",ui) S.main=m m.Size=UDim2.fromOffset(580,340) m.Position=UDim2.new(0.5,0,0.5,0)
 m.AnchorPoint=Vector2.new(0.5,0.5) m.BackgroundColor3=Color3.fromRGB(120,140,160) m.Active=true m.ClipsDescendants=true m.Visible=false
 S.C(m,12) S.ms=S.K(m,Color3.fromRGB(150,175,205),1.2)
 local und=Instance.new("Frame",m) S.und=und und.Size=UDim2.new(1,0,1,0) und.ZIndex=-1 und.BackgroundColor3=Color3.fromRGB(120,140,160) S.C(und,12)
 S.undGrad=Instance.new("UIGradient",und) S.undGrad.Color=S.grads[1][1] S.undGrad.Rotation=35
 local bg=Instance.new("ImageLabel",m) S.bg=bg bg.Size=UDim2.new(1,0,1,0) bg.ZIndex=0 bg.ScaleType=Enum.ScaleType.Crop bg.Visible=true S.C(bg,12)
 if S.bgI then bg.Image=S.bgI bg.BackgroundTransparency=1 bg.ImageTransparency=0.02
 else bg.Image="" bg.BackgroundTransparency=0 bg.BackgroundColor3=Color3.fromRGB(120,140,160) S.bgGrad=Instance.new("UIGradient",bg) S.bgGrad.Color=S.grads[1][1] S.bgGrad.Rotation=20 end
 local ov=Instance.new("Frame",m) S.ov=ov ov.Size=UDim2.new(1,0,1,0) ov.ZIndex=1 ov.BackgroundColor3=Color3.fromRGB(12,14,18) ov.BackgroundTransparency=S.fx.ov S.C(ov,12)
 S.sc=Instance.new("UIScale",m) S.sc.Scale=1
 S.Pages={}
 for i=1,6 do local p=Instance.new("Frame",m) p.Size=UDim2.new(0.95,0,1,-52) p.Position=UDim2.new(0.5,0,0,46)
  p.AnchorPoint=Vector2.new(0.5,0) p.BackgroundTransparency=1 p.Visible=(i==1) p.ZIndex=2 S.Pages[i]=p
  local z=Instance.new("TextLabel",p) z.Size=UDim2.new(1,-20,0,36) z.Position=UDim2.fromOffset(10,60) z.BackgroundTransparency=1
  z.Text=S.names[i].." · 这段还没跑到，贴到对应段就好" z.TextColor3=Color3.fromRGB(200,215,235) z.Font=S.G z.TextSize=12 z.TextWrapped=true end
 local cl=Instance.new("TextButton",m) cl.Size=UDim2.fromOffset(24,24) cl.Position=UDim2.new(1,-34,0,11) cl.BackgroundColor3=Color3.fromRGB(180,50,50) cl.Text="x" cl.TextColor3=Color3.new(1,1,1) cl.Font=S.GB cl.TextSize=16 cl.ZIndex=10 S.C(cl,6)
 local mn=Instance.new("TextButton",m) mn.Size=UDim2.fromOffset(24,24) mn.Position=UDim2.new(1,-64,0,11) mn.BackgroundColor3=Color3.fromRGB(180,130,40) mn.Text="-" mn.TextColor3=Color3.new(1,1,1) mn.Font=S.GB mn.TextSize=16 mn.ZIndex=10 S.C(mn,6)
 local ts=Instance.new("ScrollingFrame",m) ts.Size=UDim2.new(1,-178,0,28) ts.Position=UDim2.fromOffset(90,9) ts.BackgroundTransparency=1 ts.ScrollBarThickness=0 ts.ScrollingDirection=Enum.ScrollingDirection.X ts.CanvasSize=UDim2.new(0,400,0,28) ts.ZIndex=10 ts.ClipsDescendants=true
 local lo=Instance.new("UIListLayout",ts) lo.FillDirection=Enum.FillDirection.Horizontal lo.Padding=UDim.new(0,4)
 S.btns={}
 for i,nm in ipairs(S.names) do local b=Instance.new("TextButton",ts) b.Size=UDim2.new(0,62,1,0)
  b.BackgroundColor3=(i==1) and Color3.fromRGB(0,150,90) or Color3.fromRGB(35,40,50) b.Text=nm b.TextColor3=Color3.fromRGB(220,220,220)
  b.Font=S.GB b.TextSize=10 b.ZIndex=10 S.C(b,6) S.K(b,Color3.fromRGB(90,110,140),1) S.btns[i]=b S.tap(b,function() if S.show then S.show(i) end end) end
 local h=Instance.new("TextButton",ui) S.h=h h.Size=UDim2.fromOffset(240,38) h.Position=UDim2.new(0.5,-120,0,10)
 h.BackgroundColor3=Color3.fromRGB(120,140,160) h.Text="Æ  "..S.NAME h.TextColor3=Color3.fromRGB(18,28,24) h.Font=S.F h.TextSize=14 h.Visible=false h.ZIndex=120 h.ClipsDescendants=true S.C(h,10) S.K(h,Color3.fromRGB(245,250,220),1.2)
 S.hg=Instance.new("UIGradient",h) S.hg.Color=S.grads[1][1] S.hs=Instance.new("UIScale",h) S.hs.Scale=1
 S.hShine=Instance.new("Frame",h) S.hShine.Size=UDim2.new(0.35,0,1,0) S.hShine.Position=UDim2.new(-0.4,0,0,0) S.hShine.BackgroundColor3=Color3.new(1,1,1) S.hShine.BackgroundTransparency=0.82 S.hShine.ZIndex=121 S.hShine.Rotation=12
 S.tap(cl,function() if S.closeFn then S.closeFn() end end) S.tap(mn,function() if S.minFn then S.minFn() end end)
 if S.update then S.update() end
 S.ready=4 S.flash("4 OK · 窗口起来了，可点「好，进去看看」")
end
-- 5
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.main then
 local T,m,h=S.T,S.main,S.h
 local d=Instance.new("Frame",m) d.Size=UDim2.new(1,-140,0,36) d.Position=UDim2.fromOffset(0,3) d.BackgroundTransparency=1 d.Active=true d.ZIndex=9
 if S.drag then S.drag(m,d) S.drag(h,h) end
 local hx,hy,hd=0,0,false
 h.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then hd=true hx,hy=i.Position.X,i.Position.Y end end)
 h.InputEnded:Connect(function(i) if not hd then return end hd=false if math.abs(i.Position.X-hx)+math.abs(i.Position.Y-hy)<10 and S.openWin then S.openWin() end end)
 task.spawn(function() while S.hShine and S.hShine.Parent do S.hShine.Visible=S.fx.barShine
  if S.fx.barShine then S.hShine.Position=UDim2.new(-0.4,0,0,0) pcall(function() T:Create(S.hShine,TweenInfo.new(1.8,Enum.EasingStyle.Linear),{Position=UDim2.new(1.1,0,0,0)}):Play() end) end task.wait(2.1) end end)
 task.spawn(function() while S.hg and S.hg.Parent do
  if S.fx.gradFlow then pcall(function() T:Create(S.hg,TweenInfo.new(6,Enum.EasingStyle.Linear),{Rotation=360}):Play() end) end
  task.wait(6) if S.hg then S.hg.Rotation=0 end if S.fx.gradCycle and S.setGrad then S.setGrad(S.gradIdx+1) end end end)
 task.spawn(function() while S.bg and S.bg.Parent do
  if S.fx.breath and S.bgI then pcall(function() T:Create(S.bg,TweenInfo.new(2.2),{ImageTransparency=0.14}):Play() end) task.wait(2.2) pcall(function() T:Create(S.bg,TweenInfo.new(2.2),{ImageTransparency=0.02}):Play() end) end task.wait(2.2) end end)
 local swp=Instance.new("Frame",m) S.topSweep=swp swp.Size=UDim2.fromOffset(60,40) swp.Position=UDim2.new(0,-60,0,0) swp.Rotation=18 swp.BackgroundColor3=Color3.new(1,1,1) swp.BackgroundTransparency=0.9 swp.ZIndex=8
 task.spawn(function() while swp.Parent do swp.Visible=S.fx.sweep
  if S.fx.sweep then swp.Position=UDim2.new(0,-60,0,0) pcall(function() T:Create(swp,TweenInfo.new(1.6,Enum.EasingStyle.Linear),{Position=UDim2.new(1,0,0,0)}):Play() end) end task.wait(1.8) end end)
 local bar=Instance.new("TextButton",m) S.miniBar=bar bar.Size=UDim2.fromOffset(72,22) bar.Position=UDim2.new(1,-80,1,-28) bar.BackgroundColor3=Color3.fromRGB(40,55,78) bar.Text="水感" bar.TextColor3=Color3.fromRGB(215,230,248) bar.Font=S.GB bar.TextSize=10 bar.ZIndex=12 S.C(bar,8)
 local mw=Instance.new("Frame",m) S.miniWin=mw mw.Size=UDim2.fromOffset(222,164) mw.Position=UDim2.new(1,-234,1,-178) mw.BackgroundColor3=Color3.fromRGB(22,28,40) mw.BackgroundTransparency=S.fx.miniBlur and 0.04 or 0 mw.ZIndex=14 mw.Visible=false mw.Active=true S.C(mw,12) S.miniEdgeStroke=S.K(mw,Color3.fromRGB(110,190,220),1.2)
 if S.drag then S.drag(mw,mw) end
 local mt=Instance.new("TextLabel",mw) S.miniTitle=mt mt.Size=UDim2.new(1,-70,0,24) mt.Position=UDim2.fromOffset(10,6) mt.BackgroundTransparency=1 mt.Text=S.gradName mt.TextColor3=Color3.fromRGB(225,240,252) mt.Font=S.GB mt.TextSize=12 mt.TextXAlignment=Enum.TextXAlignment.Left mt.ZIndex=15
 local mb=Instance.new("TextButton",mw) mb.Size=UDim2.fromOffset(48,22) mb.Position=UDim2.new(1,-54,0,5) mb.BackgroundColor3=Color3.fromRGB(80,90,110) mb.Text="收起" mb.TextColor3=Color3.new(1,1,1) mb.Font=S.GB mb.TextSize=10 mb.ZIndex=16 S.C(mb,7)
 S.tap(mb,function() mw.Visible=false bar.Visible=true end) S.tap(bar,function() mw.Visible=true bar.Visible=false end)
 S.applyQuality=function(i) S.fx.quality=i
  local QN={"QualityLevel1","QualityLevel3","QualityLevel6","QualityLevel10"} local QL={"Level01","Level05","Level10","Level16"}
  pcall(function() local u=UserSettings():GetService("UserGameSettings") for _,v in ipairs(Enum.SavedQualitySetting:GetEnumItems()) do if v.Name==QN[i] then u.SavedQualityLevel=v break end end end)
  pcall(function() for _,v in ipairs(Enum.QualityLevel:GetEnumItems()) do if v.Name==QL[i] then settings().Rendering.QualityLevel=v break end end end)
  pcall(function() local L=game:GetService("Lighting") L.GlobalShadows=S.fx.shadows for _,o in ipairs(L:GetChildren()) do if o:IsA("PostEffect") then pcall(function() o.Enabled=S.fx.postfx end) end end L.FogEnd=S.fx.fog and 600 or 100000 end)
  if S.qStatus then S.qStatus.Text="画质 · 等级"..i.." · 阴影"..(S.fx.shadows and "开" or "关") end end
 S.applyDLSS=function(on) S.fx.dlss5=on
  pcall(function() for _,o in ipairs(S.ui:GetDescendants()) do if o:IsA("TextLabel") or o:IsA("TextButton") then
   local k=o:FindFirstChild("DL") if on and not k then k=Instance.new("UIStroke",o) k.Name="DL" k.Thickness=0.6 k.Color=Color3.fromRGB(215,240,255) k.Transparency=0.5 end
   if k then k.Enabled=on end end end end)
  pcall(function() if S.bg then S.bg.ImageColor3=on and Color3.fromRGB(246,251,255) or Color3.new(1,1,1) end end)
  pcall(function() if S.ms then S.ms.Thickness=on and 1.6 or 1.2 end end) end
 S.ready=5 S.flash("5 OK · 动效 + 真画质 + DLSS 5")
end
-- 6
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.Pages then
 local p,lp,T,C,K=S.Pages[1],S.lp,S.T,S.C,S.K
 for _,o in ipairs(p:GetChildren()) do o:Destroy() end
 local function mk(c,q) return Instance.new(c,q) end
 local hd=mk("TextLabel",p) hd.Size=UDim2.new(1,-16,0,20) hd.Position=UDim2.fromOffset(8,0) hd.BackgroundTransparency=1 hd.Text="主页 · 一眼看得清" hd.TextColor3=Color3.fromRGB(180,200,225) hd.Font=S.GB hd.TextSize=11 hd.TextXAlignment=Enum.TextXAlignment.Left hd.ZIndex=4
 local eb=mk("Frame",p) eb.Size=UDim2.new(0.47,-4,0,104) eb.Position=UDim2.new(0.015,0,0,22) eb.BackgroundColor3=Color3.fromRGB(58,54,50) eb.BackgroundTransparency=0.2 eb.ClipsDescendants=true eb.ZIndex=3 C(eb,10)
 local st=K(eb,Color3.fromRGB(90,95,105),1) S.cardStroke=st
 local eI=mk("ImageLabel",eb) S.eI=eI eI.Size=UDim2.new(1,0,1,0) eI.BackgroundTransparency=1 eI.Image=S.cardI or "" eI.ScaleType=Enum.ScaleType.Fit eI.ZIndex=3
 local et=mk("TextLabel",eb) et.Size=UDim2.new(1,-16,0,22) et.Position=UDim2.fromOffset(8,4) et.BackgroundTransparency=1 et.Text=S.CENTER et.TextColor3=Color3.fromRGB(250,250,250) et.Font=S.F et.TextSize=16 et.TextXAlignment=Enum.TextXAlignment.Left et.ZIndex=4
 local es=mk("TextLabel",eb) es.Size=UDim2.new(1,-16,0,16) es.Position=UDim2.fromOffset(8,27) es.BackgroundTransparency=1 es.Text=S.VER.." · "..S.OWNER es.TextColor3=Color3.fromRGB(215,222,235) es.Font=S.G es.TextSize=10 es.TextXAlignment=Enum.TextXAlignment.Left es.ZIndex=4
 task.spawn(function() while eb.Parent do if S.fx.glow and st then pcall(function() T:Create(st,TweenInfo.new(1.5),{Color=Color3.fromRGB(255,170,80)}):Play() end) end task.wait(1.5) if S.fx.glow and st then pcall(function() T:Create(st,TweenInfo.new(1.5),{Color=Color3.fromRGB(90,95,105)}):Play() end) end task.wait(1.5) end end)
 local function stat(x,tt,col)
  local f=mk("Frame",p) f.Size=UDim2.new(0.235,-4,0,58) f.Position=UDim2.new(x,0,0,132) f.BackgroundColor3=Color3.fromRGB(25,30,38) f.BackgroundTransparency=0.25 f.ZIndex=3 C(f,10) K(f,Color3.fromRGB(80,95,125),1)
  local a=mk("TextLabel",f) a.Size=UDim2.new(1,0,0,18) a.Position=UDim2.fromOffset(0,7) a.BackgroundTransparency=1 a.Text=tt a.TextColor3=Color3.fromRGB(200,200,200) a.Font=S.GB a.TextSize=11 a.ZIndex=4
  local v=mk("TextLabel",f) v.Size=UDim2.new(1,0,0,25) v.Position=UDim2.fromOffset(0,26) v.BackgroundTransparency=1 v.Text="--" v.TextColor3=col v.Font=S.GB v.TextSize=18 v.ZIndex=4 return v end
 S.fv=stat(0.015,"帧率",Color3.fromRGB(240,240,240)) S.pv=stat(0.265,"延迟",Color3.fromRGB(255,150,50))
 local fb=mk("Frame",p) fb.Size=UDim2.new(0.47,-4,0,184) fb.Position=UDim2.new(0.515,0,0,22) fb.BackgroundColor3=Color3.fromRGB(30,33,40) fb.BackgroundTransparency=0.3 fb.ZIndex=3 C(fb,10) K(fb,Color3.fromRGB(80,95,125),1)
 local ft=mk("TextLabel",fb) ft.Size=UDim2.new(1,-20,0,22) ft.Position=UDim2.fromOffset(10,8) ft.BackgroundTransparency=1 ft.Text="好友" ft.TextColor3=Color3.fromRGB(210,210,210) ft.Font=S.GB ft.TextSize=15 ft.TextXAlignment=Enum.TextXAlignment.Left ft.ZIndex=4
 local fd=mk("TextLabel",fb) fd.Size=UDim2.new(1,-20,0,14) fd.Position=UDim2.fromOffset(10,30) fd.BackgroundTransparency=1 fd.Text="看看他们现在在哪" fd.TextColor3=Color3.fromRGB(150,150,150) fd.Font=S.G fd.TextSize=10 fd.TextXAlignment=Enum.TextXAlignment.Left fd.ZIndex=4
 local grid=mk("Frame",fb) grid.Size=UDim2.new(1,-20,1,-52) grid.Position=UDim2.fromOffset(10,52) grid.BackgroundTransparency=1 grid.ZIndex=4
 local ug=Instance.new("UIGridLayout",grid) ug.CellSize=UDim2.new(0.48,0,0.48,0) ug.CellPadding=UDim2.new(0.04,0,0.04,0)
 S.vals={}
 for i,k in ipairs({"本服务器","离线","在线","全部"}) do local c=mk("Frame",grid) c.BackgroundColor3=Color3.fromRGB(40,45,55) c.BackgroundTransparency=0.25 c.ZIndex=5 C(c,10)
  local a=mk("TextLabel",c) a.Size=UDim2.new(1,0,0,18) a.Position=UDim2.fromOffset(0,9) a.BackgroundTransparency=1 a.Text=k a.TextColor3=Color3.new(1,1,1) a.Font=S.GB a.TextSize=12 a.ZIndex=6
  local v=mk("TextLabel",c) v.Size=UDim2.new(1,0,0,18) v.Position=UDim2.fromOffset(0,28) v.BackgroundTransparency=1 v.Text="获取中..." v.TextColor3=Color3.fromRGB(150,150,150) v.Font=S.G v.TextSize=11 v.ZIndex=6 S.vals[i]=v end
 task.spawn(function() while fb.Parent do if S.fx.friendAuto then pcall(function()
  local o,l=pcall(function() return lp:GetFriendsOnline(200) end) local on,ins,tot=0,0,nil
  if o and l then for _,f in ipairs(l) do if f.IsOnline then on=on+1 if f.PlaceId==game.PlaceId then ins=ins+1 end end end end
  pcall(function() local q=lp:GetFriendsAsync() local z=0 repeat for _ in ipairs(q:GetCurrentPage()) do z=z+1 end if not q.IsFinished then q:AdvanceToNextPageAsync() end until q.IsFinished tot=z end)
  S.vals[1].Text=ins==0 and "无好友" or (ins.." 个") S.vals[3].Text=(o and on or 0).." 个" S.vals[4].Text=tot and (tot.." 个") or "--" S.vals[2].Text=tot and (math.max(0,tot-on).." 个") or "--" end) end task.wait(10) end end)
 S.ready=6 S.flash("6 OK")
end
-- 7
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.Pages then
 local p,lp,T,C,K,tap=S.Pages[1],S.lp,S.T,S.C,S.K,S.tap
 local function mk(c,q) return Instance.new(c,q) end
 local ub=mk("Frame",p) ub.Size=UDim2.new(0.47,-4,0,55) ub.Position=UDim2.new(0.015,0,1,-58) ub.BackgroundColor3=Color3.fromRGB(15,18,24) ub.BackgroundTransparency=0.2 ub.ZIndex=3 C(ub,10) K(ub,Color3.fromRGB(80,95,125),1)
 local av=mk("ImageLabel",ub) av.Size=UDim2.fromOffset(35,35) av.Position=UDim2.fromOffset(10,10) av.BackgroundColor3=Color3.new(0,0,0) av.Image=S.thumb av.ScaleType=Enum.ScaleType.Crop av.ZIndex=4 C(av,17)
 local nt=mk("TextLabel",ub) nt.Size=UDim2.new(1,-50,0,20) nt.Position=UDim2.fromOffset(55,8) nt.BackgroundTransparency=1 nt.Text=S.OWNER nt.TextColor3=Color3.fromRGB(240,240,240) nt.Font=S.GB nt.TextSize=14 nt.TextXAlignment=Enum.TextXAlignment.Left nt.ZIndex=4
 local sb=mk("TextLabel",ub) sb.Size=UDim2.new(1,-50,0,15) sb.Position=UDim2.fromOffset(55,28) sb.BackgroundTransparency=1 sb.Text="配置" sb.TextColor3=Color3.fromRGB(180,180,180) sb.Font=S.G sb.TextSize=10 sb.TextXAlignment=Enum.TextXAlignment.Left sb.ZIndex=4
 local ubb=mk("TextButton",ub) ubb.Size=UDim2.new(1,0,1,0) ubb.BackgroundTransparency=1 ubb.Text="" ubb.ZIndex=5 tap(ubb,function() if S.show then S.show(6) end end)
 local bb=mk("Frame",p) bb.Size=UDim2.new(0.47,-4,0,55) bb.Position=UDim2.new(0.515,0,1,-58) bb.BackgroundColor3=Color3.fromRGB(20,40,120) bb.BackgroundTransparency=0.2 bb.ClipsDescendants=true bb.ZIndex=3 C(bb,10) K(bb,Color3.fromRGB(80,95,125),1)
 local grad=Instance.new("UIGradient",bb) grad.Color=S.grads[1][1] grad.Rotation=45
 local bH=mk("Frame",bb) S.sweep=bH bH.Size=UDim2.new(0.5,0,2,0) bH.Position=UDim2.new(-0.2,0,-0.5,0) bH.Rotation=30 bH.BackgroundColor3=Color3.new(1,1,1) bH.BackgroundTransparency=0.9 bH.ZIndex=4
 local gh=Instance.new("UIGradient",bH) gh.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,0),NumberSequenceKeypoint.new(1,1)})
 local qt=mk("TextLabel",bb) qt.Size=UDim2.new(1,-20,0,25) qt.Position=UDim2.fromOffset(15,15) qt.BackgroundTransparency=1 qt.Text="QQ群 · 复制" qt.TextColor3=Color3.fromRGB(220,220,220) qt.Font=S.GB qt.TextSize=15 qt.TextXAlignment=Enum.TextXAlignment.Left qt.ZIndex=4
 local qb=mk("TextButton",bb) qb.Size=UDim2.new(1,0,1,0) qb.BackgroundTransparency=1 qb.Text="" qb.ZIndex=5 tap(qb,function() pcall(function() if setclipboard then setclipboard("1107284557") end end) end)
 task.spawn(function() while bb.Parent do bH.Visible=S.fx.shine if S.fx.shine then pcall(function() T:Create(bH,TweenInfo.new(2,Enum.EasingStyle.Linear),{Position=UDim2.new(1.2,0,-0.5,0)}):Play() end) end task.wait(2) if bH.Parent then bH.Position=UDim2.new(-0.5,0,-0.5,0) end end end)
 if S.fp then pcall(function() S.fp:Disconnect() end) end
 local last,n=tick(),0
 S.fp=S.R.RenderStepped:Connect(function() if S.fx.liveFps==false then return end n=n+1 local z=tick()
  if z-last>=1 then local f=math.floor(n/(z-last)) n=0 last=z if S.fv and S.fv.Parent then S.fv.Text=tostring(f) end
   local o,q=pcall(function() return lp:GetNetworkPing() end) local w=o and (math.floor(q*1000).."ms") or "--"
   if S.pv and S.pv.Parent then S.pv.Text=w end S.fps=f S.ping=w if S.update then pcall(S.update) end end end)
 local P=S.Pages[2] for _,o in ipairs(P:GetChildren()) do o:Destroy() end
 local nm=Instance.new("TextLabel",P) nm.Size=UDim2.new(1,-16,0,36) nm.Position=UDim2.fromOffset(8,6) nm.BackgroundTransparency=1 nm.Text=S.CENTER nm.TextColor3=Color3.fromRGB(205,168,55) nm.Font=S.F nm.TextSize=22 nm.TextXAlignment=Enum.TextXAlignment.Center nm.ZIndex=4
 local sub=Instance.new("TextLabel",P) sub.Size=UDim2.new(1,-16,0,18) sub.Position=UDim2.fromOffset(8,44) sub.BackgroundTransparency=1 sub.Text=S.VER.." · 两个分区，别急" sub.TextColor3=Color3.fromRGB(160,180,205) sub.Font=S.G sub.TextSize=11 sub.TextXAlignment=Enum.TextXAlignment.Center sub.ZIndex=4
 local function zone(x,title,body,g)
  local f=Instance.new("Frame",P) f.Size=UDim2.new(0.48,-6,0,150) f.Position=UDim2.new(x,8,0,72) f.BackgroundColor3=Color3.fromRGB(28,34,46) f.BackgroundTransparency=0.1 f.ZIndex=4 C(f,12) K(f,Color3.fromRGB(95,115,155),1.2)
  local gg=Instance.new("UIGradient",f) gg.Color=g gg.Rotation=20
  local t=Instance.new("TextLabel",f) t.Size=UDim2.new(1,-20,0,28) t.Position=UDim2.fromOffset(12,10) t.BackgroundTransparency=1 t.Text=title t.TextColor3=Color3.fromRGB(248,250,255) t.Font=S.F t.TextSize=16 t.TextXAlignment=Enum.TextXAlignment.Left t.ZIndex=5
  local ln=Instance.new("Frame",f) ln.Size=UDim2.new(1,-24,0,1) ln.Position=UDim2.fromOffset(12,40) ln.BackgroundColor3=Color3.fromRGB(120,150,190) ln.BackgroundTransparency=0.5 ln.ZIndex=5
  local d=Instance.new("TextLabel",f) d.Size=UDim2.new(1,-24,1,-50) d.Position=UDim2.fromOffset(12,46) d.BackgroundTransparency=1 d.Text=body d.TextColor3=Color3.fromRGB(214,226,242) d.Font=S.G d.TextSize=11 d.TextWrapped=true d.TextXAlignment=Enum.TextXAlignment.Left d.TextYAlignment=Enum.TextYAlignment.Top d.ZIndex=5 end
 zone(0,"外链脚本","我还没有放外链脚本\n\n这块先留着，等你把链接给我，我再安进来。",S.grads[1][1])
 zone(0.52,"SONIC SCRIPT","本地读取 · 六标签齐全\n歌单是李佳一首首找来的\n照片第一帧就在，不用等加载",S.grads[3][1])
 local stt=Instance.new("TextLabel",P) stt.Size=UDim2.new(1,-16,0,22) stt.Position=UDim2.fromOffset(8,232) stt.BackgroundTransparency=1 stt.Text="我还没有放外链脚本" stt.TextColor3=Color3.fromRGB(160,180,205) stt.Font=S.G stt.TextSize=11 stt.TextXAlignment=Enum.TextXAlignment.Center stt.ZIndex=4
 S.ready=7 S.flash("7 OK · 主页齐 + 脚本页两区")
end
-- 8
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.Pages then
 local p,C,K,tap=S.Pages[3],S.C,S.K,S.tap
 for _,o in ipairs(p:GetChildren()) do o:Destroy() end
 local sf=Instance.new("ScrollingFrame",p) S.newsSF=sf sf.Size=UDim2.new(1,0,1,-34) sf.BackgroundTransparency=1 sf.ScrollBarThickness=3 sf.ScrollBarImageColor3=Color3.fromRGB(0,190,230) sf.ZIndex=3
 S.newsItems={{"1.1.0","先把六标签和收起条立住了，能拖、能收、点哪去哪，不用来回找。"},
 {"1.2.0","好友、帧率、延迟补进主页，主页那张图卡也归了位，不再串到别处。"},
 {"1.3.0","公告换了会说话的口气，头像一上来就在，不用等它慢慢加载。"},
 {"1.4.0","歌单一首首补齐，失效会自己跳过去，玄武窗也能开能收。"},
 {"1.5.0","颜色改成点哪出哪，画质换真等级和帧率上限，不再只是把画面调亮。"},
 {"1.6.0","六个标签全捋了一遍，配置四十六项各有各的用，检查系统也补上了。"}}
 S.newsDefault={} for _,v in ipairs(S.newsItems) do table.insert(S.newsDefault,{v[1],v[2]}) end
 S.newsTones={{{30,34,44},{80,190,225}},{{34,30,46},{200,150,235}},{{28,38,44},{120,220,170}},{{40,34,32},{240,180,110}}}
 local col=function(t) return Color3.fromRGB(t[1],t[2],t[3]) end
 S.newsPhoto=function(o) local q=Instance.new("ImageLabel",sf) q.Size=UDim2.new(1,-8,0,168) q.LayoutOrder=o
  q.BackgroundColor3=Color3.fromRGB(52,60,76) q.Image=S.newsI or "" q.ScaleType=Enum.ScaleType.Fit q.ZIndex=4 C(q,12) K(q,Color3.fromRGB(110,190,220),1.4) S.newsPic=q return 175 end
 S.newsLine=function(ver,txt,o,tone)
  local f=Instance.new("Frame",sf) f.Size=UDim2.new(1,-8,0,46) f.LayoutOrder=o f.BackgroundColor3=col(tone[1]) f.BackgroundTransparency=0.2 f.ZIndex=4 C(f,10) K(f,col(tone[2]),1)
  local ln=Instance.new("Frame",f) ln.Size=UDim2.fromOffset(2,34) ln.Position=UDim2.fromOffset(11,6) ln.BackgroundColor3=col(tone[2]) ln.BackgroundTransparency=0.45 ln.ZIndex=5
  local dot=Instance.new("Frame",f) dot.Size=UDim2.fromOffset(8,8) dot.Position=UDim2.fromOffset(8,9) dot.BackgroundColor3=col(tone[2]) dot.ZIndex=5 C(dot,4)
  local bg=Instance.new("Frame",f) bg.Size=UDim2.fromOffset(58,17) bg.Position=UDim2.fromOffset(24,4) bg.BackgroundColor3=col(tone[2]) bg.BackgroundTransparency=0.35 bg.ZIndex=5 C(bg,5)
  local vt=Instance.new("TextLabel",bg) vt.Size=UDim2.new(1,0,1,0) vt.BackgroundTransparency=1 vt.Text=ver vt.TextColor3=Color3.fromRGB(245,250,255) vt.Font=S.GB vt.TextSize=9 vt.ZIndex=6
  local q=Instance.new("TextLabel",f) q.Size=UDim2.new(1,-34,0,22) q.Position=UDim2.fromOffset(24,22) q.BackgroundTransparency=1 q.Text=txt q.TextColor3=Color3.fromRGB(224,232,245) q.Font=S.G q.TextSize=S.fx.newsFont q.TextWrapped=true q.TextXAlignment=Enum.TextXAlignment.Left q.ZIndex=5 return 53 end
 S.renderNews=function()
  for _,o in ipairs(sf:GetChildren()) do o:Destroy() end
  local ul=Instance.new("UIListLayout",sf) ul.Padding=UDim.new(0,7) ul.SortOrder=Enum.SortOrder.LayoutOrder
  local ord=0 local function nx() ord=ord+1 return ord end local total=0
  local tone=S.newsTones[S.fx.newsTone] or S.newsTones[1]
  local function card(t,h,o) local f=Instance.new("Frame",sf) f.Size=UDim2.new(1,-8,0,h) f.LayoutOrder=o
   f.BackgroundColor3=col(tone[1]) f.BackgroundTransparency=0.2 f.ZIndex=4 C(f,10) K(f,col(tone[2]),1)
   local q=Instance.new("TextLabel",f) q.Size=UDim2.new(1,-20,1,0) q.Position=UDim2.fromOffset(10,0) q.BackgroundTransparency=1 q.Text=t q.TextColor3=Color3.fromRGB(224,232,245) q.Font=S.G q.TextSize=11 q.TextWrapped=true q.TextXAlignment=Enum.TextXAlignment.Left q.TextYAlignment=Enum.TextYAlignment.Center q.ZIndex=5 total=total+h+7 end
  if S.fx.newsPicTop then total=total+S.newsPhoto(nx()) end
  card("索尼克更新公告  ·  1.1.0 → 1.6.0\n照片放最上，下面才是一版一版攒下来的改动",38,nx())
  for _,it in ipairs(S.newsItems) do total=total+S.newsLine(it[1],it[2],nx(),tone) end
  if not S.fx.newsPicTop then total=total+S.newsPhoto(nx()) end
  card("有哪块还是看着不顺，直接说，我改就是了。\n—— 慢慢来，不赶。",36,nx())
  local f=Instance.new("Frame",sf) f.Size=UDim2.new(1,-8,0,64) f.LayoutOrder=nx() f.BackgroundColor3=col(tone[1]) f.BackgroundTransparency=0.2 f.ZIndex=4 C(f,10) K(f,col(tone[2]),1)
  local av=Instance.new("ImageLabel",f) S.aboutAv=av av.Size=UDim2.fromOffset(44,44) av.Position=UDim2.fromOffset(10,10) av.BackgroundColor3=Color3.fromRGB(52,62,84) av.Image=S.headI or "" av.ScaleType=Enum.ScaleType.Crop av.ZIndex=5 C(av,22)
  local nm=Instance.new("TextLabel",f) nm.Size=UDim2.new(1,-70,0,22) nm.Position=UDim2.fromOffset(64,10) nm.BackgroundTransparency=1 nm.Text="墨墨" nm.TextColor3=Color3.fromRGB(0,229,255) nm.Font=S.F nm.TextSize=15 nm.TextXAlignment=Enum.TextXAlignment.Left nm.ZIndex=5
  local ds=Instance.new("TextLabel",f) ds.Size=UDim2.new(1,-70,0,22) ds.Position=UDim2.fromOffset(64,32) ds.BackgroundTransparency=1 ds.Text="成员 · 陪着把界面一点点捋顺" ds.TextColor3=Color3.fromRGB(178,192,212) ds.Font=S.G ds.TextSize=10 ds.TextXAlignment=Enum.TextXAlignment.Left ds.ZIndex=5
  total=total+71 sf.CanvasSize=UDim2.new(0,0,0,total+24)
  if S.newsSay then S.newsSay(#S.newsItems.." 条 · 图在"..(S.fx.newsPicTop and "上" or "下")) end end
 S.renderNews()
 local nb=Instance.new("TextButton",p) nb.Size=UDim2.fromOffset(88,24) nb.Position=UDim2.new(1,-96,1,-30) nb.BackgroundColor3=Color3.fromRGB(0,110,150) nb.Text="公告助手" nb.TextColor3=Color3.new(1,1,1) nb.Font=S.GB nb.TextSize=10 nb.ZIndex=8 C(nb,7)
 tap(nb,function() S.newsWanted=true if S.newsPanel then S.newsPanel.Visible=not S.newsPanel.Visible elseif S.flash then S.flash("公告助手那段还没跑到") end end)
 S.ready=8 S.flash("8 OK · 照片最顶，1.1.0→1.6.0 时间线")
end
-- 9
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.renderNews then
 S.newsSay=function(x) if S.newsState then S.newsState.Text=x end end
 S.newsAdd=function(txt) if type(txt)~="string" or txt=="" then S.newsSay("先写点什么") return end
  local n=#S.newsItems table.insert(S.newsItems,{"1.6."..tostring(math.max(1,n-5)),txt}) S.renderNews() S.newsSay("加好啦 · "..#S.newsItems.." 条") end
 S.newsDel=function() if #S.newsItems<=1 then S.newsSay("至少留一条") return end table.remove(S.newsItems) S.renderNews() S.newsSay("删了末条 · "..#S.newsItems.." 条") end
 S.newsMove=function(d) local n=#S.newsItems local j=n+d if j<1 or j>n then S.newsSay("到头啦") return end
  S.newsItems[n],S.newsItems[j]=S.newsItems[j],S.newsItems[n] S.renderNews() S.newsSay((d<0 and "上移" or "下移").."好啦") end
 S.newsPicPos=function() S.fx.newsPicTop=not S.fx.newsPicTop S.renderNews() S.newsSay("配图挪到"..(S.fx.newsPicTop and "上" or "下").."了") end
 S.newsFontCycle=function() local a={10,11,13} local k=1 for i,v in ipairs(a) do if v==S.fx.newsFont then k=i end end
  S.fx.newsFont=a[k%#a+1] S.renderNews() S.newsSay("字号 "..S.fx.newsFont) end
 S.newsToneCycle=function() S.fx.newsTone=S.fx.newsTone%#S.newsTones+1 S.renderNews() S.newsSay("配色 第"..S.fx.newsTone.."套") end
 S.newsCopy=function() local t={"索尼克更新公告 · 1.1.0 → 1.6.0",""}
  for _,it in ipairs(S.newsItems) do table.insert(t,it[1].." · "..it[2]) end
  table.insert(t,"") table.insert(t,"—— 李佳 · 慢慢来，不赶")
  local ok=pcall(function() if setclipboard then setclipboard(table.concat(t,"\n")) else error("no") end end)
  S.newsSay(ok and "全文复制好啦" or "这边不支持复制") end
 S.newsReset=function() S.newsItems={} for _,v in ipairs(S.newsDefault) do table.insert(S.newsItems,{v[1],v[2]}) end
  S.fx.newsFont=11 S.fx.newsTone=1 S.fx.newsPicTop=true if S.newsBox then S.newsBox.Text="" end
  S.renderNews() S.newsSay("还原成 1.1.0→1.6.0 啦") end
 S.ready=9 S.flash("9 OK · 加删移、图位、字号、配色、复制、还原")
end
-- 10
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.main and S.newsAdd then
 local C,K,tap=S.C,S.K,S.tap
 local pn=Instance.new("Frame",S.main) S.newsPanel=pn pn.Size=UDim2.fromOffset(246,232) pn.Position=UDim2.new(1,-258,1,-244)
 pn.BackgroundColor3=Color3.fromRGB(22,28,40) pn.BackgroundTransparency=0.03 pn.ZIndex=22 pn.Visible=false pn.Active=true C(pn,12) K(pn,Color3.fromRGB(150,190,230),1.2)
 if S.drag then S.drag(pn,pn) end
 local h=Instance.new("TextLabel",pn) h.Size=UDim2.new(1,-56,0,22) h.Position=UDim2.fromOffset(10,4) h.BackgroundTransparency=1 h.Text="公告助手 · 慢慢改" h.TextColor3=Color3.fromRGB(225,240,252) h.Font=S.GB h.TextSize=11 h.TextXAlignment=Enum.TextXAlignment.Left h.ZIndex=23
 local x=Instance.new("TextButton",pn) x.Size=UDim2.fromOffset(36,20) x.Position=UDim2.new(1,-42,0,5) x.BackgroundColor3=Color3.fromRGB(90,60,60) x.Text="关" x.TextColor3=Color3.new(1,1,1) x.Font=S.GB x.TextSize=10 x.ZIndex=24 C(x,6)
 tap(x,function() pn.Visible=false S.newsWanted=false end)
 local box=Instance.new("TextBox",pn) S.newsBox=box box.Size=UDim2.new(1,-20,0,28) box.Position=UDim2.fromOffset(10,28)
 box.BackgroundColor3=Color3.fromRGB(34,42,58) box.Text="" box.PlaceholderText="写点什么…" box.TextColor3=Color3.fromRGB(230,238,250) box.PlaceholderColor3=Color3.fromRGB(140,155,180) box.Font=S.G box.TextSize=11 box.TextXAlignment=Enum.TextXAlignment.Left box.ZIndex=23 C(box,7)
 local function grid(y,names,cb) for i,t in ipairs(names) do local b=Instance.new("TextButton",pn)
  b.Size=UDim2.new(1/#names,-6,0,26) b.Position=UDim2.new((i-1)/#names,4,0,y) b.BackgroundColor3=Color3.fromRGB(44,56,76)
  b.Text=t b.TextColor3=Color3.new(1,1,1) b.Font=S.GB b.TextSize=10 b.ZIndex=23 C(b,7) tap(b,function() cb(i,t) end) end end
 grid(62,{"加","删","↑","↓"},function(i) if i==1 then S.newsAdd(box.Text) box.Text="" elseif i==2 then S.newsDel() elseif i==3 then S.newsMove(-1) else S.newsMove(1) end end)
 grid(94,{"图位","字号","配色","复制"},function(i) if i==1 then S.newsPicPos() elseif i==2 then S.newsFontCycle() elseif i==3 then S.newsToneCycle() else S.newsCopy() end end)
 grid(126,{"还原","收起","预览","清空字"},function(i) if i==1 then S.newsReset() elseif i==2 then pn.Visible=false S.newsWanted=false elseif i==3 then if S.renderNews then S.renderNews() end S.newsSay("重排好啦") else box.Text="" S.newsSay("字清了") end end)
 local tip=Instance.new("TextLabel",pn) tip.Size=UDim2.new(1,-20,0,16) tip.Position=UDim2.fromOffset(10,158) tip.BackgroundTransparency=1 tip.Text="版本自动接 1.6.x · 点「加」就插一条" tip.TextColor3=Color3.fromRGB(150,170,195) tip.Font=S.G tip.TextSize=9 tip.TextXAlignment=Enum.TextXAlignment.Left tip.ZIndex=23
 local st=Instance.new("TextLabel",pn) S.newsState=st st.Size=UDim2.new(1,-20,0,22) st.Position=UDim2.fromOffset(10,180) st.BackgroundTransparency=1 st.Text=#S.newsItems.." 条 · 图在上" st.TextColor3=Color3.fromRGB(180,220,245) st.Font=S.GB st.TextSize=10 st.TextXAlignment=Enum.TextXAlignment.Left st.ZIndex=23
 local ver=Instance.new("TextLabel",pn) ver.Size=UDim2.new(1,-20,0,18) ver.Position=UDim2.fromOffset(10,206) ver.BackgroundTransparency=1 ver.Text="SONIC CENTER · 1.6 · 李佳" ver.TextColor3=Color3.fromRGB(130,150,175) ver.Font=S.G ver.TextSize=9 ver.TextXAlignment=Enum.TextXAlignment.Left ver.ZIndex=23
 if S.newsWanted then pn.Visible=true end
 S.ready=10 S.flash("10 OK · 公告助手面板好了")
end
-- 11
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.ui then
 S.songs={} S.songHave={}
 S.addSong=function(d) for x in string.gmatch(d,"[^,]+") do local n,i=string.match(x,"^(.+)|(.+)$") if n and i then local q=string.gsub(i,"%D","") if q~="" and q~="0" and not S.songHave[q] then S.songHave[q]=true table.insert(S.songs,{n,q}) end end end end
 S.addSong("夜曲|139355201644243,无人之岛|130495965769206,谁|72851972399903,我落泪情绪零碎|105189449355727,爱的魔法|99072612944031,")
 S.addSong("バケモノの唄|97167128665860,戒烟|DJ137671588958036,还是会想你|99273396965612,Dear|D139047831212058,暗号|DJ96939204814618,")
 S.addSong("忘不掉的你|DJ91111816286323,绽放|DJ92704906799929,茫|72194943092340,指纹|113798735846049,还是分开|DJ101136970619190,")
 S.addSong("习惯失恋|100478906582054,予你|95046772314693,罗生门|79952466129206,素颜|140059572207849,说好不哭|75343620587168,")
 S.addSong("轨迹|DJ93907466733987,爱我还是他|DJ71801490652455,疑心病|DJ121880194994661,零距离的思念|DJ103782895676850,打火机|DJ106163933475151,")
 S.addSong("春娇与志明|98977211342698,给我一首歌的时间|94967211880052,后来的我们|88911753578536,一半一半|128156526887288,简单爱|75411698017571,")
 S.addSong("失落沙洲|131288163821477,晴天|DJ104378518510338,稻香|DJ97203442342796,一路向北|DJ1338884933067429,相爱分开都是罪|DJ109568605202834,")
 S.addSong("熄灭|DJ100142785903247,恋人|DJ105376199372918,喜欢|97028156179884,颜人中晚安|74109718138291,")
 S.addSong("古风合集|132048319229461,告白气球|853730121712,牵丝戏|DJ87434869764368,苦茶子|DJ112814263629711,花海|DJ100728815581027,")
 S.addSong("童话 R&B|138035967202065,好想再爱你dj|117348835337373,四季予你|107805764985856,我本将心向明月|90627502789937,12.31郑润泽|121596439712428,")
 S.addSong("十面埋伏|DJ99248598986390,海阔天空伴奏|125897274540057,幸福之家|DJ108166412807308,小半（燕子版）|116280749893150,人鱼的眼泪|13579937103146,")
 S.addSong("七里香女声|104757299933238,春庭雪|117458494859278,海屿你原版|76421239273915,我知道|122402418775489,广东爱情故事|108067557520671,")
 S.addSong("幻昼|103093530102792,一样的月光|86582687674232,于是|132959953803661")
 S.ready=11 S.flash("11 OK")
end
-- 12
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.addSong then
 S.addSong("我们之间的回忆|109386756896813,安和桥|120145064597801,小半|82485901858938,瞬DJ|93995930463751,欢乐颂|110807176141277,进步|124597524602869,伤感|103001052289903,教员|3068736836,豪庭|121336636707861,漂移|115262512648819,")
 S.addSong("科比|99519218846428,氛围|130437050908450,唯一|138570939058838,大东北|134786908423441,山歌|124523430035974,新新|5409360995,悠闲|3033155249,兰亭序|135324082524426,进击巨人|89711807693889,奈克赛斯主题曲|91550314012338,")
 S.addSong("父亲|79952652433579,起风了DJ|99498025749186,离开我的依赖|112834898401032,唐人|74173898692517,牵丝戏|82736875196779,辞九门|75361870687357,把回忆|132524361907107,李昊|102072818475050,武家坡|88304207692432,山楂树|114372452919028,")
 S.addSong("陈浩南|89795630567186,海底|117225633780122,张信哲|110803009828636,错位时空|83422989427201,求佛|111568038897020,精卫|124044109756641,迷人的危险|111027647468458,嘉豪|113529393452088,豪大大|2138529498012691,芒种|119341948158777,")
 S.addSong("演员|110094177703357,红昭愿|106036175444448,桃花诺|129089071772937,燕无歇|81179274770282,彩虹小白马|121374695318782,得吃|93898237895661,拼好歌|96144381780240,莫问归期|132049153370517,川普|82518513365412,國歌|1840297174,")
 S.addSong("我拿那个小刀|111431923179857,浴室|13221899427356,爱情讯息DJ|122407020110484,萝莉进行曲炸麦|133260572775867,地狱列车|80712503354465,青衣DJ|95969253144150,redeye|12692220277198,后继者|118896961448948,lovestory|107341259483191,会呼吸的痛|96590819329722,")
 S.addSong("青衣|125615482496831,铡美案|114476517052805,蜜雪|138765729162919,鸟之诗|113665010217108,大江大海|78707318606182,朋友的酒|7912285852432,小幸运|81381619096029,不得不爱|116497979556639,印度|112341295870756,共和时代|118957335322667,")
 S.addSong("alone|135894830596180,我的假牙|137981831377836,moon|140248480403863,不值得DJ|131649148795563,寂寞|74085216274793,真兄弟哈基米版|81137321144573,关注塔菲谢谢喵|126774078187195,休闲|105743569519803,森林|74941412980904,新年|1845962816,")
 S.addSong("心做DJ|119719716898695,原神丘丘谣|84177223761751,和平精英死亡音效|94624102598882,oioi|110788401793874,童话镇|129921580107843,啊米诺丝|74180922359181,冲刺|136536224579450,乌鲁鲁|80701295792893,buibuibui|131309848078328,还好吗|104923055259541,")
 S.addSong("坠落|98850529016454,瓦瓦|87859225614251,猪妞|121832229737638,馕馕馕|95489036869789,福瑞|88457346646245,拜刀马|102862957328067,单吃蛋|82152175089703,哈喽大家好|122569721737706")
 S.songCount=#S.songs S.ready=12 S.flash("12 OK "..S.songCount.."首 · 李佳找的")
end
-- 13
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.Pages and S.songs and #S.songs>0 then
 local p,gui,C,K,tap=S.Pages[4],S.ui,S.C,S.K,S.tap
 for _,o in ipairs(p:GetChildren()) do o:Destroy() end
 S.gen=(S.gen or 0)+1 local songs=S.songs
 local mf=Instance.new("Frame",p) mf.Size=UDim2.new(1,0,1,0) mf.BackgroundColor3=Color3.fromRGB(18,21,29) mf.BackgroundTransparency=0.2 mf.ClipsDescendants=true mf.ZIndex=2 C(mf,10) K(mf,Color3.fromRGB(0,190,230),1.4)
 local nc=Instance.new("Frame",mf) nc.Size=UDim2.new(1,-12,0,50) nc.Position=UDim2.fromOffset(6,4) nc.BackgroundColor3=Color3.fromRGB(28,34,46) nc.BackgroundTransparency=0.2 nc.ZIndex=4 C(nc,8)
 local nm=Instance.new("TextLabel",nc) S.mName=nm nm.Size=UDim2.new(1,-16,0,24) nm.Position=UDim2.fromOffset(10,3) nm.BackgroundTransparency=1 nm.Text="李佳找的歌单 · 开机曲播放中" nm.TextColor3=Color3.fromRGB(235,240,250) nm.Font=S.F nm.TextSize=13 nm.TextXAlignment=Enum.TextXAlignment.Left nm.ZIndex=5
 local stt=Instance.new("TextLabel",nc) S.mStat=stt stt.Size=UDim2.new(1,-16,0,18) stt.Position=UDim2.fromOffset(10,27) stt.BackgroundTransparency=1 stt.Text=#songs.." 首 · 点歌单切歌 · 失效自动跳过" stt.TextColor3=Color3.fromRGB(130,145,165) stt.Font=S.G stt.TextSize=10 stt.TextXAlignment=Enum.TextXAlignment.Left stt.ZIndex=5
 local cur,bad=1,{} S.favs={} S.bad=bad S.mCur=function() return cur end
 S.play=function(i,tries) i=math.clamp(i,1,#songs) cur=i local s=songs[i] bad[s[2]]=nil
  S.music.SoundId="rbxassetid://"..s[2] S.music.Looped=true S.music.Volume=1
  pcall(function() S.music:Stop() S.music:Play() end) nm.Text=s[1] stt.Text="加载中…" S.song=s[1]
  if S.winName then S.winName.Text=s[1] end if S.winSub then S.winSub.Text="暂无歌词数据\n"..s[1] end
  if S.update then pcall(S.update) end local gen=S.gen
  task.spawn(function() local o=false for k=1,10 do task.wait(0.25) if S.gen~=gen then return end
   local a,b=nil,nil pcall(function() a=S.music.IsLoaded b=S.music.PlaybackState end)
   if k>=2 and (a==true or b==Enum.PlaybackState.Playing) then o=true break end end
   if S.gen~=gen or cur~=i then return end
   if o then stt.Text="正在播放 · "..#songs.." 首" else bad[s[2]]=true
    if S.fx.songSkip then stt.Text="这首失效，跳下一首" if (tries or 0)<6 then S.play(i%#songs+1,(tries or 0)+1) else stt.Text="多数 ID 失效" end else stt.Text="这首没加载出来" end end end) end
 local function row(y) local r=Instance.new("Frame",mf) r.Size=UDim2.new(1,-12,0,24) r.Position=UDim2.fromOffset(6,y) r.BackgroundTransparency=1 r.ZIndex=5
  local l=Instance.new("UIListLayout",r) l.FillDirection=Enum.FillDirection.Horizontal l.Padding=UDim.new(0,4) return r end
 local function btn(q,w,x) local b=Instance.new("TextButton",q) b.Size=UDim2.new(w,-4,1,0) b.BackgroundColor3=Color3.fromRGB(40,48,62) b.Text=x b.TextColor3=Color3.fromRGB(215,222,232) b.Font=S.GB b.TextSize=10 b.ZIndex=6 C(b,6) K(b,Color3.fromRGB(80,95,125),1) return b end
 local r1=row(58) for i=1,6 do local b=btn(r1,1/6,tostring(i)) tap(b,function() pcall(function() S.play(i,0) end) end) end
 local r2=row(86) local pb,nb,fb,rb,wb=btn(r2,0.2,"上一首"),btn(r2,0.2,"下一首"),btn(r2,0.2,"收藏"),btn(r2,0.2,"随机"),btn(r2,0.2,"玄武窗")
 tap(pb,function() pcall(function() S.play(math.max(1,S.mCur()-1),0) end) end) tap(nb,function() pcall(function() S.play(S.mCur()%#songs+1,0) end) end)
 tap(rb,function() pcall(function() S.play(math.random(1,#songs),0) end) end)
 tap(fb,function() local s=songs[S.mCur()] if not s then return end S.favs[s[2]]=not S.favs[s[2]] fb.Text=S.favs[s[2]] and "已收藏" or "收藏" fb.BackgroundColor3=S.favs[s[2]] and Color3.fromRGB(150,90,20) or Color3.fromRGB(40,48,62) end)
 local ls=Instance.new("ScrollingFrame",p) S.mList=ls ls.Size=UDim2.new(1,-12,1,-116) ls.Position=UDim2.fromOffset(6,114) ls.BackgroundTransparency=1 ls.ScrollBarThickness=3 ls.ScrollBarImageColor3=Color3.fromRGB(0,190,230) ls.CanvasSize=UDim2.new(0,0,0,#songs*36) ls.ZIndex=4
 local ul=Instance.new("UIListLayout",ls) ul.Padding=UDim.new(0,4)
 S.mRebuild=function() for _,r in ipairs(ls:GetChildren()) do if r:IsA("TextButton") then r:Destroy() end end
  for i,s in ipairs(songs) do local b=Instance.new("TextButton",ls) b.Size=UDim2.new(1,-6,0,32) b.BackgroundColor3=bad[s[2]] and Color3.fromRGB(28,26,30) or Color3.fromRGB(30,36,48) b.BackgroundTransparency=0.15
   b.Text=(bad[s[2]] and "  x " or "  ")..i..". "..s[1] b.TextColor3=bad[s[2]] and Color3.fromRGB(110,110,120) or Color3.fromRGB(210,218,230) b.Font=S.G b.TextSize=12 b.TextXAlignment=Enum.TextXAlignment.Left b.ZIndex=5 b.LayoutOrder=i C(b,7)
   tap(b,function() pcall(function() S.play(i,0) end) end) end ls.CanvasSize=UDim2.new(0,0,0,#songs*36) end
 S.mRebuild()
 local win=Instance.new("Frame",gui) S.win=win win.Size=UDim2.fromOffset(240,110) win.Position=UDim2.new(0.5,-120,0,0.72) win.BackgroundColor3=Color3.fromRGB(16,20,28) win.BackgroundTransparency=0.08 win.ZIndex=160 win.Active=true win.Visible=false C(win,14) K(win,Color3.fromRGB(0,200,230),1.2)
 if S.drag then S.drag(win,win) end
 local lh=Instance.new("TextLabel",win) lh.Size=UDim2.new(1,-20,0,22) lh.Position=UDim2.fromOffset(12,8) lh.BackgroundTransparency=1 lh.Text="歌词 · 玄武窗" lh.TextColor3=Color3.fromRGB(0,229,255) lh.Font=S.F lh.TextSize=12 lh.TextXAlignment=Enum.TextXAlignment.Left lh.ZIndex=161
 local lt=Instance.new("TextLabel",win) S.winName=lt lt.Size=UDim2.new(1,-20,0,24) lt.Position=UDim2.fromOffset(12,34) lt.BackgroundTransparency=1 lt.Text=S.CENTER lt.TextColor3=Color3.fromRGB(235,240,250) lt.Font=S.F lt.TextSize=14 lt.TextXAlignment=Enum.TextXAlignment.Left lt.ZIndex=161
 local ls2=Instance.new("TextLabel",win) S.winSub=ls2 ls2.Size=UDim2.new(1,-20,0,40) ls2.Position=UDim2.fromOffset(12,60) ls2.BackgroundTransparency=1 ls2.Text="暂无歌词数据" ls2.TextColor3=Color3.fromRGB(140,155,175) ls2.Font=S.G ls2.TextSize=10 ls2.ZIndex=161
 tap(wb,function() if S.fx.winOn==false then if S.flash then S.flash("玄武窗在配置里关着") end return end win.Visible=not win.Visible wb.Text=win.Visible and "关玄武" or "玄武窗" wb.BackgroundColor3=win.Visible and Color3.fromRGB(0,110,90) or Color3.fromRGB(40,48,62) end)
 S.ready=13 S.flash("13 OK · 随机一首也在了")
end
-- 14
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.Pages then
 local p,C,K,tap=S.Pages[5],S.C,S.K,S.tap
 for _,o in ipairs(p:GetChildren()) do o:Destroy() end
 local tt=Instance.new("TextLabel",p) tt.Size=UDim2.new(1,-20,0,22) tt.Position=UDim2.fromOffset(10,2) tt.BackgroundTransparency=1 tt.Text="外观 · 点哪出哪" tt.TextColor3=Color3.fromRGB(235,242,252) tt.Font=S.F tt.TextSize=14 tt.TextXAlignment=Enum.TextXAlignment.Left tt.ZIndex=4
 local left=Instance.new("Frame",p) left.Size=UDim2.fromOffset(72,72) left.Position=UDim2.fromOffset(4,30) left.BackgroundTransparency=1 left.ZIndex=6
 local function tab(n,y,a) local b=Instance.new("TextButton",left) b.Size=UDim2.new(1,0,0,30) b.Position=UDim2.fromOffset(4,y) b.BackgroundTransparency=1 b.Text=n b.TextColor3=a and Color3.new(1,1,1) or Color3.fromRGB(150,165,185) b.Font=S.GB b.TextSize=12 b.TextXAlignment=Enum.TextXAlignment.Left b.ZIndex=7 return b end
 local qb,ab=tab("画质",0,false),tab("外观",34,true) S.qualityTab=qb S.appearanceTab=ab
 local wheel=Instance.new("Frame",p) wheel.Size=UDim2.fromOffset(158,158) wheel.Position=UDim2.new(0.5,-79,0,28) wheel.ZIndex=4 C(wheel,79)
 local hue=Instance.new("UIGradient",wheel) hue.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(0.167,Color3.fromRGB(255,255,0)),ColorSequenceKeypoint.new(0.333,Color3.fromRGB(0,255,0)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,255)),ColorSequenceKeypoint.new(0.667,Color3.fromRGB(0,0,255)),ColorSequenceKeypoint.new(0.833,Color3.fromRGB(255,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,0))})
 local sh=Instance.new("Frame",wheel) sh.Size=UDim2.new(1,0,1,0) sh.BackgroundColor3=Color3.new(1,1,1) sh.ZIndex=5 C(sh,79)
 local sg=Instance.new("UIGradient",sh) sg.Rotation=90 sg.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)})
 local dot=Instance.new("Frame",wheel) dot.Size=UDim2.fromOffset(13,13) dot.Position=UDim2.new(0.5,-6,0.5,-6) dot.BackgroundColor3=Color3.new(1,1,1) dot.ZIndex=7 C(dot,6) K(dot,Color3.fromRGB(70,70,80),1)
 local hit=Instance.new("TextButton",wheel) hit.Size=UDim2.new(1,0,1,0) hit.BackgroundTransparency=1 hit.Text="" hit.ZIndex=8
 local prev=Instance.new("Frame",p) S.prev=prev prev.Size=UDim2.fromOffset(54,32) prev.Position=UDim2.fromOffset(10,200) prev.BackgroundColor3=Color3.fromRGB(205,168,55) prev.ZIndex=4 C(prev,8)
 local pv=Instance.new("TextLabel",prev) pv.Size=UDim2.new(1,0,1,0) pv.BackgroundTransparency=1 pv.Text="预览" pv.TextColor3=Color3.fromRGB(20,28,24) pv.Font=S.GB pv.TextSize=10 pv.ZIndex=5
 local function pick(i) local x=(i.Position.X-wheel.AbsolutePosition.X)/wheel.AbsoluteSize.X local y=(i.Position.Y-wheel.AbsolutePosition.Y)/wheel.AbsoluteSize.Y
  x=math.clamp(x,0,1) y=math.clamp(y,0,1) local c=Color3.fromHSV(x,y,1)
  if S.applyBar then S.applyBar(c) end dot.Position=UDim2.new(x,-6,y,-6) prev.BackgroundColor3=c end
 hit.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then pick(i) end end)
 hit.InputChanged:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch then pick(i) end end)
 local lab=Instance.new("TextLabel",p) lab.Size=UDim2.new(1,-20,0,18) lab.Position=UDim2.fromOffset(10,210) lab.BackgroundTransparency=1 lab.Text="横向：红黄绿青蓝紫 · 上浅下浓" lab.TextColor3=Color3.fromRGB(160,175,195) lab.Font=S.G lab.TextSize=10 lab.TextXAlignment=Enum.TextXAlignment.Left lab.ZIndex=4
 local r=Instance.new("Frame",p) r.Size=UDim2.new(1,-20,0,26) r.Position=UDim2.fromOffset(10,236) r.BackgroundTransparency=1 r.ZIndex=4
 local function half(x,t,f) local b=Instance.new("TextButton",r) b.Size=UDim2.new(0.48,0,1,0) b.Position=UDim2.new(x,0,0,0) b.BackgroundColor3=Color3.fromRGB(0,120,170) b.Text=t b.TextColor3=Color3.new(1,1,1) b.Font=S.GB b.TextSize=11 b.ZIndex=5 C(b,8) tap(b,f) end
 half(0,"15 套水感",function() if S.miniWin then S.miniWin.Visible=true if S.miniBar then S.miniBar.Visible=false end end end)
 half(0.52,"选图",function() if S.picPanel then S.picPanel.Visible=not S.picPanel.Visible elseif S.flash then S.flash("选图那段还没跑到") end end)
 tap(ab,function() if S.qp then S.qp.Visible=false end qb.TextColor3=Color3.fromRGB(150,165,185) ab.TextColor3=Color3.new(1,1,1) end)
 local qp=Instance.new("Frame",p) qp.Size=UDim2.new(1,-16,1,-36) qp.Position=UDim2.fromOffset(8,32) qp.BackgroundColor3=Color3.fromRGB(24,28,38) qp.BackgroundTransparency=0.02 qp.ZIndex=10 qp.Visible=false C(qp,10) K(qp,Color3.fromRGB(120,140,180),1.2) S.qp=qp
 local qs=Instance.new("TextLabel",qp) S.qStatus=qs qs.Size=UDim2.new(1,-20,0,22) qs.Position=UDim2.fromOffset(10,6) qs.BackgroundTransparency=1 qs.Text="画质 · 等级2 · 阴影关" qs.TextColor3=Color3.fromRGB(180,215,250) qs.Font=S.GB qs.TextSize=12 qs.TextXAlignment=Enum.TextXAlignment.Left qs.ZIndex=11
 local names={"流畅","标准","高清","极致"} local qbs={}
 for i,n in ipairs(names) do local b=Instance.new("TextButton",qp) b.Size=UDim2.new(0.46,-8,0,30) b.Position=UDim2.new((i-1)%2*0.5,10,0,32+math.floor((i-1)/2)*36)
  b.BackgroundColor3=(i==2) and Color3.fromRGB(0,150,110) or Color3.fromRGB(45,52,68) b.Text=n b.TextColor3=Color3.new(1,1,1) b.Font=S.GB b.TextSize=12 b.ZIndex=11 C(b,8) qbs[i]=b
  tap(b,function() for _,c in ipairs(qbs) do c.BackgroundColor3=Color3.fromRGB(45,52,68) end b.BackgroundColor3=Color3.fromRGB(0,150,110) if S.applyQuality then S.applyQuality(i) end end) end
 local fl=Instance.new("TextLabel",qp) fl.Size=UDim2.new(1,-20,0,18) fl.Position=UDim2.fromOffset(10,112) fl.BackgroundTransparency=1 fl.Text="帧率上限" fl.TextColor3=Color3.fromRGB(160,190,220) fl.Font=S.G fl.TextSize=10 fl.TextXAlignment=Enum.TextXAlignment.Left fl.ZIndex=11
 for i,v in ipairs({30,60,120,144,0}) do local t=({"30","60","120","144","解锁"})[i] local b=Instance.new("TextButton",qp)
  b.Size=UDim2.new(0.18,-4,0,26) b.Position=UDim2.new((i-1)*0.2,8,0,134) b.BackgroundColor3=Color3.fromRGB(50,60,80) b.Text=t b.TextColor3=Color3.new(1,1,1) b.Font=S.GB b.TextSize=10 b.ZIndex=11 C(b,6)
  tap(b,function() local o=pcall(function() setfpscap(v) end) S.fx.fpscap=v fl.Text=o and ("帧率上限 · "..t.." 已生效") or "帧率上限 · 这个执行器不支持" end) end
 local bk=Instance.new("TextButton",qp) bk.Size=UDim2.new(1,-20,0,24) bk.Position=UDim2.fromOffset(10,166) bk.BackgroundColor3=Color3.fromRGB(80,90,110) bk.Text="返回" bk.TextColor3=Color3.new(1,1,1) bk.Font=S.GB bk.TextSize=11 bk.ZIndex=11 C(bk,8) tap(bk,function() qp.Visible=false end)
 local dl=Instance.new("TextButton",qp) dl.Size=UDim2.new(1,-20,0,22) dl.Position=UDim2.fromOffset(10,194) dl.BackgroundColor3=Color3.fromRGB(60,90,140) dl.Text="DLSS 5 · 清晰度增强" dl.TextColor3=Color3.new(1,1,1) dl.Font=S.GB dl.TextSize=10 dl.ZIndex=11 C(dl,6)
 tap(dl,function() if S.applyDLSS then S.applyDLSS(not S.fx.dlss5) end dl.Text="DLSS 5 · "..(S.fx.dlss5 and "开" or "关") end)
 tap(qb,function() qp.Visible=true qb.TextColor3=Color3.new(1,1,1) ab.TextColor3=Color3.fromRGB(150,165,185) end)
 if S.miniWin and S.grads then local mw=S.miniWin
  for _,o in ipairs(mw:GetChildren()) do if o:GetAttribute("GB") then pcall(function() o:Destroy() end) end end
  local grid=Instance.new("Frame",mw) grid:SetAttribute("GB",true) grid.Size=UDim2.new(1,-16,1,-40) grid.Position=UDim2.fromOffset(8,32) grid.BackgroundTransparency=1 grid.ZIndex=15
  for i,e in ipairs(S.grads) do local c0=(i-1)%3 local r0=math.floor((i-1)/3) local b=Instance.new("TextButton",grid) b:SetAttribute("GB",true)
   b.Size=UDim2.new(0.31,-4,0,22) b.Position=UDim2.new(c0*0.345,0,0,r0*25) b.BackgroundColor3=Color3.fromRGB(40,50,68) b.Text=e[2] b.TextColor3=Color3.new(1,1,1) b.Font=S.GB b.TextSize=9 b.ZIndex=16 C(b,6)
   pcall(function() local g=Instance.new("UIGradient",b) g.Color=e[1] end) S.tap(b,function() if S.setGrad then S.setGrad(i) end if S.flash then S.flash("水感 · "..e[2]) end end) end
  if S.miniBar then S.miniBar.Text="水感" S.miniBar.Visible=true end if S.setGrad then S.setGrad(S.gradIdx or 1) end end
 S.ready=14 S.flash("14 OK · 色盘 / 真画质 / DLSS 5 / 15 套")
end
-- 15
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.main then
 local C,K,tap=S.C,S.K,S.tap local pics={}
 pcall(function() if type(listfiles)~="function" then return end local ok,lst=pcall(function() return listfiles("") end)
  if not ok or type(lst)~="table" then return end
  for _,f0 in ipairs(lst) do local n=tostring(f0):lower()
   if n:match("%.png$") or n:match("%.jpg$") or n:match("%.jpeg$") then local f=tostring(f0) local short=f:match("([^/\\]+)$") or f
    local d=nil pcall(function() d=readfile(f) end) local use=f
    if type(d)~="string" or #d<=800 then pcall(function() d=readfile(short) end) use=short end
    if type(d)=="string" and #d>800 then table.insert(pics,{use,#d}) end end end end)
 if #pics==0 then for _,nm in ipairs({"sony_bg.png","sony_news.png","sony_card.jpg","sony_head.jpg","bg.png"}) do
  local d=nil pcall(function() if isfile and isfile(nm) then d=readfile(nm) end end) if type(d)=="string" and #d>800 then table.insert(pics,{nm,#d}) end end end
 S.pics=pics
 S.usePic=function(f,slot) local a=nil pcall(function() if getcustomasset then a=getcustomasset(f) end end)
  if not a then local s=tostring(f):match("([^/\\]+)$") if s and s~=f then pcall(function() if getcustomasset then a=getcustomasset(s) end end) end end
  if not a then if S.flash then S.flash("这张读不出来 · 换一张") end return end
  if slot=="bg" then S.bgI=a if S.bg then S.bg.Image=a S.bg.BackgroundTransparency=1 S.bg.ImageTransparency=0.02 S.bg.Visible=true end
  elseif slot=="news" then S.newsI=a if S.newsPic and S.newsPic.Parent then S.newsPic.Image=a end
  elseif slot=="card" then S.cardI=a if S.eI and S.eI.Parent then S.eI.Image=a end
  elseif slot=="head" then S.headI=a if S.nh and S.nh.Parent then S.nh.Image=a end if S.aboutAv and S.aboutAv.Parent then S.aboutAv.Image=a end end
  if S.flash then S.flash("挂好啦 · "..slot) end end
 local panel=Instance.new("Frame",S.main) S.picPanel=panel panel.Size=UDim2.fromOffset(230,210) panel.Position=UDim2.new(0,12,1,-218)
 panel.BackgroundColor3=Color3.fromRGB(22,28,40) panel.BackgroundTransparency=0.04 panel.ZIndex=20 panel.Visible=false C(panel,12) K(panel,Color3.fromRGB(110,190,220),1.2)
 local ph=Instance.new("TextLabel",panel) ph.Size=UDim2.new(1,-56,0,22) ph.Position=UDim2.fromOffset(8,4) ph.BackgroundTransparency=1 ph.Text="本地图 "..#pics.." 张 · 点一下挂上去" ph.TextColor3=Color3.fromRGB(220,235,250) ph.Font=S.GB ph.TextSize=10 ph.TextXAlignment=Enum.TextXAlignment.Left ph.ZIndex=21
 local px=Instance.new("TextButton",panel) px.Size=UDim2.fromOffset(40,20) px.Position=UDim2.new(1,-46,0,5) px.BackgroundColor3=Color3.fromRGB(90,60,60) px.Text="关" px.TextColor3=Color3.new(1,1,1) px.Font=S.GB px.TextSize=10 px.ZIndex=22 C(px,6) tap(px,function() panel.Visible=false end)
 local slots={"bg","news","card","head"} local labels={"背景","公告图","主页图卡","墨墨头像"} local si=1
 local sb=Instance.new("TextButton",panel) sb.Size=UDim2.new(1,-16,0,22) sb.Position=UDim2.fromOffset(8,28) sb.BackgroundColor3=Color3.fromRGB(0,110,150) sb.Text="挂到：背景" sb.TextColor3=Color3.new(1,1,1) sb.Font=S.GB sb.TextSize=10 sb.ZIndex=21 C(sb,6) tap(sb,function() si=si%4+1 sb.Text="挂到："..labels[si] end)
 local ls=Instance.new("ScrollingFrame",panel) ls.Size=UDim2.new(1,-16,1,-58) ls.Position=UDim2.fromOffset(8,54) ls.BackgroundTransparency=1 ls.ScrollBarThickness=3 ls.ZIndex=21 ls.CanvasSize=UDim2.new(0,0,0,math.max(1,#pics)*28)
 local ul=Instance.new("UIListLayout",ls) ul.Padding=UDim.new(0,3)
 for i,it in ipairs(pics) do local b=Instance.new("TextButton",ls) b.Size=UDim2.new(1,-4,0,25) b.LayoutOrder=i b.BackgroundColor3=Color3.fromRGB(36,46,62)
  b.Text=string.sub(tostring(it[1]),1,32).."  "..math.floor(it[2]/1024).."K" b.TextColor3=Color3.fromRGB(215,228,244) b.Font=S.G b.TextSize=9 b.TextXAlignment=Enum.TextXAlignment.Left b.ZIndex=22 C(b,6) tap(b,function() S.usePic(it[1],slots[si]) end) end
 if #pics==0 then local q=Instance.new("TextLabel",ls) q.Size=UDim2.new(1,-8,0,50) q.BackgroundTransparency=1 q.Text="没扫到图 · 把真正的 png/jpg 放进执行器目录" q.TextColor3=Color3.fromRGB(200,215,235) q.Font=S.G q.TextSize=10 q.TextWrapped=true q.ZIndex=22 end
 local tip=Instance.new("TextButton",S.main) tip.Size=UDim2.fromOffset(72,22) tip.Position=UDim2.new(1,-158,1,-28) tip.BackgroundColor3=Color3.fromRGB(60,70,95) tip.Text="选图" tip.TextColor3=Color3.new(1,1,1) tip.Font=S.GB tip.TextSize=10 tip.ZIndex=19 C(tip,8) tap(tip,function() panel.Visible=not panel.Visible end)
 S.ready=15 S.flash(#pics>0 and ("15 OK · 扫到 "..#pics.." 张") or "15 OK · 把 png 放进目录")
end
-- 16
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.fxSpec then
 for k,v in pairs(S.fx) do S.fxDefault[k]=v end
 local O={}
 O.slide={{"关",0},{"轻",20},{"标准",30},{"大",50}} O.rot={{"关",0},{"轻",3},{"标准",5},{"大",9}}
 O.ov={{"0.90",0.90},{"0.95",0.95},{"0.97",0.97},{"0.99",0.99}} O.barW={{"200",200},{"240",240},{"280",280},{"320",320}}
 O.barR={{"6",6},{"10",10},{"14",14},{"18",18}} O.quality={{"流畅",1},{"标准",2},{"高清",3},{"极致",4}}
 O.fpscap={{"30",30},{"60",60},{"120",120},{"144",144},{"解锁",0}}
 local function A(t) for _,x in ipairs(t) do table.insert(S.fxSpec,x) end end
 A({
  {"anim","切页动画","b",true},{"slide","切页位移","p",3,O.slide},{"rot","切页旋转","p",3,O.rot},{"bounce","按钮弹跳","b",true},
  {"ripple","点按涟漪","b",true},{"noticeSpin","公告旋入","b",true},{"avDrop","头像掉落","b",true},{"minScale","收起缩放","b",true},{"openBounce","展开回弹","b",true},
  {"closeSpin","关闭旋转","b",true},{"sweep","顶栏水光","b",true},{"barShine","收起条流光","b",true},{"gradFlow","渐变流动","b",true},
  {"breath","背景呼吸","b",true},{"glow","图卡描边呼吸","b",true},{"shine","主页扫光","b",true},{"edgeGlow","窗口描边辉光","b",true},{"gradCycle","渐变自动轮换","b",false}
 })
 A({
  {"bgOn","背景图显示","b",true},{"softBg","柔化底色","b",false},{"ov","遮罩亮度","p",3,O.ov},{"showBar","收起条状态","b",true},
  {"barW","收起条宽度","p",2,O.barW},{"barR","收起条圆角","p",2,O.barR},{"tabGlow","标签辉光","b",true},{"waterBase","水感底色","b",true},{"gradMain","主窗渐变跟随","b",true}
 })
 A({
  {"quality","真实画质等级","p",2,O.quality},{"fpscap","帧率上限","p",5,O.fpscap},{"shadows","阴影","b",false},{"postfx","后处理","b",false},
  {"fog","雾效","b",false},{"dlss5","DLSS 5 · 清晰度","b",false},{"liveFps","实时帧率","b",true},{"friendAuto","好友自动刷新","b",true},
  {"songSkip","失效自动跳过","b",true},{"winOn","玄武窗可用","b",true}
 })
 A({
  {"debounce","防连点","b",true},{"clickTip","点击提示","b",false},{"flashOn","顶部提示","b",true},{"miniDrag","小窗拖动","b",true},
  {"miniAuto","切页自动收小窗","b",false},{"miniBlur","小窗柔底","b",true},{"miniEdge","小窗描边","b",true},{"dragInertia","拖动回弹","b",false},{"selfCheck","检查系统常驻","b",true}
 })
 S.groupAt={[1]="动效",[10]="光效",[19]="显示",[28]="画质与性能 · 含 DLSS 5",[38]="交互与系统"}
 S.groupY={} S.groupKeys={1,10,19,28,38}
 local F=S.FXSIDE
 F.sweep=function(v) if S.topSweep then S.topSweep.Visible=v end end
 F.barShine=function(v) if S.hShine then S.hShine.Visible=v end end
 F.glow=function(v) if S.cardStroke then S.cardStroke.Color=Color3.fromRGB(90,95,105) end end
 F.shine=function(v) if S.sweep then S.sweep.Visible=v end end
 F.edgeGlow=function(v) if S.ms then S.ms.Thickness=v and 1.8 or 1 S.ms.Color=v and Color3.fromRGB(190,215,245) or Color3.fromRGB(150,175,205) end end
 F.bgOn=function(v) if S.bg then S.bg.Visible=v end end
 F.softBg=function(v) if S.und then S.und.BackgroundColor3=v and Color3.fromRGB(70,80,96) or Color3.fromRGB(120,140,160) end end
 F.ov=function(v) if S.ov then S.ov.BackgroundTransparency=v end end
 F.showBar=function(v) if S.update then pcall(S.update) end end
 F.barW=function(v) if S.update then pcall(S.update) end end
 F.barR=function(v) local c=S.h and S.h:FindFirstChild("UICorner") if c then c.CornerRadius=UDim.new(0,v) end end
 F.tabGlow=function(v) for _,b in ipairs(S.btns or {}) do local k=b:FindFirstChild("UIStroke") if k then k.Color=v and Color3.fromRGB(120,190,220) or Color3.fromRGB(90,110,140) end end end
 F.waterBase=function(v) pcall(function() if S.undGrad then S.undGrad.Enabled=v end end) end
 F.gradMain=function(v) if S.setGrad then S.setGrad(S.gradIdx) end end
 F.quality=function(v) if S.applyQuality then S.applyQuality(v) end end
 F.fpscap=function(v) pcall(function() setfpscap(v) end) end
 F.shadows=function(v) pcall(function() game:GetService("Lighting").GlobalShadows=v end) end
 F.postfx=function(v) pcall(function() for _,o in ipairs(game:GetService("Lighting"):GetChildren()) do if o:IsA("PostEffect") then o.Enabled=v end end end) end
 F.fog=function(v) pcall(function() game:GetService("Lighting").FogEnd=v and 600 or 100000 end) end
 F.dlss5=function(v) if S.applyDLSS then S.applyDLSS(v) end end
 F.liveFps=function(v) if v==false and S.fv then S.fv.Text="--" end end
 F.winOn=function(v) if v==false and S.win then S.win.Visible=false end end
 F.miniBlur=function(v) if S.miniWin then S.miniWin.BackgroundTransparency=v and 0.04 or 0 end end
 F.miniEdge=function(v) if S.miniEdgeStroke then S.miniEdgeStroke.Enabled=v end end
 F.selfCheck=function(v) if S.checkBtn then S.checkBtn.Visible=v end end
 S.ready=16 S.flash("16 OK · "..#S.fxSpec.." 项，DLSS 5 在第 33 位")
end
-- 17
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.Pages and S.fxSpec and #S.fxSpec>0 then
 local p,C,tap=S.Pages[6],S.C,S.tap
 for _,o in ipairs(p:GetChildren()) do o:Destroy() end
 local st=Instance.new("TextLabel",p) st.Size=UDim2.new(1,-16,0,20) st.Position=UDim2.fromOffset(8,2) st.BackgroundTransparency=1
 st.Text="配置 · "..#S.fxSpec.." 项都在这儿" st.TextColor3=Color3.fromRGB(160,210,255) st.Font=S.GB st.TextSize=11 st.TextXAlignment=Enum.TextXAlignment.Center st.ZIndex=4
 S.cfgSay=function(x) st.Text=x end
 local nav=Instance.new("Frame",p) nav.Size=UDim2.new(1,-12,0,22) nav.Position=UDim2.fromOffset(6,22) nav.BackgroundTransparency=1 nav.ZIndex=4
 local sf=Instance.new("ScrollingFrame",p) S.cfgList=sf sf.Size=UDim2.new(1,-12,1,-48) sf.Position=UDim2.fromOffset(6,46) sf.BackgroundTransparency=1 sf.ScrollBarThickness=4 sf.ScrollBarImageColor3=Color3.fromRGB(0,190,230) sf.ZIndex=4
 local ul=Instance.new("UIListLayout",sf) ul.Padding=UDim.new(0,3) ul.SortOrder=Enum.SortOrder.LayoutOrder
 for k=1,5 do local b=Instance.new("TextButton",nav) b.Size=UDim2.new(0.19,0,1,0) b.Position=UDim2.new((k-1)*0.2,0,0,0)
  b.BackgroundColor3=Color3.fromRGB(40,52,72) b.Text=({"动效","光效","显示","画质","交互"})[k] b.TextColor3=Color3.fromRGB(210,225,245) b.Font=S.GB b.TextSize=9 b.ZIndex=5 C(b,5)
  tap(b,function() sf.CanvasPosition=Vector2.new(0,S.groupY[k] or 0) end) end
 local ord=0 local function nx() ord=ord+1 return ord end local y=0
 for i,it in ipairs(S.fxSpec) do
  if S.groupAt[i] then local g=Instance.new("TextLabel",sf) g.Size=UDim2.new(1,-6,0,20) g.LayoutOrder=nx() g.BackgroundTransparency=1
   g.Text="— "..S.groupAt[i].." —" g.TextColor3=Color3.fromRGB(120,190,225) g.Font=S.GB g.TextSize=10 g.TextXAlignment=Enum.TextXAlignment.Left g.ZIndex=5
   local k=1 for q,at in ipairs(S.groupKeys) do if at<=i then k=q end end S.groupY[k]=y y=y+23 end
  local row=Instance.new("Frame",sf) row.Size=UDim2.new(1,-6,0,26) row.LayoutOrder=nx() row.BackgroundColor3=Color3.fromRGB(30,36,48) row.BackgroundTransparency=0.2 row.ZIndex=5 C(row,7)
  local q=Instance.new("TextLabel",row) q.Size=UDim2.new(1,-80,1,0) q.Position=UDim2.fromOffset(8,0) q.BackgroundTransparency=1 q.Text=it[2] q.TextColor3=Color3.fromRGB(205,218,235) q.Font=S.G q.TextSize=10 q.TextXAlignment=Enum.TextXAlignment.Left q.ZIndex=6
  local b=Instance.new("TextButton",row) b.Size=UDim2.fromOffset(66,20) b.Position=UDim2.new(1,-72,0,3) b.BackgroundColor3=Color3.fromRGB(0,150,110) b.TextColor3=Color3.new(1,1,1) b.Font=S.GB b.TextSize=10 b.ZIndex=7 C(b,6)
  local function show() if it[3]=="b" then b.Text=it[4] and "开" or "关" b.BackgroundColor3=it[4] and Color3.fromRGB(0,150,110) or Color3.fromRGB(70,78,92)
   else b.Text=it[5][it[4]][1] b.BackgroundColor3=Color3.fromRGB(0,110,160) end end
  show()
  tap(b,function()
   local v
   if it[3]=="b" then it[4]=not it[4] v=it[4] else it[4]=it[4]%(#it[5])+1 v=it[5][it[4]][2] end
   S.fx[it[1]]=v local f=S.FXSIDE[it[1]] if f then pcall(function() f(v) end) end
   S.cfgSay(it[2].." → "..(it[3]=="b" and (v and "开" or "关") or it[5][it[4]][1])) show() end)
  y=y+29 end
 S.ready=17 S.flash("17 OK · "..#S.fxSpec.." 项全列在原来那个配置菜单里")
end
-- 18
local G=(type(getgenv)=="function" and getgenv()) or _G
local S=G and G.Sony
if S and S.Pages then
 if S.show then S.show(6) end
 if S.qp then S.qp.Visible=false end
 if S.picPanel then S.picPanel.Visible=false end
 if S.newsPanel and not S.newsWanted then S.newsPanel.Visible=false end
 if S.miniWin then S.miniWin.Visible=false end
 if S.miniBar then S.miniBar.Visible=true end
 S.ready=18 if S.flash then S.flash("18 OK · 全部就绪，19/20/21 留着加东西") end
 if S.cfgList then
  local sf,C,tap=S.cfgList,S.C,S.tap local ord=200 local function nx() ord=ord+1 return ord end
  local function btn(t,col,f) local b=Instance.new("TextButton",sf) b.Size=UDim2.new(0.5,-6,0,28) b.LayoutOrder=nx()
   b.BackgroundColor3=col b.Text=t b.TextColor3=Color3.new(1,1,1) b.Font=S.GB b.TextSize=11 b.ZIndex=6 C(b,8) tap(b,f) return b end
  btn("窗口回中",Color3.fromRGB(80,90,110),function() S.main.Position=UDim2.new(0.5,0,0.5,0) S.cfgSay("窗口回中 · 好啦") end)
  btn("重置全部",Color3.fromRGB(110,90,150),function() for k,v in pairs(S.fxDefault or {}) do S.fx[k]=v end
   for k,f in pairs(S.FXSIDE or {}) do pcall(function() f(S.fx[k]) end) end
   if S.setGrad then S.setGrad(1) end if S.applyQuality then S.applyQuality(2) end S.cfgSay("全部回到顺手的样子啦") end)
  btn("保存配置",Color3.fromRGB(0,150,110),function() local ok=pcall(function() local c=S.customColor or Color3.fromRGB(205,168,55)
   if writefile then writefile("sony_cfg.txt",c.r..","..c.g..","..c.b) else error("no") end end) S.cfgSay(ok and "存好啦 · sony_cfg.txt" or "这边不支持存文件") end)
  btn("读取配置",Color3.fromRGB(0,120,180),function() local ok=pcall(function() if not isfile or not isfile("sony_cfg.txt") then error("no") end
   local a,b,c=string.match(readfile("sony_cfg.txt"),"([^,]+),([^,]+),([^,]+)") if a and S.applyBar then S.applyBar(Color3.new(tonumber(a),tonumber(b),tonumber(c))) end end) S.cfgSay(ok and "读回来啦" or "还没存过配置") end)
  btn("公告助手",Color3.fromRGB(60,90,150),function() S.newsWanted=true if S.newsPanel then S.newsPanel.Visible=not S.newsPanel.Visible S.cfgSay("公告助手开啦") else S.cfgSay("助手那段还没跑到") end end)
  local cb=btn("检查系统",Color3.fromRGB(0,120,170),function() if S.runCheck then S.runCheck() else S.cfgSay("检查还没跑到") end end)
  cb.Size=UDim2.new(1,-6,0,28) cb.Visible=S.fx.selfCheck S.checkBtn=cb
  local out=Instance.new("TextLabel",sf) S.checkOut=out out.Size=UDim2.new(1,-6,0,190) out.LayoutOrder=nx() out.BackgroundColor3=Color3.fromRGB(24,30,40) out.BackgroundTransparency=0.15
  out.Text="点「检查系统」逐条看，哪里缺会直说" out.TextColor3=Color3.fromRGB(190,210,230) out.Font=S.G out.TextSize=10 out.TextWrapped=true out.TextXAlignment=Enum.TextXAlignment.Left out.TextYAlignment=Enum.TextYAlignment.Top out.ZIndex=6 C(out,8)
  S.runCheck=function() local L={} local function put(n,ok) table.insert(L,(ok and "✓ " or "× ")..n) end
   local function has(k) for _,it in ipairs(S.fxSpec or {}) do if it[1]==k then return true end end return false end
   put("界面在",S.ui and S.ui.Parent~=nil) put("六标签齐",S.btns and #S.btns==6)
   local np=0 for i=1,6 do if S.Pages[i] and #S.Pages[i]:GetChildren()>0 then np=np+1 end end put("六个页都有内容 ("..np.."/6)",np==6)
   put("公告时间线在",type(S.renderNews)=="function" and #S.newsItems>=6)
   put("公告助手在",S.newsPanel and S.newsPanel.Parent~=nil and type(S.newsAdd)=="function")
   put("四张图挂上",S.bgI~=nil and S.newsI~=nil and S.cardI~=nil and S.headI~=nil)
   put("选图面板在",S.picPanel and S.picPanel.Parent~=nil)
   put("特效 "..#S.fxSpec.." 项",#S.fxSpec>=46) put("DLSS 5 在",has("dlss5") and type(S.applyDLSS)=="function")
   put("检查系统常驻",S.checkBtn and S.checkBtn.Parent~=nil)
   put("歌单 "..tostring(S.songCount or #S.songs).." 首",(S.songCount or #S.songs or 0)>0)
   put("播放 / 画质在",type(S.play)=="function" and type(S.applyQuality)=="function")
   put("15 套水感在",S.grads and #S.grads==15) put("存读可用",type(writefile)=="function" and type(isfile)=="function")
   put("声音在",S.snd and S.snd.Parent~=nil) put("归属 · "..S.OWNER,S.OWNER=="李佳")
   local bad=0 for _,l in ipairs(L) do if l:sub(1,1)=="×" or l:sub(1,3)=="× " then bad=bad+1 end end
   if S.checkOut then S.checkOut.Text=table.concat(L,"\n") end S.cfgSay("查完啦 · "..#L.." 条，× 的就是没跑到") end
 end
end
