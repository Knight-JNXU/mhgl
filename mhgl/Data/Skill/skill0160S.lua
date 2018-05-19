--鬼门阵

function skill0160CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需毒经修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0160Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.4 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展鬼门阵", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 1 + math.floor(skillLv - 35) / 45;
	
	if turn < 1 then
		turn = 1;
	elseif turn > 3 then
		turn = 3;
	end
	
	local reAtkCount = 1 + math.floor(skillLv - 35) / 45;
	
	if reAtkCount < 1 then
		reAtkCount = 1;
	elseif reAtkCount > 3 then
		reAtkCount = 3;
	end
	
	Target:AddBuff(13, skillLv, reAtkCount, 0, turn, 100);
	
	battle:PushReactionActor(Target);
end

