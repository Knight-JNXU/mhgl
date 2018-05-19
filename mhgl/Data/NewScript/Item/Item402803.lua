-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\Server\Data\NewScript\Item\Item63003.out 

Item402803 = {}
Item402803.MapUse = function(l_1_0, l_1_1)
  if l_1_1 and l_1_1:GetUserType() == 2 then
   -- if l_1_1:GetLock() then
     -- ShowHint("已上锁的同伴无法使用")
      --return 
    --end
    --if l_1_1:GetRace() ~= 4 and l_1_1:GetRace() ~= 5 then
      --ShowHint("该同伴类型无法使用成长丹")
     -- return 
    --end
    ItemAsk(string.format("你确定要让#P%s#W使用高级成长丹吗？使用后请整理下背包", l_1_1:GetName()))
    SetAnswer(1, "确定")
    SetAnswer(2, "取消")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      if l_1_1:GetGrow() >= 2.501 then
        ShowHint("同伴的成长需要在2501以下才能使用")
        return 
      end
      if not item:ReduceCount() then
        return 
      end
      l_1_1:ChangeGrow(0.015)
      if r > 0 then
        ShowHint("恭喜，该同伴的成长得到了提升")
      elseif r == 0 then
        ShowHint("该同伴的成长已经达到上限了")
      else
        ShowHint("成长丹只能对同伴使用")
      end
    end
  end
end

Item402803.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item402803.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item402803)
