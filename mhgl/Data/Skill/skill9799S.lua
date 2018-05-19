--梵天护法

function skill9799CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill9799Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		
		targetlist[i]:AddBuff(1608, skillLv, 0, 0, 3, 100);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

