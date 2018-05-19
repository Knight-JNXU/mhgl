-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: D:\Server\Data\NewScript\Item\Item51923.out 

Item51923 = {}
Item51923.MapUse = function(self, target)
  if target and target:GetUserType() == 2 then
    if target:GetLock() then
      ShowHint("已上锁的同伴无法使用")
      return 
    end
	    local mobid = target:GetMob_id()
    if mobid == 32066 then
       ShowHint("宝宝还太年幼不要尝试过早学习武学")
       return
    end
    if target:GetRace() ~= 5 then
      ShowHint("此类型同伴能力不足无法修炼无我无天的心法")
      return 
    end
    ItemAsk(string.format("#Y你确定要让#P%s#W学习无我心法吗？\\r#O不到达六强通化境界会导致心法也损毁！\\r#B此心法不可点提升，强行提升则失去效果", target:GetName()))
    SetAnswer(1, "确定")
    SetAnswer(2, "取消")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      local NewSkillID = 4643
      local NewSkillName = "无我心法"
      local Oldskill = target:GetSubsidyOneSkill()
      local skillcount = target:GetSubsidySkillCount()
      if target:HasSkill(NewSkillID) then
        ShowHint(string.format("该同伴已经拥有招式#P%s#W，无需再次学习", NewSkillName))
        return 
      end
      if not item:ReduceCount() then
         return 
      end
      local skillcount = target:GetSubsidySkillCount()
      if target:GetRace() == 5 and skillcount == 6 then
         target:AddSkill(NewSkillID)
         ShowHint(string.format("恭喜你的同伴学会了新的招式#P%s", NewSkillName))
      else
         ShowHint(string.format("#Y能力不足无法学习，心法也损坏了。"))
      end
    end
  else
    ShowHint(string.format("#Y无法学习"))
  end
end


Item51923.CanUse = function(self, user, target)
end

Item51923.BattleUse = function(self, user, target)
end

AddItemTable(Item51923)

