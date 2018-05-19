--云卷流星

function skill0050CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	local reqHp = Atk:GetMaxHP() * 0.5;
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需天绝地灭修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetHP() < reqHp then
		Atk:SkillFail("\#W[战斗讯息]：生命不足\#G50\%\#W，无法施展云卷流星");
	end	
end

function skill0050Use(Atk, Target, battle, skillLv)
	
	local consumeHp = 0.1 * Atk:GetHP() * math.random(5, 15) / 10;
	
	if consumeHp <= 1 then
		consumeHp = 1;
	end
	
	local consumeSp = 0.3 * skillLv + 5;
	
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展云卷流星", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Atk:GetHP() ~= 1 then
		Atk:ChangeHp(-1 * consumeHp, false);
	end
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local wDam = Atk:GetSkillLv(376) - Target:GetSkillLv(377);
	local randomDam = 1.2 - math.random(100, 300) / 1000;
	local critDam = 1.5;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = {0, 0, 0};
	local CritHit = {0, 0, 0};
	local DamRate = {0.85, 1, 1.15};
	local KillFlag = 0;
	local TargetHP = Target:GetHP();
	
	local i = 1;
	while i <= 3 do
		
		local result = skillCanHit(Atk,Target);
		if result == 2 then
			Target:MissSkill();		
		elseif math.random(1,100) <= 5 then
			FinalDam[i] = ((DamRate[i] * Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam * critDam;
			CritHit[i] = 1;
		else
			FinalDam[i] = ((DamRate[i] * Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam;
		end
		
		if KillFlag == 0 then
			if Target:GetCommand() == LuaI.BATCMD_DEFEND then
				FinalDam[i] = FinalDam[i] / 2;
				
				if FinalDam[i] <= 10 then
					FinalDam[i] = math.random(1, 10);
				end
				
				if FinalDam[i] >= TargetHP then
					KillFlag = 1;
				end
				
				if CritHit[i] == 1 then
					Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_DEFEND_CRIT_HIT);
				else
					Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_DEFEND_HIT);
				end
				TargetHP = TargetHP - FinalDam[i];
			else
				if FinalDam[i] <= 10 then
					FinalDam[i] = math.random(1, 10);
				end
				
				if FinalDam[i] >= TargetHP then
					KillFlag = 1;
				end
				
				if CritHit[i] == 1 then
					Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
				else
					Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
				end
				TargetHP = TargetHP - FinalDam[i];
			end
		end
		
		if KillFlag == 1 then
			break;
		end
		
		i = i + 1;
	end
	
	--if skillLv >= 150 then
		--local hpChange4 = 1.15 * Atk:GetATK() - Target:GetDEF() * 1.05 ^(Atk:GetSkillLv(0) - Target:GetSkillLv(0));
		--if hpChange4 <= 0 then
		--	hpChange4 = 1;
		--end
		--Target:AddAttriChangeToLst(-1 * hpChange4, 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
	--end
	
	battle:PushReactionActor(Target);
	Atk:AddBuff(22, 0, 0, 0, 1, 100);
	Atk:AddBuff(77, 0, 0, 0, 1, 100);
	
end

