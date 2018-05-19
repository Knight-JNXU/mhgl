--MOB淡月弄梅

function skill6249CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6249Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local targetlist = {};
	local maxTargetCount = 10;

	local bufflist = {3080};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, DEFUpSort, bufflist, 1);
	
	local i = 0;
	while targetlist[i] ~= nil do	
		
		targetlist[i]:AddBuff(1125, (Lv + 10), 0, 0, 120, 100);		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

