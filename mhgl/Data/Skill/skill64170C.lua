--风雷七星斩
function skill64170CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需横扫千军修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		LuaUI.SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		LuaUI.SkillFail(Msg);
	end	
end

function skill64170Consume(skillLv)
	
	--local Msg = string.format();
	LuaUI.FormatToSkillString("10%当前生命");
end

