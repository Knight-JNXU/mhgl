--变身

function skill22051CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需九转玄功修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(3070) then
		Atk:SkillFail("\#W[战斗讯息]：已经处在不动如山状态");
	end
end

function skill22051Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 20;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展不动如山", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local AttriAtk = 0.01 * (skillLv + Atk:GetLevel());
	Target:AddBuff(3007, skillLv, AttriAtk, 0, 150, 100);
	battle:PushReactionActor(Target);
	
end
