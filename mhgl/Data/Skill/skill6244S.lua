--MOB幽冥噬血

function skill6244CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill6244Use(Atk, Target, battle, skillLv)
	
	local Lv = Atk:GetLevel();
	--[[local consumeDp = 70;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展幽冥噬血", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	if Target:IsBoss() then
		Atk:SkillFail("无法对主怪使用");
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);]]
	
	local FinalDam = 0.2 * Target:GetHP() + Target:GetLevel();
	if FinalDam > Target:GetLevel() * 40 then
		FinalDam = Target:GetLevel() * 40;
	end
	
	if Atk:GetMob_id() == 22038 then
		FinalDam = 0.4 * FinalDam;
	end
	
	if FinalDam < 10 then
		FinalDam = math.random(1, 10);
	end
	Target:ChangeHp(-1 * FinalDam);
	Atk:ChangeHp(FinalDam);
	battle:PushReactionActor(Target);
end

