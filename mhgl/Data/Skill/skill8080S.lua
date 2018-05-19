--万毒萦绕

function skill8080CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	--do return end
end

function skill8080Use(Atk, Target, battle, skillLv)
	
	
	local Lv = Atk:GetLevel();
	local consumeSp = 0.1 * Lv + 10;	
	if  Atk:GetSP() < consumeSp then
		do return end
	end
	Atk:ChangeSp(-1 * consumeSp, false);
	
	--local wDam = Atk:GetSkillLv(376) - Target:GetSkillLv(377);
	local wDam = 0;
	
	local randomDam = 1.2 - (math.random(100, 300) / 1000);
	local critDam = 1.5;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = 0;
	local CritHit = 0;
	if math.random(1,100) <= 5 then
		FinalDam = (((1.15 + (0.2 * Lv) / 100) * Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = (((1.15 + (0.2 * Lv) / 100) * Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam;
	end
	
	if Target:GetCommand() == LuaI.BATCMD_DEFEND then
		FinalDam = FinalDam / 2;
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
		end
	end
	
	if FinalDam <= 10 then
		FinalDam = math.random(Lv, Lv * 2 + 8);
	end
	
	if math.random(1, 100) <= 50 then
		if Target:IsBuffExist(1) then
			if math.random(1, 100) <= 25 then
				Target:RemoveBuff(1);
				Target:AddBuff(2, Lv, 0, 0, 2, 100);
			end
		else
			Target:AddBuff(1, Lv, 0, 0, 2, 100);
		end
	end
	
	Target:ChangeHp(-1 * FinalDam);
	battle:PushReactionActor(Target);
	
end

