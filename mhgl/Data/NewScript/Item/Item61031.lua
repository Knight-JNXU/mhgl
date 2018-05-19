-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: D:\Server\Data\NewScript\Item\Item61031.out 

Item61031 = {}
Item61031.MapUse = function(self, target)
  local mobid = target:GetMob_id()
    if mobid == 32066 then
       ShowHint("宝宝还太年幼不能强行催化成长")
       return
    end
  if target and target:GetUserType() == 2 then
    if target:GetLock() then
      ShowHint("已上锁的同伴无法使用")
      return 
    end
    ItemAsk(string.format("你确定要让#P%s#W使用内力资质丸吗？", target:GetName()))
    SetAnswer(1, "确定")
    SetAnswer(2, "取消")
    WaitAnswer(2)
   if GetAnswer() == 1 then
	  if mobid == 5036 or mobid == 5037 or mobid == 5038 or mobid == 5039 or mobid == 5043 or mobid == 5044 or mobid == 5045 or mobid == 32067 or mobid == 32068 or mobid == 32069 or mobid == 32070 then
      if target:GetSP_native() >= 10000 then
        ShowHint("同伴的内力资质需要在10000以下才能使用")
        return 
      end
      if not item:ReduceCount() then
        return 
      end
      local r = math.random(20, 20)
      target:ChangeSP_native(r)
      ShowHint("恭喜，该同伴的内力资质得到了提升")
	else
      if target:GetSP_native() >= 10000 then
        ShowHint("同伴的内力资质需要在10000以下才能使用")
        return 
      end
      if not item:ReduceCount() then
        return 
      end
      local r = math.random(20, 20)
      target:ChangeSP_native(r)
      ShowHint("恭喜，该同伴的内力资质得到了提升")
	end
	end
    else
      ShowHint("内力资质丹只能对同伴使用")
  end
end

Item61031.CanUse = function(self, user, target)
end

Item61031.BattleUse = function(self, user, target)
end

AddItemTable(Item61031)
