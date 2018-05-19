--金钟御体

function skill4242CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4242Use(Atk, Target, battle, skillLv)

	local consumeDp = 40;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	if Atk:HasSkill(4088) then
		consumeDp = consumeDp * 0.8;
  end	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展金钟御体", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	if Target:IsBuffExist(1413) then
		Target:RemoveBuff(1413);
	elseif Target:IsBuffExist(1414) then
		Target:RemoveBuff(1414);
		Target:AddBuff(1511, skillLv, 0, 0, 150, 100);
	else
		Target:AddBuff(1510, skillLv, 0, 0, 150, 100);
	end
	battle:PushReactionActor(Target);
end

