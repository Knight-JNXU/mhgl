--MOB幽冥噬魄

function skill6245CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill6245Use(Atk, Target, battle, skillLv)
	
	local Lv = Atk:GetLevel();
	--[[local consumeDp = 70;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展幽冥噬魄", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	if Target:IsBoss() then
		Atk:SkillFail("无法对主怪使用");
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);]]
	
	local FinalDam = 0.3 * Target:GetSP() + Target:GetLevel();
	if FinalDam > Target:GetLevel() * 35 then
		FinalDam = Target:GetLevel() * 35;
	end
	
	if Atk:GetMob_id() == 22038 then
		FinalDam = 0.4 * FinalDam;
	end
	
	if FinalDam < 1 then
		FinalDam = 1;
	end
	Target:ChangeSp(-1 * FinalDam);
	battle:PushReactionActor(Target);
end

