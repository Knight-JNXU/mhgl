--猛虎剪尾

function skill0063CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需虎鹤双形修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0063Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = math.floor(skillLv / 30) + 1;
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPRDownSort, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = (0.2 * skillLv + 5) * count;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展猛虎剪尾", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:GetIndex() ~= Atk:GetIndex() then			
			local wDam = Atk:GetSkillLv(376) - targetlist[i]:GetSkillLv(377);
			local randomDam = 1.2 - math.random(100, 300) / 1000;
			local critDam = 1.5;
			local FinalDef = targetlist[i]:GetDEF();
			if 0.8 * Atk:GetATK() > targetlist[i]:GetDEF() then
				if math.random(1, 100) <= 5 then
					FinalDef = targetlist[i]:GetDEF() / 2;
				end
			end
			
			local FinalDam = 0;
			local CritHit = 0;		
			if math.random(1,100) <= 5 then
				FinalDam = ((1.15 - 0.1 * math.floor((skillLv - 30) / 30)) * (Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam * critDam;
				CritHit = 1;
			else
				FinalDam = ((1.15 - 0.1 * math.floor((skillLv - 30) / 30)) * (Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam;
			end
			
			
			if targetlist[i]:GetCommand() == LuaI.BATCMD_DEFEND then
				FinalDam = FinalDam / 2;
				Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
				if CritHit == 1 then
					targetlist[i]:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
				end
			end
			
			if  FinalDam <= 10 then
				FinalDam = math.random(1, 10);
			end
			
			local result = skillCanHit(Atk,targetlist[i]);
			if result == 2 then
				targetlist[i]:MissSkill();
			else
				targetlist[i]:ChangeHp(-1 * FinalDam);
			end
			
			if CritHit == 1 then
				targetlist[i]:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
			end
			
			battle:PushReactionActor(targetlist[i]);
		end
		i = i + 1;
	end
	
	Atk:AddBuff(22, 0, 0, 0, 1, 100);
end

