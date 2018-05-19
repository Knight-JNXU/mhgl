--乘风破浪

function skill10002CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需游龙术修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill10002Use(Atk, Target, battle, skillLv)

	local consumeSp = 40;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足%d，无法施展乘风破浪", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1500) then
		Atk:SkillFail("\#W[战斗讯息]：对方已经处于乘风破浪状态");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 2 + math.floor((skillLv - 15) / 30);
	
	if turn < 2 then 
		turn = 2;
	elseif turn > 4 then
		turn = 4;
	end	
	if Target:IsBuffExist(2014) then
		turn = turn * 2;
	end
	if Target:IsBuffExist(2047) then
		turn = turn * 4;
	end
	
	local effectEva = 1.3 * Target:GetEVA();
		
	if effectEva <= 1 then
		effectEva = 1;
	end
	
	Target:AddBuff(1500, skillLv, effectEva, 0, turn, 100);
		
	battle:PushReactionActor(Target);
	
end
