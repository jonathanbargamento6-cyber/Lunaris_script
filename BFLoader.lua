--[[
	╔══════════════════════════════════════════════╗
	║   𝘾𝙊𝙇𝙎 ✘ Void  ·  LocalScript (mobile + PC)  ║
	╚══════════════════════════════════════════════╝

	WHERE TO PUT IT
	  StarterPlayer > StarterPlayerScripts  →  LocalScript

	WHERE TO PUT YOUR FUNCTIONS
	  1) Section "2. FUNCTION ZONE" (SCRIPT_BUTTONS and MORE_BUTTONS), or
	  2) From the end of the script:
	       COLSNV.Scripts[1]:SetCallback(function(active) ... end)

	Buttons ship empty — they do nothing until you wire a function.
]]

local Players           = game:GetService("Players")
local TweenService      = game:GetService("TweenService")
local UserInputService  = game:GetService("UserInputService")
local RunService        = game:GetService("RunService")

local player    = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local previous = playerGui:FindFirstChild("COLSNV")
if previous then previous:Destroy() end

------------------------------------------------------------------------
-- 1. SETTINGS
------------------------------------------------------------------------
local SETTINGS = {
	Title         = "𝘾𝙊𝙇𝙎 ✘ Void",
	Subtitle      = "// VOID INTERFACE",
	LogoId        = "rbxassetid://107391174248131",
	ShowIntro     = true,
	DesignSize    = Vector2.new(500, 360),
	ScaleMin      = 0.6,
	ScaleMax      = 1.4,
	ScaleDefault  = 1,
	DefaultTheme  = "Void",
	DefaultFont   = "Gotham",
}

------------------------------------------------------------------------
-- 2. FUNCTION ZONE  (put YOUR functions here)
--    Toggle = true  → button flips ON/OFF, callback receives true/false
--    Toggle = false → one-shot action button
------------------------------------------------------------------------
local function runRemote(name, fn)
	local ok, err = pcall(fn)
	if not ok then
		warn("[𝘾𝙊𝙇𝙎 ✘ Void] error in '" .. tostring(name) .. "': " .. tostring(err))
	end
end

local SCRIPT_BUTTONS = {
	{ Name = "Fyy", Toggle = false, Callback = function()
		runRemote("Fyy", function()
			loadstring(game:HttpGet("https://FyyCommunity.com"))()
		end)
	end },
	{ Name = "Clover", Toggle = false, Callback = function()
		runRemote("Clover", function()
			loadstring(game:HttpGet("https://cloverhub.app/clover.lua"))()
		end)
	end },
	{ Name = "Fox", Toggle = false, Callback = function()
		runRemote("Fox", function()
			loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/359e97f8618e9008afe5f496184ebb7c.lua"))()
		end)
	end },
	{ Name = "Lennon", Toggle = false, Callback = function()
		runRemote("Lennon", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/lennonxscripts/lennonhubv4/refs/heads/main/stealanegg", true))()
		end)
	end },
	{ Name = "Real Kid", Toggle = false, Callback = function()
		runRemote("Real Kid", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/realkidhub/realkid/refs/heads/main/main.lua"))()
		end)
	end },
	{ Name = "Limbo", Toggle = false, Callback = function()
		runRemote("Limbo", function()
			loadstring(game:HttpGet("https://limbohub.my.id/loader.lua"))()
		end)
	end },
	{ Name = "Miranda", Toggle = false, Callback = function()
		runRemote("Miranda", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/mirandahub/loader/refs/heads/main/stealeggies"))()
		end)
	end },
	{ Name = "Fn", Toggle = false, Callback = function()
		runRemote("Fn", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Fn-stealanegg.lua"))()
		end)
	end },
	{ Name = "Decode", Toggle = false, Callback = function()
		runRemote("Decode", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/ItzYumi/Decode/refs/heads/main/DE%3ACODE.lua", true))()
		end)
	end },
	{ Name = "Chilli", Toggle = false, Callback = function()
		runRemote("Chilli", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
		end)
	end },
	{ Name = "LKZ", Toggle = false, Callback = function()
		runRemote("LKZ", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/LucasggkX/LKZ-Hub/refs/heads/main/Loader.lua"))()
		end)
	end },
	{ Name = "Pulse", Toggle = false, Callback = function()
		runRemote("Pulse", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/PulseZax/Loader/refs/heads/main/.lua"))()
		end)
	end },
	{ Name = "Nexori", Toggle = false, Callback = function()
		runRemote("Nexori", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Dayvinksthik/Script/refs/heads/main/Games/JoshBNS-Crack.lua"))()
		end)
	end },
	{ Name = "SAE Shader", Toggle = false, Callback = function()
		runRemote("SAE Shader", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/swaggayoung581-sudo/special-computing-machine/refs/heads/main/SAE_HUB_MENU_SKY_ACCESSORY_ANIM_FIXED_FOV_ANIM_COMPACT_SAVE_CONFIG.lua%20(1).txt"))()
		end)
	end },
}

local MORE_BUTTONS = {
	{ Name = "OPTION 1", Toggle = true, Callback = function(enabled)
		-- ▼▼▼ YOUR OPTION 1 FUNCTION HERE ▼▼▼

		-- ▲▲▲ END ▲▲▲
	end },
	{ Name = "OPTION 2", Toggle = true, Callback = function(enabled)
		-- ▼▼▼ YOUR OPTION 2 FUNCTION HERE ▼▼▼

		-- ▲▲▲ END ▲▲▲
	end },
	{ Name = "OPTION 3", Toggle = false, Callback = function()
		-- ▼▼▼ YOUR OPTION 3 FUNCTION HERE ▼▼▼

		-- ▲▲▲ END ▲▲▲
	end },
}

------------------------------------------------------------------------
-- 3. DATA: THEMES AND FONTS
------------------------------------------------------------------------
local function rgb(r, g, b) return Color3.fromRGB(r, g, b) end
local WHITE = Color3.new(1, 1, 1)
local BLACK = Color3.new(0, 0, 0)

local THEMES = {
	Void    = { Bg = rgb(6, 6, 9),   Panel = rgb(12, 12, 17),  Button = rgb(20, 20, 28),  Accent = rgb(190, 200, 255), Glow = rgb(120, 130, 255), Highlight = rgb(245, 246, 255), Text = rgb(232, 234, 245), Sub = rgb(110, 114, 132), Line = rgb(40, 42, 58) },
	Ink     = { Bg = rgb(4, 4, 4),   Panel = rgb(11, 11, 11),  Button = rgb(19, 19, 19),  Accent = rgb(240, 240, 240), Glow = rgb(160, 160, 160), Highlight = rgb(255, 255, 255), Text = rgb(230, 230, 230), Sub = rgb(100, 100, 100), Line = rgb(30, 30, 30) },
	Ember   = { Bg = rgb(10, 6, 6),  Panel = rgb(18, 11, 10),  Button = rgb(28, 17, 14),  Accent = rgb(255, 90, 45),   Glow = rgb(255, 150, 60),  Highlight = rgb(255, 230, 210), Text = rgb(250, 240, 235), Sub = rgb(150, 110, 95),  Line = rgb(56, 28, 20) },
	Static  = { Bg = rgb(5, 8, 10),  Panel = rgb(10, 15, 19),  Button = rgb(16, 24, 30),  Accent = rgb(0, 235, 210),   Glow = rgb(255, 45, 165),  Highlight = rgb(220, 255, 250), Text = rgb(228, 250, 246), Sub = rgb(95, 145, 145),  Line = rgb(20, 50, 55) },
	Frost   = { Bg = rgb(7, 10, 16), Panel = rgb(12, 18, 28),  Button = rgb(18, 27, 42),  Accent = rgb(120, 200, 255), Glow = rgb(80, 140, 255),  Highlight = rgb(225, 240, 255), Text = rgb(232, 242, 252), Sub = rgb(110, 130, 155), Line = rgb(24, 38, 58) },
	Mono    = { Bg = rgb(14, 14, 14), Panel = rgb(22, 22, 22),  Button = rgb(32, 32, 32),  Accent = rgb(230, 230, 230), Glow = rgb(180, 180, 180), Highlight = rgb(255, 255, 255), Text = rgb(240, 240, 240), Sub = rgb(130, 130, 130), Line = rgb(45, 45, 45) },
}
local THEME_ORDER = { "Void", "Ink", "Ember", "Static", "Frost", "Mono" }

