--恨海情天

function skill2402CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需沉鱼落雁修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1811) then
		Atk:SkillFail("\#W[战斗讯息]：调息中，不能再使用该技能");
	end
	
end

function skill2402Use(Atk, Target, battle, skillLv)

	local consumeDp = 150;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：愤怒不足%d，无法施展恨海情天", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local hpChange = 0;
	
	if Target:GetFaction() == 3 and Target:GetCclass() == 3 then
		hpChange = 0.75 * Target:GetHP();
	else
		hpChange = 1;
	end

	if hpChange <= 1 then
		hpChange = 1;
	end

	if hpChange > 25 * skillLv then
		hpChange = 25 * skillLv;
	end
	
	Target:ChangeHp(-1 * hpChange);
	Atk:AddBuff(1811,0,0,0,3,100);
	battle:PushReactionActor(Target);
	
end
