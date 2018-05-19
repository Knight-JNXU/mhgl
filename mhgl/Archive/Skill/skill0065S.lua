--横云遮日

function skill0065CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需力臂山岳修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(40) then
		Atk:SkillFail("\#W[战斗讯息]：不能重复施展横云遮日");
	end
	
end

function skill0065Use(Atk, Target, battle, skillLv)

	local consumeSp = 0.5 * skillLv + 5;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展横云遮日", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	Target:AddBuff(40, skillLv, 0, 0, 1, 100);  --2 turn
	battle:PushReactionActor(Target);	
end

