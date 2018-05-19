-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\Server\Data\NewScript\Item\Item61106.out 

Item61106 = {}
Item61106.MapUse = function(l_1_0, l_1_1)
  local Freeslot = player:GetItems():GetFreeSlot(0)
  local a = math.random(1, 100)
  if Freeslot < 1 then
    ShowHint("包裹空間不足，請留1個位置")
    ShowError("#W包裹空間不足，請留1個位置")
    return 
  end
  if not item:ReduceCount() then
    return 
  end
    if a <= 1 then
    player:GetPartners():AddPartner(7227, 1)
    elseif a <= 2 then
    player:GetPartners():AddPartner(7111, 1)
    elseif a <= 3 then
	player:GetPartners():AddPartner(7082, 1)
    elseif a <= 8 then
	player:GetPartners():AddPartner(7041, 1)
    elseif a <= 13 then
	player:GetPartners():AddPartner(7060, 1)
    elseif a <= 17 then
	player:GetPartners():AddPartner(7061, 1)
    elseif a <= 22 then
	player:GetPartners():AddPartner(7062, 1)
    elseif a <= 27 then
	player:GetPartners():AddPartner(7063, 1)
    elseif a <= 32 then
	player:GetPartners():AddPartner(7064, 1)
    elseif a <= 37 then
	player:GetPartners():AddPartner(7065, 1)
    elseif a <= 42 then
	player:GetPartners():AddPartner(7067, 1)
    elseif a <= 47 then
	player:GetPartners():AddPartner(7068, 1)
    elseif a <= 52 then
	player:GetPartners():AddPartner(7069, 1)
    elseif a <= 57 then
	player:GetPartners():AddPartner(7070, 1)
    elseif a <= 62 then
	player:GetPartners():AddPartner(7071, 1)
    elseif a <= 67 then
	player:GetPartners():AddPartner(7072, 1)
    elseif a <= 72 then
	player:GetPartners():AddPartner(7073, 1)
    elseif a <= 77 then
	player:GetPartners():AddPartner(7074, 1)
    elseif a <= 82 then
	player:GetPartners():AddPartner(7075, 1)
    elseif a <= 87 then
	player:GetPartners():AddPartner(7077, 1)
    elseif a <= 92 then
	player:GetPartners():AddPartner(7078, 1)
    elseif a <= 100 then
	player:GetPartners():AddPartner(7079, 1)
    
	
  end
  
  
end


Item61106.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item61106.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item61106)
