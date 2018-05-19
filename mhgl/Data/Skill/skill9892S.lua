--万伤聚华

function skill9892CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

end
function skill9892Use(Atk, Target, battle, skillLv)

	local consumeDp = 150;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local targetlist = {};
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展万伤聚华", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	Atk:ChangeDp(-1 * consumeDp, false);
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	local i = 0;
	while targetlist[i] ~= nil do
		targetlist[i]:AddBuff(63520, 0, 0, 0, 3, 0);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end
