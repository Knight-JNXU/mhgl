--极度疯狂

function skill1841CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需魔兽反噬修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1802) then
		Atk:SkillFail("\#W[战斗讯息]：已经处在极度疯狂状态");
	end	
end

function skill1841Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.4 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展极度疯狂", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 3 + math.floor((skillLv -35)/ 25);
	
	if turn < 3 then 
		turn = 3;
	elseif turn > 5 then
		turn = 5;
	end	
	
	Target:AddBuff(1802, skillLv, 0, 0, turn, 100);
	battle:PushReactionActor(Target);
end

