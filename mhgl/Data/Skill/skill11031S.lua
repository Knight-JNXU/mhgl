--魔王护持

function skill11031CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需牛逼神功修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	else
		Atk:SkillFail("此技能为被动技能，可到杂货店购买生命临时符进行强化");
	end
end

function skill11031Use(Atk, Target, battle, skillLv)
end

