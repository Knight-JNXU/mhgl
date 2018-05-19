--三花聚顶

function skill3232CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	local consumeHp = 0.4 * skillLv + 10;
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需明性修身修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1812) then
		Atk:SkillFail("\#W此招式不能使用过于频繁");
		do return end
	elseif Atk:GetHP() <= consumeHp then
		local Msg = string.format("\#W生命不足\#G%d\#W，无法施展三花聚顶", consumeHp);
		Atk:SkillFail(Msg);
	end
end

function skill3232Use(Atk, Target, battle, skillLv)
	
	local consumeHp = 0.4 * skillLv + 10;
	local spChange = 0.8 * skillLv + 20;
	
	Atk:ChangeHp(-1 * consumeHp);
	Target:ChangeSp(2 * spChange);
	Atk:AddBuff(1812, skillLv, 0, 0, 2, 100);
	
end

