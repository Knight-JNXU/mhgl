--天残式

function skill0049CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需忘情决修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill0049Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.3 * skillLv + 5;

	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展天残式", consumeSp);

	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	Atk:SetPostSkill(500, Target:GetIndex(), 1, skillLv);
	Atk:AddBuff(23, 0, 0, 0, 2, 100);
	battle:PushReactionActor(Atk);
end
