--惊神无量刀

function skill8041CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8041Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.3 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展惊神无量刀", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local wDam = 1;		--是CBatActor类型 
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = {0, 0, 0};
	local CritHit = {0, 0, 0};
	local DamRate = {1, 1, 1};
	local CritRate = 5;
	
	if Atk:IsBuffExist(1521) then
		CritRate = 15
	end
	
	local i = 1;
	while i <= 1 do
		local randomDam = 1.2 - math.random(100, 300) / 1000;
		local result = skillCanHit(Atk,Target);
		if result == 2 then
			Target:MissSkill();		
		elseif math.random(1,100) <= CritRate then
			FinalDam[i] = 3 * ((DamRate[i] * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam;
			CritHit[i] = 1;
		else
			FinalDam[i] = 3 * ((DamRate[i] * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;
		end
		
		if Target:GetCommand() == LuaI.BATCMD_DEFEND then
			FinalDam[i] = FinalDam[i] / 2;
			
			if FinalDam[i] <= 10 then
				FinalDam[i] = math.random(1, 10);
			end
			
			if CritHit[i] == 1 then
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_DEFEND_CRIT_HIT);
			else
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_DEFEND_HIT);
			end
		else
			if FinalDam[i] <= 10 then
				FinalDam[i] = math.random(1, 10);
			end
			
			if CritHit[i] == 1 then
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
			else
				Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
			end
		end
		i = i + 1;
	end
	
	battle:PushReactionActor(Target);
	Atk:AddBuff(1300, 1, 0, 0, 1, 100);
end

