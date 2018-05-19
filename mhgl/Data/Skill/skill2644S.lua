--云体风身

function skill2644CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需神道无念修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(3072) then
		Atk:SkillFail("\#W[战斗讯息]：已经处在分身术状态");
	end
end

function skill2644Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 1.5 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展分身术", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local AttriAtk = 0.8 * (skillLv + Atk:GetLevel());
	Target:AddBuff(3072, skillLv, AttriAtk, 0, 2, 100);
	battle:PushReactionActor(Target);
	
end
