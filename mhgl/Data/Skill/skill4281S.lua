--梵天护法

function skill4281CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4281Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local consumeDp = 150;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	if Atk:HasSkill(4088) then
		consumeDp = consumeDp * 0.8;
  end	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展梵天护法", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		
		targetlist[i]:AddBuff(1608, skillLv, 0, 0, 3, 100);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