local function pickFont(name)
	local ok, f = pcall(function() return Enum.Font[name] end)
	return ok and f or Enum.Font.Gotham
end
local FONTS = {
	Gotham   = { Regular = pickFont("Gotham"),     Bold = pickFont("GothamBold") },
	GothamMed= { Regular = pickFont("GothamMedium"), Bold = pickFont("GothamBold") },
	Michroma = { Regular = pickFont("Michroma"),   Bold = pickFont("Michroma") },
	Jura     = { Regular = pickFont("Jura"),       Bold = pickFont("Jura") },
	SciFi    = { Regular = pickFont("SciFi"),      Bold = pickFont("SciFi") },
	Code     = { Regular = pickFont("Code"),       Bold = pickFont("Code") },
}
local FONT_ORDER = { "Gotham", "GothamMed", "Michroma", "Jura", "SciFi", "Code" }

if not THEMES[SETTINGS.DefaultTheme] then SETTINGS.DefaultTheme = "Void" end
if not FONTS[SETTINGS.DefaultFont]  then SETTINGS.DefaultFont  = "Gotham" end

------------------------------------------------------------------------
-- 4. STATE AND BASE HELPERS
------------------------------------------------------------------------
local EASE, DIR = Enum.EasingStyle, Enum.EasingDirection
local hasLogo = SETTINGS.LogoId ~= ""

local State = {
	Theme     = SETTINGS.DefaultTheme,
	Overrides = {},
	Font      = SETTINGS.DefaultFont,
	UserScale = SETTINGS.ScaleDefault,
	Open      = false,
	Busy      = false,
	Gen       = 0,
	Tab       = nil,
	Pos       = Vector2.new(0, 0),
	LPos      = Vector2.new(16, 140),
}

local Refreshers   = {}
local FontLabels   = setmetatable({}, { __mode = "k" })
local KillTweens   = {}  -- tween cancellation registry

local function getColor(role)
	return State.Overrides[role] or THEMES[State.Theme][role]
end

local function tween(obj, props, t, style, dir)
	local tw = TweenService:Create(obj, TweenInfo.new(t or 0.25, style or EASE.Quint, dir or DIR.Out), props)
	tw:Play()
	table.insert(KillTweens, tw)
	return tw
end

local function set(obj, props, animated, t)
	if animated then
		tween(obj, props, t or 0.25)
	else
		for k, v in pairs(props) do obj[k] = v end
	end
end

local function merge(a, b)
	local r = {}
	for k, v in pairs(a) do r[k] = v end
	for k, v in pairs(b or {}) do r[k] = v end
	return r
end

local function make(class, props, parent)
	local o = Instance.new(class)
	if o:IsA("GuiObject") then o.BorderSizePixel = 0 end
	for k, v in pairs(props or {}) do o[k] = v end
	o.Parent = parent
	return o
end

local function onTheme(fn)
	fn(false)
	table.insert(Refreshers, fn)
end

local function bind(inst, prop, role)
	onTheme(function(animated)
		set(inst, { [prop] = getColor(role) }, animated, 0.3)
	end)
end

local function applyTheme(animated)
	for _, fn in ipairs(Refreshers) do fn(animated) end
end

local function corner(o, r)
	return make("UICorner", { CornerRadius = UDim.new(0, r) }, o)
end

local function stroke(o, thickness, role, transparency)
	local s = make("UIStroke", {
		Thickness = thickness,
		Transparency = transparency or 0,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	}, o)
	if role then bind(s, "Color", role) end
	return s
end

local function padding(o, l, t, r, b)
	t = t or l
	r = r or l
	b = b or t
	return make("UIPadding", {
		PaddingLeft = UDim.new(0, l), PaddingTop = UDim.new(0, t),
		PaddingRight = UDim.new(0, r), PaddingBottom = UDim.new(0, b),
	}, o)
end

local function registerFont(l, bold)
	FontLabels[l] = bold and "Bold" or "Regular"
	l.Font = FONTS[State.Font][FontLabels[l]]
end

local function applyFont()
	for l, weight in pairs(FontLabels) do
		l.Font = FONTS[State.Font][weight]
	end
end

local function sizeCap(l, maxSize)
	l.TextScaled = true
	make("UITextSizeConstraint", { MaxTextSize = maxSize, MinTextSize = 6 }, l)
end

local function label(parent, props, role, bold)
	local l = make("TextLabel", merge({
		BackgroundTransparency = 1, Text = "", TextSize = 14,
		TextColor3 = WHITE, TextXAlignment = Enum.TextXAlignment.Center,
	}, props), parent)
	registerFont(l, bold)
	if role then bind(l, "TextColor3", role) end
	return l
end

-- Scan-line sweep across a stroke. Thin bright band, dark shell.
local function scanGradient(strokeObj, dynamic)
	strokeObj.Color = WHITE
	local g = make("UIGradient", { Rotation = 90 }, strokeObj)
	local function paint()
		local a, b = getColor("Line"), getColor("Accent")
		g.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, a),
			ColorSequenceKeypoint.new(0.45, a),
			ColorSequenceKeypoint.new(0.5, b),
			ColorSequenceKeypoint.new(0.55, a),
			ColorSequenceKeypoint.new(1, a),
		})
	end
	paint()
	if dynamic then table.insert(Refreshers, paint) end
	TweenService:Create(g, TweenInfo.new(3.2, EASE.Linear, DIR.Out, -1), { Rotation = 270 }):Play()
	return g
end

-- Static shine band on text. Slower, subtler than before.
local function shineGradient(textObj, role, dynamic)
	textObj.TextColor3 = WHITE
	local g = make("UIGradient", { Offset = Vector2.new(1, 0) }, textObj)
	local function paint()
		local c = getColor(role)
		g.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, c),
			ColorSequenceKeypoint.new(0.42, c),
			ColorSequenceKeypoint.new(0.5, WHITE),
			ColorSequenceKeypoint.new(0.58, c),
			ColorSequenceKeypoint.new(1, c),
		})
	end
	paint()
	if dynamic then table.insert(Refreshers, paint) end
	TweenService:Create(g, TweenInfo.new(2.4, EASE.Sine, DIR.InOut, -1, false, 1.2), { Offset = Vector2.new(-1, 0) }):Play()
	return g
