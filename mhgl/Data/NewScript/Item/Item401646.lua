-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\Server\Data\NewScript\Item\Item61106.out 

Item61106 = {}
Item61106.MapUse = function(l_1_0, l_1_1)
  local Freeslot = player:GetItems():GetFreeSlot(0)
  local a = math.random(1, 200)
  if Freeslot < 1 then
    ShowHint("包裹空間不足，請留1個位置")
    ShowError("#W包裹空間不足，請留1個位置")
    return 
  end
  if not item:ReduceCount() then
    return 
  end
     local FirstP = math.random(1, 200)
    if FirstP <= 0 then
	itemid = RandTable({51466, 51467, 51468})
	player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O漫不經心地打开绝学福袋，意外地發現裡面有一個#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
   elseif a <= 30 then
    itemid = RandTable({51373, 51374, 51375, 51376, 51377, 51378, 51379, 51377, 51378, 51379, 51379, 51380, 51381, 51382, 51383, 51383, 51383, 51384, 51385, 51465})
	player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O漫不經心地打开绝学福袋，意外地發現裡面有一個#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
   elseif a <= 0 then
    itemid = RandTable({51392, 51393, 51394, 51395, 51396})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O漫不經心地打开绝学福袋，意外地發現裡面有一個#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
  elseif a <= 200 then
    itemid = RandTable({51361, 51362, 51363, 51364, 51365, 51366, 51367, 51368, 51369, 51370, 51371, 51372, 51463, 51464})
    player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O漫不經心地打开绝学福袋，意外地發現裡面有一個#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
  end
end


Item61106.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item61106.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item61106)
