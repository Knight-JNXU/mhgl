--高级吸血

function skill0329CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0329Use(Atk, Target, battle, skillLv)
	--[[local lv = Atk:GetLevel();
	local consumeSp = 0.6 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展高级吸血", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local HitRate = Atk:GetHIT() / Target:GetEVA() / 0.01857 + 2 * (Lv - Target:GetLevel());
	if HitRate < 30 then
		HitRate = 30;
	elseif HitRate > 85 then
		HitRate = 85;
	end
	
	if math.random(1, 100) > HitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local randomDam = 1.2 - (math.random(100, 300) / 1000);
	local critDam = 1.5;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = 0;
	local rec = 0;
	local CritHit = 0;
	if math.random(1,100) <= 5 then
		FinalDam = (Atk:GetATK() - FinalDef + Lv)  * randomDam * critDam;
		rec = ((0.3 * (Atk:GetATK() - FinalDef) + 0.5 * skillLv) * 1.05 ^ wDam) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = (Atk:GetATK() - FinalDef + Lv)  * randomDam;	
		rec = (0.3 * (Atk:GetATK() - FinalDef) + 0.5 * skillLv) * randomDam;
	end
	

	
	if Target:GetCommand() == LuaI.BATCMD_DEFEND then
		FinalDam = FinalDam / 2;
		rec = rec / 2;
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
		end
	end	
	
	if FinalDam <= 10 then
		FinalDam = math.random(1, 10);
	end
	if rec <= 0 then
		rec = 1;
	elseif rec >= Target:GetHP() then
		rec = Target:GetHP();
	end
	
	Target:ChangeHp(-1 * FinalDam);
	if CritHit == 1 then
		Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
	end
	Atk:ChangeHp(rec);
	battle:PushReactionActor(Target);
	]]
end

