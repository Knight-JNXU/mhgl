--逍遥游

function skill64200CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

	local consumeVp = 100;
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需上古秘闻修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		LuaUI.SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		LuaUI.SkillFail(Msg);
		do return end
	elseif Atk:GetVP() < consumeVp then
		local Msg = string.format("\#W体力不足\#G%d\#W，无法制作", consumeVp);
		LuaUI.SkillFail(Msg);
	end	
end

function skill64200Consume(skillLv)		
	local  consumeVp = 100;
	local Msg = string.format("%d体力", consumeVp);
	LuaUI.FormatToSkillString(Msg);
end
