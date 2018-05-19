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
    if a <= 25 then
    itemid = RandTable({91009,91027,91045,91063,91081,91099,91117,91132,91150,91168,91186})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O漫不經心地打开#R普通宝盒#O，意外地發現裡面有1個#B无级别%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 30 then
    itemid = RandTable({60234})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 35 then
    itemid = RandTable({80677,80678,80679,80680,80681,80682})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 45 then
    itemid = RandTable({63060,20257})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
    elseif a <= 50 then
    itemid = RandTable({60037,60053,60070,60086,60102,60118,60312})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O豪气冲天的打#R普通宝盒#O只见掉出一个#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
     elseif a <= 55 then
    itemid = RandTable({58000})
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
