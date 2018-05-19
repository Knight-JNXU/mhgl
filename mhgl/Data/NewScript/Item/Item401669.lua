-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\Server\Data\NewScript\Item\Item51402.out 

Item51402 = {}
Item51402.MapUse = function(l_1_0, l_1_1)
  local flag = player:GetQuests():GetFlag(820)  
    script:SetSaying(true)       
    player:GetQuests():SetFlag(820, flag + 100)
    ShowError("#W获得100绑定元宝")
    player:GetItems():RemoveItem(401669, 1)
  end


AddItemTable(Item51402)