--五合聚气

function skill4214CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4214Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local consumeDp = 100;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展五合聚气", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local listIndex = 0;
	local actor = battle:GetActor(listIndex);
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local rec = 0.25 * targetlist[i]:GetMaxSP() + targetlist[i]:GetLevel() * (Atk:GetWC() / 100);
		if rec <= 1 then
			rec = 1;
		end
		if rec > targetlist[i]:GetLevel() * 9 then
			rec = targetlist[i]:GetLevel() * 9;
		end
		
		targetlist[i]:ChangeSp(rec);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

