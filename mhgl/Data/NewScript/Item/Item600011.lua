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
    itemid = RandTable({60198,60199,40043})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 25 then
    itemid = RandTable({91010,91028,91046,91064,91082,91100,91118,91133,91151,91169,91187})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O漫不經心地打开#R普通宝盒#O，意外地發現裡面有1個#B无级别%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 30 then
    itemid = RandTable({27968})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 35 then
    itemid = RandTable({80683,80684,80685,80686,80687,80688})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 45 then
    itemid = RandTable({63060,20258})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 50 then
    itemid = RandTable({60038,60054,60071,60087,60103,60119,60311})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
     elseif a <= 55 then
    itemid = RandTable({58001})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出N个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)  
     elseif a <= 100 then
    itemid = RandTable({30001})
    player:GetItems():AddItem(itemid, 3)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)  
		
  end
end


Item61106.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item61106.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item61106)
