--圣灵附体

function skill4243CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4243Use(Atk, Target, battle, skillLv)

	local consumeDp = 80;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	if Atk:HasSkill(4088) then
		consumeDp = consumeDp * 0.8;
  end	
	local targetlist = {};
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展圣灵附体", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
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

