--hawker
function skill0373CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	if Atk:GetPet_id() ~= 0 then
		local Msg = string.format("\#W使用坐骑无法摆摊");
		Atk:SkillFail(Msg);
	end
    if Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W20级以后才可以进行摆摊");
		Atk:SkillFail(Msg);
	end
end

function skill0373Use(Atk, Target, battle, skillLv)


		Atk:OpenHawkerOwnerMenu();


end