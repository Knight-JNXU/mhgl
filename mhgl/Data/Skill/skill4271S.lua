--八荒六合斩

function skill4271CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4271Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local consumeDp = 100;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	if Atk:HasSkill(4088) then
		consumeDp = consumeDp * 0.8;
  end	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展八荒六合斩", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local FinalDam = 1.2 * targetlist[i]:GetCON() * (1 + Atk:GetWC() / 150);
		if FinalDam < 75 then
			FinalDam = 75;
		end
		local FinalDamSP = FinalDam * 0.6;
		
		targetlist[i]:ChangeHp(-1 * FinalDam);
		targetlist[i]:ChangeSp(-1 * FinalDamSP);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

