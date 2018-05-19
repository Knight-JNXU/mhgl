--蛟龙缠星

function skill1221CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需游龙功修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
	
end

function skill1221Use(Atk, Target, battle, skillLv)

	local consumeSp = 0.2 * skillLv + 5;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展蛟龙缠星", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1400) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处于蛟龙缠星状态");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 2 + math.floor((skillLv - 15) / 30);
	
	if turn < 2 then 
		turn = 2;
	elseif turn > 5 then
		turn = 5;
	end	
	
	local effectSpd = 0.9 * Target:GetSPD();
	
	if effectSpd <= 1 then
		effectSpd = 1;
	end
	
	Target:AddBuff(1400, skillLv, effectSpd, 0, turn, 100);
	
	battle:PushReactionActor(Target);
	
end
