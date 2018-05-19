--BOSS万相神功

function skill8079CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	--do return end
end

function skill8079Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local targetlist = {};
	
	local maxTargetCount = math.floor((Lv - 15) / 25) + 2;
	
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
	
	local consumeSp = (0.1 * Lv + 5) * count;
	
	if Atk:GetSP() < consumeSp then
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		--local nDam = Atk:GetSkillLv(378) - targetlist[i]:GetSkillLv(379);
		local nDam = 0;
		local FinalDam = (Atk:GetPOW() - targetlist[i]:GetPOW() + (1.6 - 0.1 * math.floor((Lv - 15) / 25)) * Lv  + 40) * 1.05 ^ nDam;
		if FinalDam <= 10 then
			FinalDam = math.random(Lv, Lv * 2 + 8);
		end
		targetlist[i]:ChangeHp(-1 * FinalDam);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

