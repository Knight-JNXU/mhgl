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
    player:GetPartners():AddPartner(7091, 1)
    elseif a <= 2 then
    player:GetPartners():AddPartner(7228, 1)
    elseif a <= 3 then
	player:GetPartners():AddPartner(7086, 1)
    elseif a <= 8 then
	player:GetPartners():AddPartner(580, 1)
    elseif a <= 13 then
	player:GetPartners():AddPartner(581, 1)
    elseif a <= 17 then
	player:GetPartners():AddPartner(582, 1)
    elseif a <= 22 then
	player:GetPartners():AddPartner(583, 1)
    elseif a <= 27 then
	player:GetPartners():AddPartner(584, 1)
    elseif a <= 32 then
	player:GetPartners():AddPartner(585, 1)
    elseif a <= 37 then
	player:GetPartners():AddPartner(586, 1)
    elseif a <= 42 then
	player:GetPartners():AddPartner(587, 1)
    elseif a <= 47 then
	player:GetPartners():AddPartner(589, 1)
    elseif a <= 52 then
	player:GetPartners():AddPartner(590, 1)
    elseif a <= 57 then
	player:GetPartners():AddPartner(591, 1)
    elseif a <= 62 then
	player:GetPartners():AddPartner(592, 1)
    elseif a <= 67 then
	player:GetPartners():AddPartner(593, 1)
    elseif a <= 72 then
	player:GetPartners():AddPartner(594, 1)
    elseif a <= 77 then
	player:GetPartners():AddPartner(595, 1)
    elseif a <= 82 then
	player:GetPartners():AddPartner(596, 1)
    elseif a <= 87 then
	player:GetPartners():AddPartner(600, 1)
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
