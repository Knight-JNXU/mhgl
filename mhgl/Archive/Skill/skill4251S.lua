--梵音清唱

function skill4251CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4251Use(Atk, Target, battle, skillLv)

	local consumeDp = 80;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local targetlist = {};
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展梵音清唱", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
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