end

-- Sparse particles: thin vertical streaks, not dots.
local function startParticles(container, count, alive, role)
	for _ = 1, count do
		local w = math.random(1, 2)
		local h = math.random(8, 22)
		local p = make("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(w, h),
			BackgroundTransparency = 1,
			BackgroundColor3 = getColor(role),
			ZIndex = 0,
		}, container)
		corner(p, 1)
		task.spawn(function()
			task.wait(math.random() * 2)
			while alive() and p.Parent do
				local x = math.random()
				local dur = 4 + math.random() * 3
				p.Position = UDim2.fromScale(x, 1.05)
				p.BackgroundColor3 = getColor(role)
				p.BackgroundTransparency = 1
				tween(p, { Position = UDim2.fromScale(math.clamp(x + (math.random() - 0.5) * 0.06, 0, 1), -0.05) }, dur, EASE.Linear)
				tween(p, { BackgroundTransparency = 0.4 }, dur * 0.3, EASE.Sine)
				task.wait(dur * 0.6)
				tween(p, { BackgroundTransparency = 1 }, dur * 0.4, EASE.Sine)
				task.wait(dur * 0.4)
			end
			p:Destroy()
		end)
	end
end

local function addFeedback(btn, onHover)
	local sc = make("UIScale", { Scale = 1 }, btn)
	btn.InputBegan:Connect(function(input)
		local t = input.UserInputType
		if t ~= Enum.UserInputType.MouseButton1 and t ~= Enum.UserInputType.Touch then return end
		tween(sc, { Scale = 0.96 }, 0.08, EASE.Sine)
		local conn
		conn = input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				conn:Disconnect()
				tween(sc, { Scale = 1 }, 0.25, EASE.Back)
			end
		end)
	end)
	if onHover then
		btn.MouseEnter:Connect(function() onHover(true) end)
		btn.MouseLeave:Connect(function() onHover(false) end)
	end
	return sc
end

local function ripple(frame, input)
	if not input or not input.Position then return end
	local sz = frame.AbsoluteSize
	if sz.X < 1 or sz.Y < 1 then return end
	local rel = Vector2.new(input.Position.X, input.Position.Y) - frame.AbsolutePosition
	local r = make("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(math.clamp(rel.X / sz.X, 0, 1), math.clamp(rel.Y / sz.Y, 0, 1)),
		Size = UDim2.fromOffset(0, 0),
		BackgroundColor3 = getColor("Glow"),
		BackgroundTransparency = 0.6,
		ZIndex = frame.ZIndex + 1,
	}, frame)
	make("UICorner", { CornerRadius = UDim.new(0.5, 0) }, r)
	tween(r, { Size = UDim2.fromOffset(260, 260), BackgroundTransparency = 1 }, 0.55, EASE.Quad).Completed:Once(function()
		r:Destroy()
	end)
end

local function makeDraggable(handle, getPos, setPos, onTap)
	handle.InputBegan:Connect(function(input)
		local t = input.UserInputType
		if t ~= Enum.UserInputType.MouseButton1 and t ~= Enum.UserInputType.Touch then return end
		local startMouse = Vector2.new(input.Position.X, input.Position.Y)
		local startPos = getPos()
		local moved = 0
		local moveConn, endConn
		moveConn = UserInputService.InputChanged:Connect(function(i)
			if i == input or (t == Enum.UserInputType.MouseButton1 and i.UserInputType == Enum.UserInputType.MouseMovement) then
				local d = Vector2.new(i.Position.X, i.Position.Y) - startMouse
				moved = math.max(moved, d.Magnitude)
				setPos(startPos + d)
			end
		end)
		endConn = input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				moveConn:Disconnect()
				endConn:Disconnect()
				if onTap and moved < 8 then onTap() end
			end
		end)
	end)
end

------------------------------------------------------------------------
-- 5. SCREEN, SCALE, POSITION
------------------------------------------------------------------------
local gui = make("ScreenGui", {
	Name = "COLSNV",
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	DisplayOrder = 100,
}, playerGui)

do
	local t0 = os.clock()
	while gui.AbsoluteSize.X < 2 and os.clock() - t0 < 2 do task.wait() end
end

local function viewport()
	local v = gui.AbsoluteSize
	if v.X < 2 or v.Y < 2 then
		local cam = workspace.CurrentCamera
		v = cam and cam.ViewportSize or Vector2.new(800, 600)
	end
	return v
end

local DW, DH = SETTINGS.DesignSize.X, SETTINGS.DesignSize.Y
local RAIL_W, TOP_H = 116, 54

local function computeScale()
	local vp = viewport()
	local fit = math.min((vp.X * 0.96) / DW, (vp.Y * 0.94) / DH)
	local base = math.min(fit * 0.92, 1.15)
	return math.max(math.min(base * State.UserScale, fit), 0.3)
end

local openUI, closeUI, selectTab, pulse

------------------------------------------------------------------------
-- 6. MAIN WINDOW
------------------------------------------------------------------------
local Root = make("Frame", {
	Name = "Root",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromOffset(DW, DH),
	BackgroundTransparency = 1,
	Visible = false,
}, gui)
local WinScale = make("UIScale", { Scale = 1 }, Root)

local Shadow = make("Frame", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(0.5, 0, 0.5, 14),
	Size = UDim2.new(1, 44, 1, 44),
	BackgroundColor3 = BLACK,
	BackgroundTransparency = 0.82,
	ZIndex = 1,
}, Root)
corner(Shadow, 4)

