--圣灵附体

function skill9796CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill9796Use(Atk, Target, battle, skillLv)

	local targetlist = {};
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:IsBuffExist(1413) then
			targetlist[i]:RemoveBuff(1413);
			targetlist[i]:AddBuff(1414, skillLv, 0, 0, 150, 100);
		elseif targetlist[i]:IsBuffExist(1414) then
			targetlist[i]:RemoveBuff(1414);
		else
			targetlist[i]:AddBuff(1511, skillLv, 0, 0, 150, 100);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

