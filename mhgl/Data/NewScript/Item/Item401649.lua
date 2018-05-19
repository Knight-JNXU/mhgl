-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\Server\Data\NewScript\Item\Item61106.out 

Item61106 = {}
Item61106.MapUse = function(l_1_0, l_1_1)
  local Freeslot = player:GetItems():GetFreeSlot(0)
  local a = math.random(1, 100)
  if Freeslot < 1 then
    ShowHint("包裹空间不足，请留一个位置")
    ShowError("#W包裹空间不足，请留一个位置")
    return 
  end
  if not item:ReduceCount() then
    return 
  end
  if a <= 100 then
    player:GetItems():AddItem(RandTable{81059, 81060, 81061, 81062, 81063, 81064, 81065, 81066}, 8)
    ShowError("#W获得一组御赐资质丹，赶快打开包裹面板看看是什么吧")
    script:Rumor(string.format(" %s #O打开御赐资质丹礼包，获得了#A 一组御赐资质丹 #O。#35", player:GetCharNameLink(), player:GetCharNameLink()), false)
  end
end

Item61106.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item61106.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item61106)
