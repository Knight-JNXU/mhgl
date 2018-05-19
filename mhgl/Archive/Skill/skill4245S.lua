--飞渡天河

function skill4245CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4245Use(Atk, Target, battle, skillLv)

	local consumeDp = 80;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local targetlist = {};
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展飞渡天河", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:IsBuffExist(1415) then
			targetlist[i]:RemoveBuff(1415);
			targetlist[i]:AddBuff(1416, skillLv, 0, 0, 150, 100);
		elseif targetlist[i]:IsBuffExist(1416) then
			targetlist[i]:RemoveBuff(1416);
		else
			targetlist[i]:AddBuff(1513, skillLv, 0, 0, 150, 100);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end


