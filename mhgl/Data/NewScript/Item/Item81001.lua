-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\Server\Data\NewScript\Item\Item70020.out 

Item70020 = {}
Item70020.MapUse = function(l_1_0, l_1_1)
  local Lvl = l_1_1:GetLevel()
  local attrp = l_1_1:GetAttrPoint()
  if l_1_1:GetLock() then
    ShowHint("已上锁的同伴无法使用")
    return 
  end
  --[[if l_1_1:GetRace() == 1 then
    ShowHint("白色人型同伴无法使用该物品")
    return 
  end]]
  ItemAsk(string.format("你确定要让#P%s#W等级归0吗？", l_1_1:GetName()))
  SetAnswer(1, "确定")
  SetAnswer(2, "取消")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    l_1_1:ResetLevel(0)
  end
  if not item:ReduceCount() then
    return 
  end
  ShowHint("宝宝等级已经归0")
end

Item70020.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item70020.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item70020)
