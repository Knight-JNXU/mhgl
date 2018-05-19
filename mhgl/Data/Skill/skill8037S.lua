--BOSS流沙落日

function skill8037CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8037Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();		
	local consumeSp = 0.6 * Lv + 5;
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
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
		FinalDam = (1.2 * Atk:GetATK() - FinalDef) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = (1.2 * Atk:GetATK() - FinalDef) * randomDam;	
	end
	
	if Target:GetCommand() == LuaI.BATCMD_DEFEND then
		FinalDam = FinalDam / 2;
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
		end
	end	
	
	if FinalDam <= 10 then
		FinalDam = math.random(1, 10);
	end
	
	Target:ChangeHp(-1 * FinalDam);
	if CritHit == 1 then
		Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
	end
	battle:PushReactionActor(Target);
	
end

