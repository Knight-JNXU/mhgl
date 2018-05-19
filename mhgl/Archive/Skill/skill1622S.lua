--迎风一刀斩

function skill1622CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需十方斩修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill1622Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.25 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展迎风一刀斩", consumeSp);

	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	Atk:SetPostSkill(1623, Target:GetIndex(), 1, skillLv);
	Atk:AddBuff(1302, skillLv, 0, 0, 2, 100);
	battle:PushReactionActor(Target);
end
