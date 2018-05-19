--MOB兵器谱积分+2

function skill6258CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6258Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local maxTargetCount = 1;
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	

	local i = 0;
	while targetlist[i] ~= nil do		
		targetlist[i]:AddBuff(3157, 2, 0, 0, 150, 100);		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	if not Atk:IsBuffExist(4000) then
		Atk:AddBuff(4000, (Lv + 10), 0, 0, 150, 100);
		Atk:AddBuff(3148, (Lv + 10), 0, 0, 4, 100);
	else
		Atk:AddBuff(4001, (Lv + 10), 0, 0, 150, 100);
	end
end 