local Window = make("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 0.02, ZIndex = 2 }, Root)
bind(Window, "BackgroundColor3", "Bg")
corner(Window, 6)
local WinStroke = make("UIStroke", { Thickness = 1.5, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, Window)
scanGradient(WinStroke, true)

local Ambient = make("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ClipsDescendants = true }, Window)
corner(Ambient, 6)
local Content = make("CanvasGroup", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1 }, Window)
corner(Content, 6)

local function setWindowPos(p, animated)
	local vp = viewport()
	local sz = Vector2.new(DW, DH) * computeScale()
	local mx = math.max((vp.X - sz.X) / 2, 0)
	local my = math.max((vp.Y - sz.Y) / 2, 0)
	State.Pos = Vector2.new(math.clamp(p.X, -mx, mx), math.clamp(p.Y, -my, my))
	local target = UDim2.new(0.5, State.Pos.X, 0.5, State.Pos.Y)
	if animated then tween(Root, { Position = target }, 0.3) else Root.Position = target end
end

local function applyScale(animated)
	local s = computeScale()
	if animated then tween(WinScale, { Scale = s }, 0.3, EASE.Back) else WinScale.Scale = s end
	setWindowPos(State.Pos, false)
end

---------------------------------------------------------------- Top bar
local DragZone = make("Frame", { Size = UDim2.new(0, DW - 60, 0, TOP_H), BackgroundTransparency = 1, Active = true }, Content)

-- Number badge on the left, like an index marker
local badge = make("Frame", { Position = UDim2.fromOffset(14, 14), Size = UDim2.fromOffset(26, 26), BackgroundTransparency = 0.85 }, DragZone)
bind(badge, "BackgroundColor3", "Accent")
corner(badge, 4)
stroke(badge, 1, "Accent", 0.4)
label(badge, { Size = UDim2.fromScale(1, 1), Text = "01", TextSize = 12 }, "Accent", true).TextScaled = true

local titleX = 50
if hasLogo then
	local lg = make("ImageLabel", { Position = UDim2.fromOffset(titleX, 12), Size = UDim2.fromOffset(30, 30), BackgroundTransparency = 1, Image = SETTINGS.LogoId, ScaleType = Enum.ScaleType.Fit }, DragZone)
	make("UIAspectRatioConstraint", { AspectRatio = 1 }, lg)
	corner(lg, 6)
	titleX += 40
end

local TitleLabel = label(DragZone, { Position = UDim2.fromOffset(titleX, 6), Size = UDim2.new(0, 220, 0, 24), Text = SETTINGS.Title, TextSize = 22, TextXAlignment = Enum.TextXAlignment.Left }, nil, true)
shineGradient(TitleLabel, "Accent", true)

local SubLabel = label(DragZone, { Position = UDim2.fromOffset(titleX + 1, 30), Size = UDim2.new(0, 220, 0, 14), Text = SETTINGS.Subtitle, TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left }, "Sub", false)

-- Corner grip marks (four small L brackets at the top edge)
for _, s in ipairs({ {0, 0, 12, 1}, {0, 0, 1, 12}, {1, 0, 12, 1}, {1, 0, 1, 12} }) do
	local ax, ay = s[1], s[2]
	local w, h = s[3], s[4]
	local g = make("Frame", {
		AnchorPoint = Vector2.new(ax, ay),
		Position = UDim2.new(ax, ax == 0 and 6 or -6, ay, ay == 0 and 6 or -6),
		Size = UDim2.fromOffset(w, h),
		BackgroundTransparency = 0.35,
		ZIndex = 5,
	}, Window)
	bind(g, "BackgroundColor3", "Accent")
end

local topLine = make("Frame", { Position = UDim2.fromOffset(0, TOP_H - 1), Size = UDim2.new(1, 0, 0, 1), BackgroundTransparency = 0.55 }, Content)
bind(topLine, "BackgroundColor3", "Line")

local Close = make("TextButton", { AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -12, 0, TOP_H / 2), Size = UDim2.fromOffset(42, 34), Text = "", AutoButtonColor = false }, Content)
bind(Close, "BackgroundColor3", "Button")
corner(Close, 4)
stroke(Close, 1, "Accent", 0.85)
for _, rot in ipairs({ 45, -45 }) do
	local bar = make("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(14, 1.5), Rotation = rot }, Close)
	bind(bar, "BackgroundColor3", "Text")
	corner(bar, 1)
end
addFeedback(Close, function(h)
	tween(Close, { BackgroundColor3 = h and getColor("Accent") or getColor("Button") }, 0.15)
end)
Close.Activated:Connect(function() closeUI() end)

---------------------------------------------------------------- Navigation rail
local Rail = make("Frame", { Position = UDim2.fromOffset(0, TOP_H), Size = UDim2.new(0, RAIL_W, 1, -TOP_H), BackgroundTransparency = 0.55 }, Content)
bind(Rail, "BackgroundColor3", "Panel")
local railLine = make("Frame", { AnchorPoint = Vector2.new(1, 0), Position = UDim2.fromScale(1, 0), Size = UDim2.new(0, 1, 1, 0), BackgroundTransparency = 0.55 }, Rail)
bind(railLine, "BackgroundColor3", "Line")

local PillLayer = make("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1 }, Rail)
local TabsFrame = make("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1 }, Rail)
padding(TabsFrame, 12, 14)
make("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }, TabsFrame)

-- Rail index marker: thin vertical bar, no filled pill
local Pill = make("Frame", { Position = UDim2.fromOffset(0, 14), Size = UDim2.fromOffset(2, 44), BackgroundTransparency = 0.1 }, PillLayer)
bind(Pill, "BackgroundColor3", "Accent")
corner(Pill, 1)

local PagesHolder = make("Frame", { Position = UDim2.fromOffset(RAIL_W, TOP_H), Size = UDim2.new(1, -RAIL_W, 1, -TOP_H), BackgroundTransparency = 1, ClipsDescendants = true }, Content)
local Veil = make("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 50 }, PagesHolder)
bind(Veil, "BackgroundColor3", "Bg")

local TAB_ORDER = { "SCRIPTS", "MORE", "CONFIG" }
local Tabs, Pages = {}, {}

for i, name in ipairs(TAB_ORDER) do
	local tb = make("TextButton", { Name = name, Size = UDim2.new(1, 0, 0, 44), Text = "", BackgroundTransparency = 1, AutoButtonColor = false, LayoutOrder = i }, TabsFrame)
	padding(tb, 8, 0, 4, 0)
	local numL = label(tb, { AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.fromOffset(16, 14), Text = string.format("%02d", i), TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left }, "Sub", true)
	local nameL = label(tb, { AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 22, 0.5, 0), Size = UDim2.new(1, -22, 1, 0), Text = name, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left }, nil, true)
	sizeCap(nameL, 13)
	local function refresh(animated)
		local active = State.Tab == name
		set(nameL, { TextColor3 = active and getColor("Highlight") or getColor("Sub") }, animated, 0.2)
		set(numL,  { TextColor3 = active and getColor("Accent")    or getColor("Sub") }, animated, 0.2)
	end
	onTheme(refresh)
	Tabs[name] = refresh
	addFeedback(tb)
	tb.Activated:Connect(function() selectTab(name) end)
end

selectTab = function(name, instant)
	if State.Tab == name and not instant then return end
	State.Tab = name
	local y = 14 + (table.find(TAB_ORDER, name) - 1) * 50
	if instant then
		Pill.Position = UDim2.fromOffset(0, y)
	else
		tween(Pill, { Position = UDim2.fromOffset(0, y) }, 0.3, EASE.Quart)
	end
	for _, refresh in pairs(Tabs) do refresh(not instant) end
	for n, pg in pairs(Pages) do pg.Visible = (n == name) end
	local pg = Pages[name]
	if not instant then
		pg.Position = UDim2.fromOffset(18, 0)
		tween(pg, { Position = UDim2.new() }, 0.3)
		Veil.BackgroundTransparency = 0.35
		tween(Veil, { BackgroundTransparency = 1 }, 0.28)
	else
		pg.Position = UDim2.new()
	end
end

------------------------------------------------------------------------
-- 7. COMPONENTS: PAGES, BUTTONS, SLIDERS, CHIPS, CARDS
------------------------------------------------------------------------
local function createPage(name, title, subtitle)
	local page = make("Frame", { Name = name, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false }, PagesHolder)
	label(page, { Position = UDim2.fromOffset(16, 8), Size = UDim2.new(1, -32, 0, 22), Text = title, TextSize = 16, TextXAlignment = Enum.TextXAlignment.Left }, "Highlight", true)
	label(page, { Position = UDim2.fromOffset(16, 30), Size = UDim2.new(1, -32, 0, 14), Text = subtitle, TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left }, "Sub", false)
	local divider = make("Frame", { Position = UDim2.fromOffset(16, 48), Size = UDim2.new(1, -32, 0, 1), BackgroundTransparency = 0.7 }, page)
	bind(divider, "BackgroundColor3", "Line")
	local scroll = make("ScrollingFrame", {
		Position = UDim2.fromOffset(0, 56),
		Size = UDim2.new(1, 0, 1, -56),
		BackgroundTransparency = 1,
		ScrollBarThickness = 2,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingDirection = Enum.ScrollingDirection.Y,
	}, page)
	bind(scroll, "ScrollBarImageColor3", "Accent")
	padding(scroll, 14, 6, 16, 16)
	Pages[name] = page
	return page, scroll
end

-- Card-style button: compact, index number on the left, small indicator on the right.
local function createButton(parent, def)
	local btn = { Toggle = def.Toggle ~= false, Callback = def.Callback, State = false, Hover = false }

	local frame = make("TextButton", {
		Name = def.Name or "Button",
		Size = UDim2.fromOffset(def.Width or 172, def.Height or 62),
		Text = "", AutoButtonColor = false, ClipsDescendants = true,
		BackgroundColor3 = getColor("Panel"),
		LayoutOrder = def.Order or 0,
	}, parent)
	corner(frame, 6)
	local st = stroke(frame, 1, nil, 0.7)

	-- Left accent stripe
	local stripe = make("Frame", { AnchorPoint = Vector2.new(0, 0), Position = UDim2.new(0, 0, 0, 8), Size = UDim2.fromOffset(2, 46) }, frame)
	bind(stripe, "BackgroundColor3", "Accent")
	corner(stripe, 1)

	-- Index number
	local idxL = label(frame, { Position = UDim2.fromOffset(14, 10), Size = UDim2.fromOffset(24, 12), Text = string.format("%02d", def.Order or 1), TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left }, "Sub", true)

	-- Name
	local nameL = label(frame, { Position = UDim2.fromOffset(14, 26), Size = UDim2.new(1, -50, 0, 20), Text = def.Name or "", TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left }, "Text", true)
	sizeCap(nameL, 15)

	-- Status line
	local statusL = label(frame, { Position = UDim2.fromOffset(14, 44), Size = UDim2.new(1, -50, 0, 12), Text = "", TextSize = 9, TextXAlignment = Enum.TextXAlignment.Left }, "Sub", true)

	-- LED dot on the right
	local led = make("Frame", { AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -12, 0.5, 0), Size = UDim2.fromOffset(6, 6) }, frame)
	make("UICorner", { CornerRadius = UDim.new(0.5, 0) }, led)

	local function render(animated)
		local col = getColor("Panel")
		if btn.State then col = col:Lerp(getColor("Accent"), 0.18) end
		if btn.Hover then col = col:Lerp(WHITE, 0.045) end
		set(frame, { BackgroundColor3 = col }, animated, 0.18)
		set(st, { Color = getColor("Accent"), Transparency = btn.State and 0.2 or (btn.Hover and 0.5 or 0.75) }, animated, 0.18)
		set(stripe, { BackgroundColor3 = btn.State and getColor("Highlight") or getColor("Accent") }, animated, 0.18)
		set(led, { BackgroundColor3 = btn.State and getColor("Highlight") or getColor("Line") }, animated, 0.18)
		set(statusL, { TextColor3 = btn.State and getColor("Accent") or getColor("Sub") }, animated, 0.18)
		statusL.Text = btn.Toggle and (btn.State and "ACTIVE" or "IDLE") or "READY"
	end
	onTheme(render)
	addFeedback(frame, function(h)
		btn.Hover = h
		render(true)
	end)

	local function fire()
		if btn.Callback then
			local ok, err = pcall(btn.Callback, btn.State)
			if not ok then warn("[𝘾𝙊𝙇𝙎 ✘ Void] error in '" .. tostring(def.Name) .. "': " .. tostring(err)) end
		end
	end

	frame.Activated:Connect(function(input)
		ripple(frame, input)
		if btn.Toggle then
			btn.State = not btn.State
			render(true)
		else
			tween(st, { Transparency = 0.05 }, 0.08)
			task.delay(0.15, function() render(true) end)
		end
		fire()
	end)

	btn.Instance = frame
	function btn:SetCallback(fn) self.Callback = fn end
	function btn:SetName(text) nameL.Text = text end
	function btn:GetState() return self.State end
	function btn:SetState(value, silent)
		self.State = value and true or false
		render(true)
		if not silent then fire() end
	end
	return btn
end

local function createSlider(parent, opts)
	local min, max = opts.Min, opts.Max
	local alpha = 0
	local holder = make("Frame", { Size = UDim2.new(1, 0, 0, 42), BackgroundTransparency = 1, Active = true, LayoutOrder = opts.Order or 0 }, parent)
	local reserve = opts.Format and 60 or 0
	local track = make("Frame", { AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 14, 0.5, 0), Size = UDim2.new(1, -28 - reserve, 0, 6), BackgroundColor3 = WHITE }, holder)
	corner(track, 2)
	local fill, grad
	if opts.Gradient then
		grad = make("UIGradient", { Color = opts.Gradient }, track)
	else
		bind(track, "BackgroundColor3", "Line")
		fill = make("Frame", { Size = UDim2.fromScale(0, 1) }, track)
		corner(fill, 2)
		bind(fill, "BackgroundColor3", "Accent")
	end
	local knob = make("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0, 0.5), Size = UDim2.fromOffset(14, 14), BackgroundColor3 = WHITE, ZIndex = 3 }, track)
	corner(knob, 3)
	local ks = stroke(knob, 2, "Accent", 0.1)
	local knobScale = make("UIScale", { Scale = 1 }, knob)
	local valueL
	if opts.Format then
		valueL = label(holder, { AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.fromScale(1, 0.5), Size = UDim2.fromOffset(56, 18), TextSize = 11, TextXAlignment = Enum.TextXAlignment.Right }, "Sub", true)
	end

	local slider = { Gradient = grad }
	local function render(a)
		alpha = a
		knob.Position = UDim2.fromScale(a, 0.5)
		if fill then fill.Size = UDim2.fromScale(a, 1) end
		if valueL then valueL.Text = opts.Format(min + a * (max - min)) end
	end
	function slider.Set(v) render(math.clamp((v - min) / (max - min), 0, 1)) end
	function slider.Get() return min + alpha * (max - min) end
	slider.Set(opts.Value or min)

	local function fromX(x)
		local a = math.clamp((x - track.AbsolutePosition.X) / math.max(track.AbsoluteSize.X, 1), 0, 1)
		render(a)
		if opts.OnChanged then opts.OnChanged(min + a * (max - min)) end
	end

	holder.InputBegan:Connect(function(input)
		local t = input.UserInputType
		if t ~= Enum.UserInputType.MouseButton1 and t ~= Enum.UserInputType.Touch then return end
		local scroller = holder:FindFirstAncestorOfClass("ScrollingFrame")
		if scroller then scroller.ScrollingEnabled = false end
		tween(knobScale, { Scale = 1.15 }, 0.12, EASE.Back)
		tween(ks, { Thickness = 3 }, 0.12)
		fromX(input.Position.X)
		local moveConn, endConn
		moveConn = UserInputService.InputChanged:Connect(function(i)
			if i == input or (t == Enum.UserInputType.MouseButton1 and i.UserInputType == Enum.UserInputType.MouseMovement) then
				fromX(i.Position.X)
			end
		end)
		endConn = input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				moveConn:Disconnect()
				endConn:Disconnect()
				if scroller then scroller.ScrollingEnabled = true end
				tween(knobScale, { Scale = 1 }, 0.2)
				tween(ks, { Thickness = 2 }, 0.2)
			end
		end)
	end)
	return slider
end

local function createChip(parent, text, isSelected, onClick, opts, group)
	opts = opts or {}
	local chip = make("TextButton", { Text = "", AutoButtonColor = false, LayoutOrder = opts.Order or 0 }, parent)
	corner(chip, 4)
	local st = stroke(chip, 1, nil, 0.75)
	local hasDot = opts.DotColor ~= nil
	local dot
	if hasDot then
		dot = make("Frame", { AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 10, 0.5, 0), Size = UDim2.fromOffset(8, 8) }, chip)
		make("UICorner", { CornerRadius = UDim.new(0.5, 0) }, dot)
	end
	local l = label(chip, {
		Position = UDim2.fromOffset(hasDot and 26 or 6, 0),
		Size = UDim2.new(1, hasDot and -32 or -12, 1, 0),
		Text = text,
		TextXAlignment = hasDot and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
		TextSize = 11,
	}, nil, true)
	sizeCap(l, 12)
	if opts.Font then
		FontLabels[l] = nil
		l.Font = opts.Font
	end
	local function render(animated)
		local sel = isSelected()
		local base = getColor("Panel")
		set(chip, { BackgroundColor3 = sel and base:Lerp(getColor("Accent"), 0.18) or base }, animated, 0.2)
		set(st, { Color = getColor("Accent"), Transparency = sel and 0.2 or 0.8 }, animated, 0.2)
		set(l, { TextColor3 = sel and getColor("Highlight") or getColor("Sub") }, animated, 0.2)
		if dot then set(dot, { BackgroundColor3 = opts.DotColor() }, animated, 0.2) end
	end
	onTheme(render)
	if group then table.insert(group, render) end
	addFeedback(chip)
	chip.Activated:Connect(function()
		onClick()
		if group then
			for _, r in ipairs(group) do r(true) end
		end
	end)
	return chip
end

local function createCard(parent, title, order, actionText, onAction)
	local card = make("Frame", { Size = UDim2.new(0, 350, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = order }, parent)
	bind(card, "BackgroundColor3", "Panel")
	corner(card, 6)
	stroke(card, 1, "Line", 0.3)
	padding(card, 14)
	make("UIListLayout", { Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder }, card)
	local row = make("Frame", { Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, LayoutOrder = 0 }, card)

	-- Left mini-marker for the card title
	local tick = make("Frame", { AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.fromOffset(2, 14) }, row)
	bind(tick, "BackgroundColor3", "Accent")

	label(row, { Position = UDim2.fromOffset(10, 0), Size = UDim2.new(1, -100, 1, 0), Text = title, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left }, "Accent", true)
	if actionText then
		local b = make("TextButton", { AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.fromScale(1, 0.5), Size = UDim2.fromOffset(66, 26), Text = actionText, TextSize = 10, AutoButtonColor = false }, row)
		registerFont(b, true)
		bind(b, "BackgroundColor3", "Button")
		bind(b, "TextColor3", "Text")
		corner(b, 4)
		stroke(b, 1, "Accent", 0.8)
		addFeedback(b)
		b.Activated:Connect(function() onAction() end)
	end
	return card
end

local function createGrid(parent, w, h, order)
	local g = make("Frame", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, LayoutOrder = order }, parent)
	make("UIGridLayout", { CellSize = UDim2.fromOffset(w, h), CellPadding = UDim2.fromOffset(6, 6), SortOrder = Enum.SortOrder.LayoutOrder }, g)
	return g
end

------------------------------------------------------------------------
-- 8. PAGES
------------------------------------------------------------------------
---------------------------------------------------------------- SCRIPTS
local _, ScriptsScroll = createPage("SCRIPTS", "SCRIPTS", "tap a card to load")
make("UIGridLayout", { CellSize = UDim2.fromOffset(172, 62), CellPadding = UDim2.fromOffset(8, 8), SortOrder = Enum.SortOrder.LayoutOrder }, ScriptsScroll)
local ScriptButtons = {}
for i, def in ipairs(SCRIPT_BUTTONS) do
	def.Order = i
	ScriptButtons[i] = createButton(ScriptsScroll, def)
end

---------------------------------------------------------------- MORE
local _, MoreScroll = createPage("MORE", "MORE", "extra slots for your options")
make("UIListLayout", { Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder }, MoreScroll)
local MoreButtons = {}
local function addMoreButton(def)
	def.Width = def.Width or 350
	def.Order = #MoreButtons + 1
	local b = createButton(MoreScroll, def)
	table.insert(MoreButtons, b)
	return b
end
for _, def in ipairs(MORE_BUTTONS) do addMoreButton(def) end

---------------------------------------------------------------- CONFIG
local _, CfgScroll = createPage("CONFIG", "CONFIG", "personalize 𝘾𝙊𝙇𝙎 ✘ Void")
make("UIListLayout", { Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder }, CfgScroll)

local pick = { Role = "Accent", H = 0, S = 1, V = 1 }
local loadPick

pulse = function()
	if not State.Open or State.Busy then return end
	tween(WinScale, { Scale = computeScale() * 1.015 }, 0.09, EASE.Sine)
	task.delay(0.09, function()
		if State.Open and not State.Busy then tween(WinScale, { Scale = computeScale() }, 0.35, EASE.Back) end
	end)
end

local function setTheme(name)
	if not THEMES[name] then return end
	State.Theme = name
	State.Overrides = {}
	applyTheme(true)
	if loadPick then loadPick(pick.Role) end
	pulse()
end

local function setFont(key)
	if not FONTS[key] then return end
	State.Font = key
	applyFont()
	pulse()
end

local sizeSlider
local sizeCard = createCard(CfgScroll, "SCALE", 1, "RESET", function()
	State.UserScale = SETTINGS.ScaleDefault
	sizeSlider.Set(SETTINGS.ScaleDefault)
	applyScale(true)
end)
sizeSlider = createSlider(sizeCard, {
	Min = SETTINGS.ScaleMin, Max = SETTINGS.ScaleMax, Value = SETTINGS.ScaleDefault, Order = 1,
	Format = function(v) return string.format("%d%%", math.floor(v * 100 + 0.5)) end,
	OnChanged = function(v)
		State.UserScale = v
		applyScale(false)
	end,
})

local themeCard = createCard(CfgScroll, "THEMES", 2)
local themeGrid = createGrid(themeCard, 105, 38, 1)
for i, name in ipairs(THEME_ORDER) do
	createChip(themeGrid, name, function() return State.Theme == name end, function() setTheme(name) end,
		{ Order = i, DotColor = function() return THEMES[name].Accent end })
end

local RAINBOW = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
	ColorSequenceKeypoint.new(1 / 6, Color3.fromHSV(1 / 6, 1, 1)),
	ColorSequenceKeypoint.new(2 / 6, Color3.fromHSV(2 / 6, 1, 1)),
	ColorSequenceKeypoint.new(3 / 6, Color3.fromHSV(3 / 6, 1, 1)),
	ColorSequenceKeypoint.new(4 / 6, Color3.fromHSV(4 / 6, 1, 1)),
	ColorSequenceKeypoint.new(5 / 6, Color3.fromHSV(5 / 6, 1, 1)),
	ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1)),
})
local SWATCHES = { rgb(255, 60, 80), rgb(255, 150, 40), rgb(255, 225, 60), rgb(70, 255, 140), rgb(0, 220, 255), rgb(60, 130, 255), rgb(170, 90, 255), rgb(255, 90, 200) }

