--乾天罡气

function skill2642CanUse(Atk, skillLv, reqSkillLv, reqCharLv)	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需神道无念修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill2642Use(Atk, Target, battle, skillLv)

	local consumeHp = 0.5 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeHp = consumeHp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：生命不足\#G%d\#W，无法施展乾天罡气", consumeHp);
	if  Atk:GetHP() < consumeHp then
		Atk:SkillFail(Msg);
		do return end
	end

	Atk:ChangeHp(-1 * consumeHp, false);
	
	local SpChange = skillLv + 20;

	Target:ChangeSp(SpChange);
	
	battle:PushReactionActor(Target);	
end

