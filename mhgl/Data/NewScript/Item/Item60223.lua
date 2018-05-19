-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\Server\Data\NewScript\Item\Item61106.out 

Item61106 = {}
Item61106.MapUse = function(l_1_0, l_1_1)
  local Freeslot = player:GetItems():GetFreeSlot(0)
  local a = math.random(1, 300)
  if Freeslot < 1 then
    ShowHint("包裹空間不足，請留1個位置")
    ShowError("#W包裹空間不足，請留1個位置")
    return 
  end
  if not item:ReduceCount() then
    return 
  end
     local FirstP = math.random(1, 300)
    if a <= 30 then
    itemid = RandTable({20260})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R书铁#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false) 
     elseif a <= 150 then
    itemid = RandTable({20259})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R书铁#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)  
		elseif a <= 300 then  -- 22 % 的几率开出银子35万
     itemid = RandTable({20258})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R书铁#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false) 
  end
end


Item61106.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item61106.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item61106)
