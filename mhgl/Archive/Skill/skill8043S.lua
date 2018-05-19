--九霄惊神(真正发动)

function skill8043Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local wDam = 1;		--是CBatActor类型 
	local randomDam = 1.2 - math.random(100, 300) / 1000;
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end

	local FinalDam = 0;
	local CritHit = 0;
	local CritRate = 5;
	
	if Atk:IsBuffExist(1521) then
		CritRate = 15
	end
	
	if math.random(1,100) <= CritRate then
		FinalDam = ((1.35 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = ((1.35 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;
	end

	if Target:GetCommand() == LuaI.BATCMD_DEFEND then
		FinalDam = FinalDam / 2;
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
		end
	else
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
		end
	end

	if FinalDam <= 1 then
	 	FinalDam = math.random(1, 10);
	end

	Target:ChangeHp(-1 * FinalDam);
	
	Atk:RemoveBuff(1704);
	battle:PushReactionActor(Target);

end