local hueSlider, valSlider
local function paintValueTrack()
	valSlider.Gradient.Color = ColorSequence.new(BLACK, Color3.fromHSV(pick.H, pick.S, 1))
end
local function applyPick()
	State.Overrides[pick.Role] = Color3.fromHSV(pick.H, pick.S, pick.V)
	paintValueTrack()
	applyTheme(false)
end
loadPick = function(role)
	local h, s, v = getColor(role):ToHSV()
	pick.Role, pick.H, pick.S, pick.V = role, h, s, v
	hueSlider.Set(h)
	valSlider.Set(v)
	paintValueTrack()
end

local colorCard = createCard(CfgScroll, "COLORS", 3, "RESET", function()
	State.Overrides = {}
	applyTheme(true)
	loadPick(pick.Role)
end)
local targetGrid = createGrid(colorCard, 160, 36, 1)
local targetGroup = {}
local TARGETS = { { "PRIMARY", "Accent" }, { "GLOW", "Glow" }, { "BUTTONS", "Button" }, { "HIGHLIGHT", "Highlight" } }
for i, t in ipairs(TARGETS) do
	createChip(targetGrid, t[1], function() return pick.Role == t[2] end, function() loadPick(t[2]) end,
		{ Order = i, DotColor = function() return getColor(t[2]) end }, targetGroup)
