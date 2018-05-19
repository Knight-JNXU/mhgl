-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\梦幻古龙\Server\Data\NewScript\Item\Item61086.out 

Item61086 = {}
Item61086.MapUse = function(l_1_0, l_1_1)
  ItemAsk("使用官职双倍积分，你便可以立即获得1小时的官职双倍积分时间噢！~（时间不可累加）")
  SetAnswer(1, string.format("使用“官职双倍积分”"))
  SetAnswer(2, "今天不好用")
  WaitAnswer(2)
  if GetAnswer() == 1 then
   --[[if player:HasBuff(218) then
      ShowHint("有角色双倍经验状态下不能再使用角色三倍经验丸")
      return 
    end
    if player:HasBuff(219) then
      ShowHint("有角色三倍经验状态下不能再使用角色四倍经验丸")
      return 
    end
    if player:HasBuff(303) then
      ShowHint("你现在已经处于角色四倍经验状态下了！请时间结束后再尝试使用。")
    else
      if not item:ReduceCount() then
        return 
      end]]
      player:AddBuff(115, 0, 0, 0, 60, 100)
	   player:GetItems():RemoveItem(62992, 1)
      ShowHint("成功使用“官职双倍积分”，获得1小时官职双倍积分时间。")
    end
  end


Item61086.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item61086.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item61086)
