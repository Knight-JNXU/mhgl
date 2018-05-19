-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\梦幻古龙\Server\Data\NewScript\Item\Item61084.out 

Item61084 = {}
Item61084.MapUse = function(l_1_0, l_1_1)
  ItemAsk("使用同伴8倍经验丸，你便可以立即获得1小时的8倍逍遥时间噢！~（时间不可累加）")
  SetAnswer(1, string.format("使用“同伴8倍经验丸”"))
  SetAnswer(2, "今天不好用")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    --[[if player:HasBuff(246) then
      ShowHint("有同伴双倍经验状态下不能再使用同伴三倍经验丸")
      return 
    end
    if player:HasBuff(247) then
      ShowHint("有同伴三倍经验状态下不能再使用角色四倍经验丸")
      return 
    end
    if player:HasBuff(304) then
      ShowHint("你现在已经处于同伴四倍经验状态下了！请时间结束后再尝试使用。")
    else
      if not item:ReduceCount() then
        return 
      end]]
      player:AddBuff(114, 0, 0, 0, 60, 100)
	  player:GetItems():RemoveItem(62998, 1)
      ShowHint("成功使用“同伴6倍经验丸”，获得1小时同伴8倍经验时间。")
    end
  end


Item61084.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item61084.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item61084)
