--MOB弑魔

function skill6243CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill6243Use(Atk, Target, battle, skillLv)

	local Lv = Atk:GetLevel();
	--[[local consumeDp = 50;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展弑魔", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);]]
	
	local FinalDam = 0.2 * Target:GetSP() + Target:GetLevel();
	
	if Atk:GetMob_id() == 22037 then
		FinalDam = FinalDam * 10;
	end
	
	if FinalDam > Target:GetLevel() * 30 then
		FinalDam = Target:GetLevel() * 30;
	end
	if FinalDam < 1 then
		FinalDam = 1;
	end
	Target:ChangeSp(-1 * FinalDam);
	battle:PushReactionActor(Target);
end

