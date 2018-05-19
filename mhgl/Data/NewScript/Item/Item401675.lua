-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\Server\Data\NewScript\Item\Item51402.out 

Item51402 = {}
Item51402.MapUse = function(l_1_0, l_1_1)
  local flag = player:GetQuests():GetFlag(820)  
  ItemAsk(string.format("使用本卷可以为您增加5000绑定元宝，您可以在京城NPC购买稀有物品！\r你的绑定元宝为：#R %d", flag))
  SetAnswer(1, "使用")
  SetAnswer(5, "离开")
  WaitAnswer(5)
  if GetAnswer() == 1 and IsProcess() then
    script:SetSaying(true)       
    player:GetQuests():SetFlag(820, flag + 5000)
    ShowError("#W获得5000绑定元宝")
    player:GetItems():RemoveItem(401675, 1)
  end
end

AddItemTable(Item51402)