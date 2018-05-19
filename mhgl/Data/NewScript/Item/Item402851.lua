-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\Server\Data\NewScript\Item\Item61106.out 

Item61106 = {}
Item61106.MapUse = function(l_1_0, l_1_1)
  local Freeslot = player:GetItems():GetFreeSlot(0)
  local a = math.random(1, 100)
  if Freeslot < 5 then
    ShowHint("包裹空间不足，请留5个位置")
    ShowError("#W包裹空间不足，请留5个位置")
    return 
  end
  if not item:ReduceCount() then
    return 
  end
  if a <= 100 then
    player:GetItems():AddItem(RandTable{15006}, 10)
    player:GetItems():AddItem(RandTable{15007}, 10)	
	player:GetItems():AddItem(RandTable{15008}, 10)
    player:GetItems():AddItem(RandTable{15009}, 10)	
    ShowError("#W获得神秘礼品")
    script:Rumor(string.format(" %s #O打开#Y首冲礼包#O，感谢他对本服的大力支持 #O。#35", player:GetCharNameLink(), player:GetCharNameLink()), false)
  end
end

Item61106.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item61106.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item61106)
