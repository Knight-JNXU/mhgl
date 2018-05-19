--打坐

function skill0387CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	local consumeSp = 70;
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[系统讯息]：此招式需打坐修炼到\#G%d\#W级以上才能使用。", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[系统讯息]：此招式需人物等级\#G%d\#W以上才能使用。", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetSP() < consumeSp then
		local Msg = string.format("\#W内力不足\#G%d\#W，无法进行打坐。", consumeSp);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetCurPet() ~= nil then
		Atk:SkillFail("\#W坐骑状态下无法进行打坐。");
	elseif Atk:GetMobID() ~= 0 then
		Atk:SkillFail("\#W变身状态下无法进行打坐。");
	end
end

function skill0387Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 70;
	
	Atk:ChangeSp(-1 * consumeSp);
	Atk:Sit();

end
