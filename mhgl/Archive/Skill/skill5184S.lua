--MOB护体金针

function skill5184CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5184Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local targetlist = {};
	local maxTargetCount = math.floor((Lv + 10 - 30) / 25) + 2;
	if Target:IsBuffExist(1504) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在护体金针状态");
		do return end
	end	
	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor((Lv + 10 - 30) / 25) + 3;
	    if maxTargetCount > 6 then
		    maxTargetCount = 6;
	    elseif maxTargetCount < 3 then
		    maxTargetCount = 3;
	    end
	end
	
	local bufflist = {1504, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, DEFDownSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		local turn = 2 + math.floor((Lv + 10 - 30) / 30);
	local consumeSp = ((0.5 * Lv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展护体金针", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);		
		if turn < 2 then 
			turn = 2;
		elseif turn > 5 then
			turn = 5;
		end
	
		local effectDef = targetlist[i]:GetDEF() * 1075 / 1000;
		if effectDef <= 1 then
			effectDef = 1;
		end
		
		targetlist[i]:AddBuff(1504, (Lv + 10), effectDef, 0, turn, 100);
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

