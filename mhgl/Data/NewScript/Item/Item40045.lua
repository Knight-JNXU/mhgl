Item40045 = {}
function Item40045:MapUse(target)
  if target and target:GetUserType() == 2 then
    ItemAsk(string.format("你确定要让#P%s#W学习技能吗？", target:GetName()))
    SetAnswer(1, "确定")
    SetAnswer(2, "取消")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      if target:GetLock() then
        ShowHint("已上锁的召唤兽无法使用")
        return
      end
    if target:GetRace() ~= 5 and target:GetRace() ~= 2 and target:GetRace() ~= 3 and target:GetRace() ~= 4 and target:GetRace() ~= 11 then
        ShowHint("此类型召唤兽不能学习新的招式")
        return
      end
      local NewSkillID = 4503
      local NewSkillName = "嗜血追击"
      if target:HasSkill(NewSkillID) then
        ShowHint(string.format("该召唤兽已经拥有招式#P%s#W，无需再次学习", NewSkillName))
        return
      else
        local skillcount = target:GetSpecialSkillCount()
        if skillcount < 1 then
          if not item:ReduceCount() then
            return
          end
          target:AddSkill(NewSkillID)
          ShowHint(string.format("恭喜你的召唤兽学会了新的招式#P%s", NewSkillName))
        elseif skillcount == 1 then
          for i = 4500, 4543 do
            if target:HasSkill(i) then
              ItemAsk("你的召唤兽已经拥有一个技能了，再次学习技能的话，会导致已有的技能被遗忘掉。你确定要让你的召唤兽学习新的技能吗？")
              SetAnswer(1, "确定")
              SetAnswer(2, "放弃")
              WaitAnswer(2)
              if GetAnswer() == 1 then
                if not item:ReduceCount() then
                  return 
                end
                target:RemoveSkill(i)
                target:AddSkill(NewSkillID)
                ShowHint(string.format("你的召唤兽学会了新的招式#P%s#W,但似乎遗忘了某个招式", NewSkillName))
              end
              return 
            end
          end
          if not item:ReduceCount() then
            return 
          end
          target:AddSkill(NewSkillID)
          ShowHint(string.format("恭喜你的召唤兽学会了新的招式#P%s", NewSkillName))
        else
          ShowHint("该目标不能使用")
        end
      end
    end
  end
end
function Item40045:CanUse(user, target)
end
function Item40045:BattleUse(user, target)
end
AddItemTable(Item40045)
