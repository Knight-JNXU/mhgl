--MOB力敌千钧

function skill6246CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill6246Use(Atk, Target, battle, skillLv)

	local Lv = Atk:GetLevel();
	--[[local consumeDp = 45;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展力敌千钧", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);]]
	
	local FinalDam = 1.5 * Target:GetCON();
	if FinalDam < 75 then
		FinalDam = 75;
	end
	local FinalDamSP = FinalDam * 0.6;
	
	if Atk:GetMob_id() == 22037 then
		FinalDam = 20 * FinalDam;
	end
	
	Target:ChangeHp(-1 * FinalDam);
	Target:ChangeSp(-1 * FinalDamSP);
	battle:PushReactionActor(Target);
end

