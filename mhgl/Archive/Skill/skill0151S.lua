--万毒萦绕

function skill0151CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需夺命三煞修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0151Use(Atk, Target, battle, skillLv)
	local csv = Target:GetSkillCsvData(Target:GetSubType());
	if csv ~= nil then
		faction = csv.faction;
	end
	local consumeSp = 0.3 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展万毒萦绕", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local wDam = Atk:GetSkillLv(376) - Target:GetSkillLv(377);
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
		--FinalDam = (((1.15 + (0.2 * skillLv) / 100) * Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam * critDam;
		FinalDam = ((1.15 * Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam * critDam;
		CritHit = 1;
	else
		--FinalDam = (((1.15 + (0.2 * skillLv) / 100) * Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam;
		FinalDam = ((1.15 * Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam;
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
	
	--if faction == 5 then
	--	if math.random(1, 100) <= 40 then
		--	if Target:IsBuffExist(1) then
			--	if math.random(1, 100) <= 25 then
				--	Target:RemoveBuff(1);
					--Target:AddBuff(2, skillLv, 0, 0, 2, 100);
			--	end
			--else
			--	Target:AddBuff(1, skillLv, 0, 0, 2, 100);
			--end
		--end
	local result = skillCanHit(Atk, Target);
	if result == 2 then
		Target:MissSkill();		
	elseif math.random(1, 100) <= 50 then
		if Target:IsBuffExist(1) then
			if math.random(1, 100) <= 25 then
				Target:RemoveBuff(1);
				Target:AddBuff(2, skillLv, 0, 0, 2, 100);
			end
		else
			Target:AddBuff(1, skillLv, 0, 0, 2, 100);
		end
			
	end

	
	Target:ChangeHp(-1 * FinalDam);
	battle:PushReactionActor(Target);
	
end

