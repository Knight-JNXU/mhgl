--千伤聚华

function skill9894CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill9894Use(Atk, Target, battle, skillLv)

	local consumeDp = 70;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展千伤聚华", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	Atk:ChangeDp(-1 * consumeDp, false);
	Target:AddBuff(63520, 0, 0, 0, 3, 0);
	battle:PushReactionActor(Target);
end


