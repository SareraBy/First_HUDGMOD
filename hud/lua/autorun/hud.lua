-- SimpleHUD 

if CLIENT then



local firstdisablehud = {
    ['CHudHealth'] =true,
    ['CHudBattery'] =true,
    ['CHudSuitPower'] =true,
    ['CHudAmmo'] =true,
    ['CHudSecondaryAmmo'] =true,
    ['DarkRP_LocalPlayerHUD'] =true,
    ['DarkRP_Hungermod'] =true,
    ['DarkRP_LockdownHUD'] =true,
    ['CHudVoiceSelfStatus'] =true,
    ['CHudVoiceStatus'] =true,
}



hook.Add( "HUDShouldDraw", "HidemyHUD", function( name )
  if firstdisablehud[name] then
  return false
end
end)


hook.Add("HUDPaint","HidemyHUD",function()
local p = LocalPlayer()
local h = p:Health()
local hm = p:GetMaxHealth()
local a = p:Armor()




-- Hud
draw.SimpleTextOutlined( p:Nick().."       ", "Trebuchet24",  ScrW()-1800, ScrH() - 165, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color( 49, 49, 49 ) ) 
draw.DrawText(os.date( "%H:%M:%S" , os.time() ), "Trebuchet24", ScrW()-1655, ScrH() - 175, Color(255, 255, 255), TEXT_ALIGN_CENTER, Color( 49, 49, 49 ) )
draw.SimpleTextOutlined( "HP:"..h, "Trebuchet24",  ScrW()-1800, ScrH() - 140, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color( 49, 49, 49 ) ) 
draw.DrawText( "AR:"..a, "Trebuchet24", ScrW()-1685, ScrH() - 152, Color(255, 255, 255), TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER, 1, Color( 49, 49, 49 ) )
draw.RoundedBox(5,55,960,250,17,Color(79,79,79,240))
draw.RoundedBox(5,55,960,250,17,Color(79,79,79,240))
draw.RoundedBox(5,55,981,250,17,Color(79,79,79,240))
draw.RoundedBox(5,55,960,h*2.5,17,Color(255,0,0,255))
draw.RoundedBox(5,55,981,a*2.5,17,Color(0,0,255))

-- Avatar or the picture is in the hud
local Avatar = vgui.Create( "AvatarImage", gmpanel )
Avatar:SetSize( 55, 55 )
Avatar:SetPos( 55, 903 )
Avatar:SetPlayer( LocalPlayer(), 64 )



function GAMEMODE:HUDDrawTargetID()
  return false
end

function GAMEMODE:DrawDeathNotice()
  return false
end

-- Part of hud
hook.Add( "HUDPaint", "HUDPaint_DrawABox", function()
  surface.SetMaterial( Material( "materials/hud.png" ) )
  surface.SetDrawColor( 255, 255, 255, 255 )
  surface.DrawTexturedRect( 30, ScrH() - 180, 300, 115 )
    end)
  end)
end



-- create a label for the current ammo
local currentAmmoLabel = vgui.Create("DLabel", gmpanel)
currentAmmoLabel:SetPos(10, 10)
currentAmmoLabel:SetText("Current Ammo: ")
currentAmmoLabel:SetFont("DermaDefaultBold")


-- create a label for the total ammo
local totalAmmoLabel = vgui.Create("DLabel", gmpanel)
totalAmmoLabel:SetPos(10, 30)
totalAmmoLabel:SetText("Total Ammo: ")
totalAmmoLabel:SetFont("DermaDefaultBold")


-- add a hook to update the ammo labels
hook.Add("HUDPaint", "AmmoHUD", function()
  -- get the player's active weapon
  local weapon = LocalPlayer():GetActiveWeapon()
  
  if IsValid(weapon) then
    -- get the current ammo and total ammo for the weapon
    local currentAmmo = weapon:Clip1()
    local totalAmmo = LocalPlayer():GetAmmoCount(weapon:GetPrimaryAmmoType())
    
    -- update the labels with the ammo values
    currentAmmoLabel:SetText("CAm: " .. currentAmmo)
    totalAmmoLabel:SetText("TAm: " .. totalAmmo)
  end
end)


