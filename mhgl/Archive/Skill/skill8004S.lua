--千金坠

function skill8004CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

end

function skill8004Use(Atk, Target, battle, skillLv)
	
	if Target:IsBuffExist(1807) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在千金坠状态");
		do return end
	end
	
	local Lv = Atk:GetLevel();
	local targetlist = {};
	local maxTargetCount = 5;
	
	local bufflist = {1807, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((Lv - 30)/ 25) * 25 + 30;
	local consumeSp = 10 * ((0.5 * MSSLv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展千金坠", consumeSp);

	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp,false);

	local turn = 5;

	local i = 0;
	while targetlist[i] ~= nil do
		
		if targetlist[i]:IsBuffExist(2014) then
			turn = turn * 2;
		end
		if targetlist[i]:IsBuffExist(2047) then
			turn = turn * 4;
		end
		
		targetlist[i]:AddBuff(1807, 1, 0, 0, turn, 100);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

