--气聚丹田

function skill0020CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需金鹏心法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(36) then
		Atk:SkillFail("\#W[战斗讯息]：不能重复气聚丹田");
		do return end
	elseif Atk:IsBuffExist(75) then
		Atk:SkillFail("\#W[战斗讯息]：真气恢复中，暂时无法气聚丹田");
		do return end
	end
	
end

function skill0020Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.3 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法气聚丹田", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local AttriPow = 0.5 * skillLv
	Target:AddBuff(36, 0, AttriPow, 0, 6, 100);
	battle:PushReactionActor(Target);
	
end
