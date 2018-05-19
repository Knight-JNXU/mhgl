--辟地神针

function skill2451CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需银图秘录修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill2451Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.8 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展辟地神针", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local rate = 0.5 * Atk:GetHIT() / Target:GetEVA()  * 100;
	
	if rate < 68 then
		rate = 68;
	elseif rate > 95 then
		rate = 95;
	end
	
	if math.random(1, 100) > rate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
	else
		local randomDam = 1.3 - (math.random(100, 400) / 1000);
		local FinalDam = (5.8 * skillLv + Atk:GetSkillItemATK()) * randomDam;
		if math.random(1, 100) < 6 then
			FinalDam = FinalDam * (math.random(180, 220) / 100)
		end
		if FinalDam <= 1 then
			FinalDam = 1;
		end
		
		Target:ChangeHp(-1 * FinalDam);
		
		if (Target:IsBuffExist(1001) or Target:IsBuffExist(1002)) ==  false then
			Target:AddBuff(1001, skillLv, 0, 0, 4, 100);
		end
		
		battle:PushReactionActor(Target);
	end
end

