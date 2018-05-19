--玉冰障

function skill0041CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需五行密典修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(55) == false then
		Atk:SkillFail("\#W[战斗讯息]：此招式需先达到行云流水的境界后才能施展");
	end	
end

function skill0041Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.5 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展玉冰障", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 1 + math.floor(skillLv - 15) / 25;
	
	if turn < 2 then
		turn = 2;
	elseif turn > 5 then
		turn = 5;
	end
	
	local val2 = Atk:GetPOW();
	Target:AddBuff(57, skillLv, val2, 0, turn, 100);
	battle:PushReactionActor(Target);
end

