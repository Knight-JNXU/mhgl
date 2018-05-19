--梵音清唱

function skill9797CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill9797Use(Atk, Target, battle, skillLv)

	local targetlist = {};
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:IsBuffExist(1508) then
			targetlist[i]:RemoveBuff(1508);
			targetlist[i]:AddBuff(1509, skillLv, 0, 0, 150, 100);
		elseif targetlist[i]:IsBuffExist(1509) then
			targetlist[i]:RemoveBuff(1509);
		else
			targetlist[i]:AddBuff(1412, skillLv, 0, 0, 150, 100);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end


