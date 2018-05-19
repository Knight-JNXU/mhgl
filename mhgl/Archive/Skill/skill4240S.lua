--大罗一现

function skill4240CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4240Use(Atk, Target, battle, skillLv)

	local consumeDp = 40;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展大罗一现", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	if Target:IsBuffExist(1411) then
		Target:RemoveBuff(1411);
	elseif Target:IsBuffExist(1412) then
		Target:RemoveBuff(1412);
		Target:AddBuff(1509, skillLv, 0, 0, 150, 100);
	else
		Target:AddBuff(1508, skillLv, 0, 0, 150, 100);
	end
	battle:PushReactionActor(Target);
end

