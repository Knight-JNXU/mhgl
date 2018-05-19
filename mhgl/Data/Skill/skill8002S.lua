--丹凤朝阳

function skill8002CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	
end

function skill8002Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 0 * (0 + 0 * Lv);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展丹凤朝阳", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = 1;		--是CBatActor类型 		
	
	local FinalDam = {0, 0};
	local critDam = 1.3;
	local DamRate = {0.7, 0.7};
	
	local i = 1;
	while i <= 2 do
		
		local result = skillCanHit(Atk,Target);
		if result == 2 then
			Target:MissSkill();		
		else
			FinalDam[i] = 10 * ((1.2 * (Atk:GetPOW()/10 + 1.75 * Lv)- Target:GetPOW()/10 + 1.1 * Lv + 260) * nDam - 250) * DamRate[i];
		end
		
		local critRate = 15;
		if math.random(1, 100) <= critRate then
			FinalDam[i] = FinalDam[i] * critDam;
		end
		
		if FinalDam[i] <= 10 then
			FinalDam[i] = math.random(1, 10);
		end
		
		Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
		
		i = i + 1;
	end
	
	battle:PushReactionActor(Target);
	
end

