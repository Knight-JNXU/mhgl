--BOSS燕十三夺命十三剑

function skill0615CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0615Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local Lv = Atk:GetLevel();
	local maxTargetCount = math.floor(Lv/30) + 1;
	
	if maxTargetCount > 4 then
		maxTargetCount = 4;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	
	local consumeSp = (0.1 * Lv + 20) * count;	

	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	local CritHit = 0;
	while targetlist[i] ~= nil do
	--for i = 0, targetcounter  - 1 do
		local nDam = Atk:GetSkillLv(378) - targetlist[i]:GetSkillLv(379);
		if math.random(1, 100) <= 20 then
			FinalDam = 2 * (Atk:GetPOW() - targetlist[i]:GetPOW() + 
						(2.5 - 0.3 * math.floor((Lv - 25) / 25)) * Lv)  * 1.05 ^ nDam;
			CritHit = 1;
		else
			FinalDam = (Atk:GetPOW() - targetlist[i]:GetPOW() + 
						(2.5 - 0.3 * math.floor((Lv - 25) / 25)) * Lv)  * 1.05 ^ nDam;
		end
		if FinalDam <= 10 then  
			FinalDam = math.random(Atk:GetLevel(), Atk:GetLevel() * 2 + 8); 
		end
		if Target:GetCommand() == LuaI.BATCMD_DEFEND then
			FinalDam = FinalDam / 2;
			Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
			if CritHit == 1 then
				Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
			end
        end	
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
		end
		targetlist[i]:ChangeHp(-1 * FinalDam);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
    end
end


