--魔王回首

function skill11061CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需回身击修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1802) then
		Atk:SkillFail("\#W[战斗讯息]：已经处在魔王回首状态");
	end	
end

function skill11061Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 30;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展魔王回首", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 3 + math.floor((skillLv -35)/ 25);
	
	if turn < 3 then 
		turn = 3;
	elseif turn > 4 then
		turn = 4;
	end	
	
	Target:AddBuff(1802, skillLv, 0, 0, turn, 100);
	battle:PushReactionActor(Target);
end

