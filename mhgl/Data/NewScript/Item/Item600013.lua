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
    if a <= 10 then
    itemid = RandTable({40056,40055,40054,40053,40052,40051,40050,40049,40048,40047,40046,40045,40044})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 25 then
    itemid = RandTable({402971,402972,402973,402974,402975,402976,402977,402978,402979,402980,402981})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O漫不經心地打开#R普通宝盒#O，意外地發現裡面有1個#B无级别%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 30 then
    itemid = RandTable({600000,600001})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)	
    elseif a <= 50 then
    itemid = RandTable({80701,80702,80703,80704,80705,27984})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)	
    elseif a <= 100 then
    itemid = RandTable({402851})
    player:GetItems():AddItem(itemid, 10)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)	
  end
  
  
end


Item61106.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item61106.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item61106)
