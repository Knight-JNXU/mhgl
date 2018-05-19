--小酥麻功

function skill4254CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4254Use(Atk, Target, battle, skillLv)

	local consumeDp = 35;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	if Atk:HasSkill(4088) then
		consumeDp = consumeDp * 0.8;
  end	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展小酥麻功", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	if Target:IsBuffExist(1512) then
		Target:RemoveBuff(1512);
	elseif Target:IsBuffExist(1513) then
		Target:RemoveBuff(1513);
		Target:AddBuff(1416, skillLv, 0, 0, 150, 100);
	else
		Target:AddBuff(1415, skillLv, 0, 0, 150, 100);
	end
	battle:PushReactionActor(Target);
end

