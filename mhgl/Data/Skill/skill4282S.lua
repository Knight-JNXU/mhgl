--修罗之伤

function skill4282CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4282Use(Atk, Target, battle, skillLv)

	local consumeDp = 60;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	if Atk:HasSkill(4088) then
		consumeDp = consumeDp * 0.8;
  end	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展修罗之伤", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	Target:AddBuff(1702, skillLv, 0, 0, 4, 100);
	battle:PushReactionActor(Target);
end

