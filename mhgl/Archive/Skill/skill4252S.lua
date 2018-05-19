--力神破甲

function skill4252CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4252Use(Atk, Target, battle, skillLv)

	local consumeDp = 35;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展力神破甲", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	if Target:IsBuffExist(1510) then
		Target:RemoveBuff(1510);
	elseif Target:IsBuffExist(1511) then
		Target:RemoveBuff(1511);
		Target:AddBuff(1414, skillLv, 0, 0, 150, 100);
	else
		Target:AddBuff(1413, skillLv, 0, 0, 150, 100);
	end
	battle:PushReactionActor(Target);
end