end
label(colorCard, { Size = UDim2.new(1, 0, 0, 12), Text = "HUE", TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left, LayoutOrder = 2 }, "Sub", true)
hueSlider = createSlider(colorCard, {
	Min = 0, Max = 1, Value = 0, Order = 3, Gradient = RAINBOW,
	OnChanged = function(v)
		pick.H = v
		if pick.S < 0.1 then pick.S = 0.85 end
		applyPick()
	end,
})
label(colorCard, { Size = UDim2.new(1, 0, 0, 12), Text = "BRIGHTNESS", TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left, LayoutOrder = 4 }, "Sub", true)
valSlider = createSlider(colorCard, {
	Min = 0, Max = 1, Value = 1, Order = 5, Gradient = ColorSequence.new(BLACK, WHITE),
	OnChanged = function(v)
		pick.V = v
		applyPick()
	end,
})
local swatchGrid = createGrid(colorCard, 76, 32, 6)
for i, col in ipairs(SWATCHES) do
	local sw = make("TextButton", { Text = "", AutoButtonColor = false, BackgroundColor3 = col, LayoutOrder = i }, swatchGrid)
	corner(sw, 4)
	local st = stroke(sw, 1.5, nil, 1)
	st.Color = WHITE
	addFeedback(sw, function(h) tween(st, { Transparency = h and 0.3 or 1 }, 0.15) end)
	sw.Activated:Connect(function()
		local h, s, v = col:ToHSV()
		pick.H, pick.S, pick.V = h, s, v
		hueSlider.Set(h)
		valSlider.Set(v)
		applyPick()
	end)
