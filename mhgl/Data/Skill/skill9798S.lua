--力神碎甲

function skill9798CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill9798Use(Atk, Target, battle, skillLv)

	local targetlist = {};
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:IsBuffExist(1510) then
			targetlist[i]:RemoveBuff(1510);
			targetlist[i]:AddBuff(1511, skillLv, 0, 0, 150, 100);
		elseif targetlist[i]:IsBuffExist(1511) then
			targetlist[i]:RemoveBuff(1511);
		else
			targetlist[i]:AddBuff(1414, skillLv, 0, 0, 150, 100);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

