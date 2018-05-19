--author: apollo
--阵法秘籍 人物右击使用：学会太极两仪阵

Item60235 = {
}

function Item60235:MapUse(target)
 local skillid = 13042
  if target and target:GetUserType() == 1 then
    if target:GetFaction() == 7  then
      if target:GetLevel() >= 90 then
        if target:HasSkill(13040) and target:HasSkill(394) then
          if target:GetSkillHide(skillid) == 1 then
            if not item:ReduceCount() then
              return 
            end
            target:SetSkillHide(skillid, 0)
            ShowHint("恭喜您成功学会门派法宝干将莫邪")
            return 
          else
            ShowHint("您已经学会干将莫邪，无须再次学习")
          end
        else
          ShowHint("您并未修习紫薇之术和法宝，无法学习干将莫邪")
        end
      else
        ShowHint("等级不足90级无法学习干将莫邪")
      end
    else
      ShowHint("非大唐官府弟子无法学习干将莫邪")
    end
  else
    ShowHint("该目标不能使用")
  end
end


function Item60235:CanUse(user, target)
end

function Item60235:BattleUse(user, target)

end

AddItemTable(Item60235)