end
loadPick("Accent")

local fontCard = createCard(CfgScroll, "FONTS", 4)
local fontGrid = createGrid(fontCard, 105, 38, 1)
local fontGroup = {}
for i, key in ipairs(FONT_ORDER) do
	createChip(fontGrid, key, function() return State.Font == key end, function() setFont(key) end,
		{ Order = i, Font = FONTS[key].Bold }, fontGroup)
end

selectTab("SCRIPTS", true)

------------------------------------------------------------------------
-- 9. FLOATING LAUNCHER
------------------------------------------------------------------------
local LauncherRoot = make("Frame", { Name = "Launcher", Size = UDim2.fromOffset(56, 56), BackgroundTransparency = 1, Visible = false }, gui)
local LScale = make("UIScale", { Scale = 0 }, LauncherRoot)

local LBtn = make("TextButton", { Size = UDim2.fromScale(1, 1), Text = "", AutoButtonColor = false }, LauncherRoot)
bind(LBtn, "BackgroundColor3", "Panel")
corner(LBtn, 4)
local lStroke = stroke(LBtn, 1.5, "Accent", 0.2)
scanGradient(lStroke, true)

-- Left rail on the launcher itself
local lRail = make("Frame", { AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 4, 0.5, 0), Size = UDim2.fromOffset(2, 28) }, LBtn)
bind(lRail, "BackgroundColor3", "Accent")

if hasLogo then
	local li = make("ImageLabel", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.new(1, -16, 1, -16), BackgroundTransparency = 1, Image = SETTINGS.LogoId, ScaleType = Enum.ScaleType.Fit }, LBtn)
	make("UIAspectRatioConstraint", { AspectRatio = 1 }, li)
	corner(li, 4)
else
	label(LBtn, { Size = UDim2.fromScale(1, 1), Text = "V", TextSize = 24 }, "Accent", true)
end
addFeedback(LBtn)

local function setLauncherPos(p, animated)
	local vp = viewport()
	p = Vector2.new(math.clamp(p.X, 0, math.max(vp.X - 56, 0)), math.clamp(p.Y, 0, math.max(vp.Y - 56, 0)))
	State.LPos = p
	local target = UDim2.fromOffset(p.X, p.Y)
	if animated == false then
		LauncherRoot.Position = target
	else
		tween(LauncherRoot, { Position = target }, 0.09, EASE.Sine)
	end
end
setLauncherPos(Vector2.new(16, viewport().Y * 0.3), false)

local function showLauncher()
	LauncherRoot.Visible = true
	LScale.Scale = 0
	tween(LScale, { Scale = 1 }, 0.4, EASE.Back)
end
local function hideLauncher()
	tween(LScale, { Scale = 0 }, 0.2, EASE.Quint, DIR.In)
	task.delay(0.2, function()
		if State.Open then LauncherRoot.Visible = false end
	end)
end

------------------------------------------------------------------------
-- 10. OPEN / CLOSE / DRAG / RESPONSIVE
------------------------------------------------------------------------
openUI = function()
	if State.Open or State.Busy then return end
	State.Busy, State.Open = true, true
	State.Gen += 1
	local gen = State.Gen
	hideLauncher()
	local target = computeScale()
	setWindowPos(State.Pos, false)
	Root.Visible = true
	WinScale.Scale = target * 0.9
	Root.Position = UDim2.new(0.5, State.Pos.X, 0.5, State.Pos.Y + 18)
	Window.BackgroundTransparency = 1
	WinStroke.Transparency = 1
	Shadow.BackgroundTransparency = 1
	Content.GroupTransparency = 1
	tween(WinScale, { Scale = target }, 0.5, EASE.Back)
	tween(Root, { Position = UDim2.new(0.5, State.Pos.X, 0.5, State.Pos.Y) }, 0.45)
	tween(Window, { BackgroundTransparency = 0.02 }, 0.32)
	tween(WinStroke, { Transparency = 0 }, 0.45)
	tween(Shadow, { BackgroundTransparency = 0.82 }, 0.45)
	task.delay(0.1, function() tween(Content, { GroupTransparency = 0 }, 0.35) end)
	startParticles(Ambient, 8, function() return State.Open and State.Gen == gen end, "Glow")
	task.delay(0.55, function() State.Busy = false end)
