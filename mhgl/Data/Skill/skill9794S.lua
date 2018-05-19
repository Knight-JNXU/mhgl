--刑天之怒

function skill9794CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill9794Use(Atk, Target, battle, skillLv)

	local targetlist = {};
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:IsBuffExist(1411) then
			targetlist[i]:RemoveBuff(1411);
			targetlist[i]:AddBuff(1412, skillLv, 0, 0, 150, 100);
		elseif targetlist[i]:IsBuffExist(1412) then
			targetlist[i]:RemoveBuff(1412);
		else
			targetlist[i]:AddBuff(1509, skillLv, 0, 0, 150, 100);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

