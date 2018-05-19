--后发制人

function skill13061CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需无双一击修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill13061Use(Atk, Target, battle, skillLv)
	
	
	
	Atk:SetPostSkill(13062, Target:GetIndex(), 1, skillLv);
	Atk:AddBuff(1302, skillLv, 0, 0, 2, 100);
	battle:PushReactionActor(Target);
end