end

closeUI = function()
	if not State.Open or State.Busy then return end
	State.Busy, State.Open = true, false
	tween(WinScale, { Scale = computeScale() * 0.92 }, 0.26, EASE.Quint, DIR.In)
	tween(Content, { GroupTransparency = 1 }, 0.2)
	tween(Window, { BackgroundTransparency = 1 }, 0.26)
	tween(WinStroke, { Transparency = 1 }, 0.24)
	tween(Shadow, { BackgroundTransparency = 1 }, 0.24)
	task.delay(0.28, function()
		Root.Visible = false
		showLauncher()
		State.Busy = false
	end)
end

makeDraggable(DragZone, function() return State.Pos end, function(p) setWindowPos(p, false) end)
makeDraggable(LBtn, function() return State.LPos end, function(p) setLauncherPos(p) end, function() openUI() end)

gui:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
	if State.Open and not State.Busy then applyScale(false) end
	setLauncherPos(State.LPos, false)
end)

-- Clean up infinite tweens on destroy
gui.Destroying:Connect(function()
	for _, tw in ipairs(KillTweens) do
		pcall(function() tw:Cancel() end)
	end
	KillTweens = {}
end)

------------------------------------------------------------------------
-- 11. INTRO
------------------------------------------------------------------------
local function playIntro()
	local vp = viewport()
	local s = math.clamp(math.min(vp.X * 0.9 / 460, vp.Y * 0.8 / 240), 0.5, 1.3)
	local alive = true
	local col = getColor

	local holder = make("Frame", { Name = "Intro", AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(460, 240), BackgroundTransparency = 1 }, gui)
	local sc = make("UIScale", { Scale = s * 0.85 }, holder)

	local card = make("CanvasGroup", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = col("Bg"), GroupTransparency = 1 }, holder)
	corner(card, 6)
	local border = make("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1 }, holder)
	corner(border, 6)
	local bst = make("UIStroke", { Thickness = 1.5, Transparency = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, border)
	scanGradient(bst, false)

	local ambient = make("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1 }, card)
	startParticles(ambient, 10, function() return alive end, "Glow")

	-- Corner brackets: four L shapes, sharp geometry
	local brackets = {}
	for _, c in ipairs({ { 0, 0 }, { 1, 0 }, { 0, 1 }, { 1, 1 } }) do
		local ax, ay = c[1], c[2]
		local ox = ax == 0 and 16 or -16
		local oy = ay == 0 and 16 or -16
		for _, dim in ipairs({ { 20, 1.5 }, { 1.5, 20 } }) do
			table.insert(brackets, make("Frame", {
				AnchorPoint = Vector2.new(ax, ay),
				Position = UDim2.new(ax, ox, ay, oy),
				Size = UDim2.fromOffset(dim[1], dim[2]),
				BackgroundColor3 = col("Accent"),
				BackgroundTransparency = 1,
			}, card))
		end
	end

	local logo, logoScale
	if hasLogo then
		logo = make("ImageLabel", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0, 58), Size = UDim2.fromOffset(72, 72), BackgroundTransparency = 1, Image = SETTINGS.LogoId, ImageTransparency = 1, ScaleType = Enum.ScaleType.Fit }, card)
		make("UIAspectRatioConstraint", { AspectRatio = 1 }, logo)
		corner(logo, 8)
		logoScale = make("UIScale", { Scale = 0.5 }, logo)
	end

	local textY = hasLogo and 128 or 88
	local title = label(card, { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0, textY), Size = UDim2.new(1, 0, 0, 60), Text = SETTINGS.Title, TextSize = 46, TextTransparency = 1 }, nil, true)
	local titleScale = make("UIScale", { Scale = 0.78 }, title)
	shineGradient(title, "Accent", false)

	local subY = textY + 42
	local sub = label(card, { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0, subY), Size = UDim2.fromOffset(220, 16), Text = SETTINGS.Subtitle, TextSize = 11, TextTransparency = 1 }, nil, true)
	sub.TextColor3 = col("Sub")

	local lineL = make("Frame", { AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(0.5, -118, 0, subY), Size = UDim2.fromOffset(0, 1), BackgroundColor3 = col("Accent") }, card)
	local lineR = make("Frame", { AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0.5, 118, 0, subY), Size = UDim2.fromOffset(0, 1), BackgroundColor3 = col("Accent") }, card)

	local track = make("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0, 210), Size = UDim2.fromOffset(220, 2), BackgroundColor3 = col("Line") }, card)
	local fill = make("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = WHITE }, track)
	make("UIGradient", { Color = ColorSequence.new(col("Accent"), col("Glow")) }, fill)

	tween(card, { GroupTransparency = 0 }, 0.5)
	tween(sc, { Scale = s }, 0.7, EASE.Back)
	tween(bst, { Transparency = 0 }, 0.55)
	task.wait(0.3)
	if logo then
		tween(logo, { ImageTransparency = 0 }, 0.5)
		tween(logoScale, { Scale = 1 }, 0.6, EASE.Back)
	end
	task.wait(0.22)
	tween(title, { TextTransparency = 0 }, 0.55)
	tween(titleScale, { Scale = 1 }, 0.75, EASE.Back)
	tween(sub, { TextTransparency = 0.15 }, 0.55)
	for _, b in ipairs(brackets) do tween(b, { BackgroundTransparency = 0.3 }, 0.55) end
	tween(lineL, { Size = UDim2.fromOffset(150, 1) }, 0.75)
	tween(lineR, { Size = UDim2.fromOffset(150, 1) }, 0.75)
	tween(fill, { Size = UDim2.fromScale(1, 1) }, 1.9, EASE.Sine, DIR.InOut)
	task.wait(2.2)

	alive = false
	tween(card, { GroupTransparency = 1 }, 0.4)
	tween(bst, { Transparency = 1 }, 0.35)
	tween(sc, { Scale = s * 1.06 }, 0.45, EASE.Quad, DIR.In)
	task.delay(0.2, openUI)
	task.wait(0.5)
	holder:Destroy()
end

------------------------------------------------------------------------
-- 12. PUBLIC API + START
------------------------------------------------------------------------
local COLSNV = {
	Gui            = gui,
	Scripts        = ScriptButtons,
	More           = MoreButtons,
	AddMoreButton  = addMoreButton,
	Open           = function() openUI() end,
	Close          = function() closeUI() end,
	SetTheme       = setTheme,
	SetFont        = setFont,
}

-- Example (uncomment to test):
-- COLSNV.Scripts[1]:SetCallback(function(active)
-- 	print("card 1:", active)
-- end)

task.spawn(function()
	if SETTINGS.ShowIntro then
		local ok, err = pcall(playIntro)
		if not ok then
			warn("[𝘾𝙊𝙇𝙎 ✘ Void] intro error: " .. tostring(err))
			local i = gui:FindFirstChild("Intro")
			if i then i:Destroy() end
			openUI()
		end
	else
		openUI()
	end
end)