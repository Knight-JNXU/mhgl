--BOSS谢小峰神剑

function skill0618CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0618Use(Atk, Target, battle, skillLv)
	
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
	while targetlist[i] ~= nil do
	--for i = 0, targetcounter  - 1 do
		local nDam = Atk:GetSkillLv(378) - targetlist[i]:GetSkillLv(379);
		local hpChange = (Atk:GetPOW() - targetlist[i]:GetPOW() + 
						(2.5 - 0.3 * math.floor((Lv - 25) / 25)) * Lv)  * 1.05 ^ nDam * 0.65;
		if hpChange <= 10 then
			hpChange = math.random(Atk:GetLevel(), Atk:GetLevel() * 2 + 8);
		end
		
		targetlist[i]:ChangeHp(-1 * hpChange);
		battle:PushReactionActor(targetlist[i]);
		local turn = 2 + math.floor((Lv - targetlist[i]:GetLevel()) / 5);
	
		if turn < 0 then
			turn = 0;
		elseif turn > 3 then
			turn = 3;
		end
		targetlist[i]:AddBuff(71, 0, 0, 0, turn, 100);
		i = i + 1;
	end
end

