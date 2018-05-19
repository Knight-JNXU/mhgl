--附防秘技

function skill2032CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需鬼眼心经修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	else
		Atk:SkillFail("此技能为被动技能，可到杂货店购买防御附魔符进行附魔");
	end
end

function skill2032Use(Atk, Target, battle, skillLv)
end

