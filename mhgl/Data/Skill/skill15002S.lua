--幻境术

function skill15002CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需移形换影修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1811) then
		Atk:SkillFail("\#W[战斗讯息]：调息期间不能使用该技能");
	end
end

function skill15002Use(Atk, Target, battle, skillLv)

	local consumeSp = 50;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足%d，无法施展幻境术", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(3121) then
		Atk:SkillFail("\#W[战斗讯息]：对方已经处于幻境术状态");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	
	
	
	
	Atk:AddBuff(1811, skillLv, 0, 0, 3, 100);
	Target:AddBuff(3121, 0, 0, 0, 0, 100);
		
	battle:PushReactionActor(Target);
	
end
