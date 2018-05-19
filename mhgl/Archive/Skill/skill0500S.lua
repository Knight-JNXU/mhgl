--天残式(真正发动)

function skill0500Use(Atk, Target, battle, skillLv)

	local consumeHp = 0.05 * Atk:GetHP() * math.random(5, 15) / 10;

	if consumeHp <= 1 then
		consumeHp = 1;
	end

	if Atk:GetHP() ~= 1 then
		Atk:ChangeHp(-1 * consumeHp, false);
	end
	
	local wDam = Atk:GetSkillLv(376) - Target:GetSkillLv(377);
	local randomDam = 1.2 - math.random(100, 300) / 1000;
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
		FinalDam = ((1.35 * Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = ((1.35 * Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam;
	end

	if Target:GetCommand() == LuaI.BATCMD_DEFEND then
		FinalDam = FinalDam / 2;
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
		end
	end

	if FinalDam <= 1 then
	 	FinalDam = math.random(1, 10);
	end

	Target:ChangeHp(-1 * FinalDam);
	if CritHit == 1 then
		Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
	end
	Atk:RemoveBuff(23);
	battle:PushReactionActor(Target);

end
