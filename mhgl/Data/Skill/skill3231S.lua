--云寂术

function skill3231CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

	if skillLv < reqSkillLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需清心诀修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill3231Use(Atk, Target, battle, skillLv)
	
	if Target:IsBuffExist(1807) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在云寂术状态");
		do return end
	end
	
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 30) / 25) + 2;

	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end

	local bufflist = {1807, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((skillLv - 30)/ 25) * 25 + 30;
	local consumeSp = ((0.5 * MSSLv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展云寂术", consumeSp);

	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp,false);

	local turn = 2 + math.floor((skillLv - 30) / 25);

	if turn < 2 then
		turn = 2;
	elseif turn > 5 then
		turn = 5;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		
		if targetlist[i]:IsBuffExist(2014) then
			turn = turn * 2;
		end
		if targetlist[i]:IsBuffExist(2047) then
			turn = turn * 4;
		end
		
		targetlist[i]:AddBuff(1807, skillLv, 0, 0, turn, 100);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

