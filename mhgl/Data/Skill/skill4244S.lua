--御风诀

function skill4244CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4244Use(Atk, Target, battle, skillLv)

	local consumeDp = 40;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	if Atk:HasSkill(4088) then
		consumeDp = consumeDp * 0.8;
  end	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展御风诀", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	if Target:IsBuffExist(1415) then
		Target:RemoveBuff(1415);
	elseif Target:IsBuffExist(1416) then
		Target:RemoveBuff(1416);
		Target:AddBuff(1513, skillLv, 0, 0, 150, 100);
	else
		Target:AddBuff(1512, skillLv, 0, 0, 150, 100);
	end
	battle:PushReactionActor(Target);
end

