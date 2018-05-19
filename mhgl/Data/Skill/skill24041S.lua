--幽冥鬼眼

function skill24041CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

end

function skill24041Use(Atk, Target, battle, skillLv)
	
	if Target:IsBuffExist(56) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在明光宝烛状态");
		do return end
	end
	
	local Lv = Atk:GetLevel();
	local targetlist = {};
	local maxTargetCount = 1;
	if skillLv >= 30 and skillLv < 60 then
	  maxTargetCount = 2
	elseif skillLv >= 60 and skillLv < 90 then
	  maxTargetCount = 3
	elseif skillLv >= 90 and skillLv < 120 then
	  maxTargetCount = 4
	elseif skillLv >= 120 and skillLv < 150 then
	  maxTargetCount = 5
	elseif skillLv >= 150 then
	  maxTargetCount = 6
	end
	
	local bufflist = {56, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((Lv - 30)/ 25) * 25 + 30;
	local consumeSp = 20 * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展明光宝烛", consumeSp);

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
		
		targetlist[i]:AddBuff(56, 1, 0, 0, turn, 100);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

