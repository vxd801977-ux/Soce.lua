-- LocalScript - StarterPlayerScripts
local Lighting = game:GetService("Lighting")
local UserGameSettings = UserSettings():GetService("UserGameSettings")

-- Gráficos bajos forzados
UserGameSettings.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
UserGameSettings.GraphicsQualityLevel = 1

-- Lighting barato
Lighting.GlobalShadows = false
Lighting.FogEnd = 1e6
Lighting.Brightness = 1
Lighting.EnvironmentDiffuseScale = 0
Lighting.EnvironmentSpecularScale = 0

-- Apaga efectos caros
for _, v in ipairs(Lighting:GetChildren()) do
	if v:IsA("PostEffect") then
		v.Enabled = false
	end
end

-- Optimiza partes
for _, obj in ipairs(workspace:GetDescendants()) do
	if obj:IsA("BasePart") then
		obj.Material = Enum.Material.Plastic
		obj.Reflectance = 0
	elseif obj:IsA("Decal") or obj:IsA("Texture") then
		obj.Transparency = 0.3
	end
end

print("FPS mode activado. Nojoda, más no hace.")
