-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: D:\Server\Data\NewScript\Item\Item51900.out 

Item51900 = {}
Item51900.MapUse = function(self, target)
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
    if target:GetRace() ~= 1 and target:GetRace() ~= 2 and target:GetRace() ~= 3 and target:GetRace() ~= 4 and target:GetRace() ~= 5 and target:GetRace() ~= 11 then
      ShowHint("此类型同伴不能学习新的招式")
	  return 
    end
    ItemAsk(string.format("你确定要让#P%s#W学习武学秘籍吗？", target:GetName()))
    SetAnswer(1, "确定")
    SetAnswer(2, "取消")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      local NewSkillID = 4600
      local NewSkillName = "赤云封日式"
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
        if skillcount <= 3 then
          target:AddSkill(NewSkillID)
          ShowHint(string.format("恭喜你的同伴学会了新的招式#P%s", NewSkillName))
        elseif target:GetRace() ~= 5 and skillcount < 5 then
            local r = math.random(1, 10)
            if r <= 3 then
              target:AddSkill(NewSkillID)
              ShowHint(string.format("恭喜你的同伴学会了新的招式#P%s", NewSkillName))
            else
              target:RemoveSkill(target:GetRandomSkillID(3))
              target:AddSkill(NewSkillID)
              ShowHint(string.format("你的同伴学会了新的招式#P%s#W,但似乎遗忘了某个招式", NewSkillName))
            end
        elseif target:GetRace() == 5 and skillcount < 6 then
              local r = math.random(1, 10)
              if r <= 3 then
                target:AddSkill(NewSkillID)
                ShowHint(string.format("恭喜你的同伴学会了新的招式#P%s", NewSkillName))
              else
                target:RemoveSkill(target:GetRandomSkillID(3))
                target:AddSkill(NewSkillID)
                ShowHint(string.format("你的同伴学会了新的招式#P%s#W,但似乎遗忘了某个招式", NewSkillName))
              end	
		elseif skillcount == 7 then
              ShowHint(string.format("你的同伴达到无我境界已经无法继续领悟", NewSkillName))
		else
                target:RemoveSkill(target:GetRandomSkillID(3))
                target:AddSkill(NewSkillID)
                ShowHint(string.format("你的同伴学会了新的招式#P%s#W,但似乎遗忘了某个招式", NewSkillName))	
            end
          end
        end
      end

Item51900.CanUse = function(self, user, target)
end

Item51900.BattleUse = function(self, user, target)
end

AddItemTable(Item51900)

