--BOSS猛虎剪尾

function skill8039CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8039Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();		
	local targetlist = {};
	
	local maxTargetCount = math.floor(Lv / 30) + 1;
	
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
	
	local consumeSp = (0.2 * Lv + 5) * count;
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:GetIndex() ~= Atk:GetIndex() then			
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
				FinalDam = (1.15 - 0.1 * math.floor((Lv - 30) / 30)) * (Atk:GetATK() - FinalDef)  * randomDam * critDam;
				CritHit = 1;
			else
				FinalDam = (1.15 - 0.1 * math.floor((Lv - 30) / 30)) * (Atk:GetATK() - FinalDef)  * randomDam;
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
			
			targetlist[i]:ChangeHp(-1 * FinalDam);
			if CritHit == 1 then
				targetlist[i]:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
			end
			
			battle:PushReactionActor(targetlist[i]);
		end
		i = i + 1;
	end
	
	Atk:AddBuff(22, 0, 0, 0, 1, 100);
end

