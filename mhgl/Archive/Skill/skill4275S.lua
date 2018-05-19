--万刃穿心

function skill4275CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4275Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local consumeDp = 100;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展万刃穿心", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local FinalDam = 0.75 * targetlist[i]:GetSTR() * (1 + Atk:GetWC() / 250);
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

