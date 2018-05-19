-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\Server\Data\NewScript\Item\Item61106.out 

Item61106 = {}
Item61106.MapUse = function(l_1_0, l_1_1)
  local Freeslot = player:GetItems():GetFreeSlot(0)
  local a = math.random(1, 100)
  if Freeslot < 3 then
    ShowHint("包裹空间不足，请留一个位置")
    ShowError("#W包裹空间不足，请留3个位置")
    return 
  end
  if not item:ReduceCount() then
    return 
  end
  if a <= 100 then
    player:GetItems():AddItem(RandTable{600031}, 10)
    player:GetItems():AddItem(RandTable{600032}, 10)
    player:GetItems():AddItem(RandTable{600033}, 10)
player:GetItems():AddItem(RandTable{600017}, 1)		
  end
end

Item61106.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item61106.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item61106)
