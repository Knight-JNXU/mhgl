--雷震九天

function skill8075CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if Atk:IsBuffExist(1525) == false then
		Atk:SkillFail("\#W[战斗讯息]：此招式需在月煌虚引状态下才能施展");
	end	
end

function skill8075Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.3 * Lv +10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展雷震九天", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	--local buffid = 1502; 1108
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local wDam = 1;		--是CBatActor类型 	
	local randomDam = 1.2 - (math.random(100, 300) / 1000);
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = 0;
	local CritHit = 0;
	if math.random(1,100) <= 5 then
		FinalDam = ((1.05 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = ((1.05 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;	
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
	if FinalDam <= 10 then
		FinalDam = math.random(1, 10);
	end

	Target:ChangeHp(-1 * FinalDam);
	
	if Target:GetHP() ~= 0 and (Target:IsBuffExist(1123) == false) then
		Target:AddBuff(1123, 1, 0, 0, 1, 100);
	end
	
	Atk:RemoveBuff(1525);
	Atk:AddBuff(1809, 1, 0, 0, 1, 100);
	
	battle:PushReactionActor(Target);	
end
