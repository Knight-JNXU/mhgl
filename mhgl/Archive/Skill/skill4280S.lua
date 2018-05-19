--无量金身

function skill4280CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4280Use(Atk, Target, battle, skillLv)

	local consumeDp = 60;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展无量金身", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	Target:AddBuff(1608, skillLv, 0, 0, 3, 100);
	battle:PushReactionActor(Target);
end

