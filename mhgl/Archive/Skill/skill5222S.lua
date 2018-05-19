--MOB云寂术

function skill5222CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5222Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local targetlist = {};
	local maxTargetCount = math.floor((Lv + 10 - 30) / 25) + 2;
if Target:IsBuffExist(1807) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在云寂术状态");
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
	
	local bufflist = {1807, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local consumeSp = ((0.5 * Lv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展云寂术", consumeSp);

	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp,false);

	local turn = 2 + math.floor((Lv + 10 - 30) / 30);

	if turn < 2 then
		turn = 2;
	elseif turn > 7 then
		turn = 7;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do

		targetlist[i]:AddBuff(1807, (Lv + 10), 0, 0, turn, 100);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

