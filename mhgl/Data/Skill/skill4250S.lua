--狮吼震天

function skill4250CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4250Use(Atk, Target, battle, skillLv)

	local consumeDp = 35;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	if Atk:HasSkill(4088) then
		consumeDp = consumeDp * 0.8;
  end	
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展狮吼震天", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	if Target:IsBuffExist(1508) then
		Target:RemoveBuff(1508);
	elseif Target:IsBuffExist(1509) then
		Target:RemoveBuff(1509);
		Target:AddBuff(1412, skillLv, 0, 0, 150, 100);
	else
		Target:AddBuff(1411, skillLv, 0, 0, 150, 100);
	end
	battle:PushReactionActor(Target);
end

