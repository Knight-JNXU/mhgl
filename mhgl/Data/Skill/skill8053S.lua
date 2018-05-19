--大魔飞龙式

function skill8053CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8053Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	if Target:IsBuffExist(1522) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在大魔飞龙式状态");
		do return end
	end
	
	local targetlist = {};
	local maxTargetCount = 3;
	
	local bufflist = {1522, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, ATKDownSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((Lv - 25)/ 25) * 25 + 25;
	local consumeSp = 10 * ((0.5 * MSSLv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展大魔飞龙式", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 5;
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:IsBuffExist(2014) then
			turn = turn * 2;
		end
		if targetlist[i]:IsBuffExist(2047) then
			turn = turn * 4;
		end
		
		targetlist[i]:AddBuff(1522, 1, 0, 0, turn, 100);
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

