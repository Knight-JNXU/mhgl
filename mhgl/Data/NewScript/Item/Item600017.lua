-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\Server\Data\NewScript\Item\Item61106.out 

Item61106 = {}
Item61106.MapUse = function(l_1_0, l_1_1)
  local Freeslot = player:GetItems():GetFreeSlot(0)
  local a = math.random(1, 60)
  if Freeslot < 1 then
    ShowHint("包裹空間不足，請留1個位置")
    ShowError("#W包裹空間不足，請留1個位置")
    return 
  end
  if not item:ReduceCount() then
    return 
  end
    if a <= 1 then
    player:GetPartners():AddPartner(7231, 1)
    elseif a <= 2 then
    player:GetPartners():AddPartner(7230, 1)
    elseif a <= 3 then
	player:GetPartners():AddPartner(430, 1)
    elseif a <= 4 then
	player:GetPartners():AddPartner(432, 1)
    elseif a <= 5 then
	player:GetPartners():AddPartner(601, 1)
    elseif a <= 6 then
	player:GetPartners():AddPartner(7066, 1)
    elseif a <= 7 then
	player:GetPartners():AddPartner(7214, 1)
    elseif a <= 8 then
	player:GetPartners():AddPartner(7215, 1)
    elseif a <= 9 then
	player:GetPartners():AddPartner(7215, 1)
    elseif a <= 11 then
	player:GetPartners():AddPartner(7217, 1)
    elseif a <= 13 then
	player:GetPartners():AddPartner(7226, 1)
    elseif a <= 15 then
	player:GetPartners():AddPartner(7223, 1)
    elseif a <= 18 then
	player:GetPartners():AddPartner(7223, 1)
    elseif a <= 25 then
	player:GetPartners():AddPartner(7222, 1)
    elseif a <= 30 then
	player:GetPartners():AddPartner(7221, 1)
    elseif a <= 35 then
	player:GetPartners():AddPartner(7220, 1)
    elseif a <= 40 then
	player:GetPartners():AddPartner(7229, 1)
    elseif a <= 45 then
	player:GetPartners():AddPartner(7228, 1)
    elseif a <= 50 then
	player:GetPartners():AddPartner(7227, 1)
    elseif a <= 55 then
	player:GetPartners():AddPartner(7111, 1)
	elseif a <= 60 then
	player:GetPartners():AddPartner(7091, 1)


    
	
  end
  
  
end


Item61106.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item61106.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item61106)
