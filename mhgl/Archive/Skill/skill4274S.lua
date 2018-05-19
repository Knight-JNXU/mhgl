--天虹倒划

function skill4274CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4274Use(Atk, Target, battle, skillLv)

	local consumeDp = 45;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展天虹倒划", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local FinalDam = 0.75 * Target:GetSTR() * (1 + Atk:GetWC() / 200);
	if FinalDam < 75 then
		FinalDam = 75;
	end
	local FinalDamSP = FinalDam * 0.75;
	
	Target:ChangeHp(-1 * FinalDam);
	Target:ChangeSp(-1 * FinalDamSP);
	battle:PushReactionActor(Target);
end
