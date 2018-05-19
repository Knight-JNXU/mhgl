--飞行符

function skill2632CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	local consumeVp = 6;
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[系统讯息]：此招式需符之术修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[系统讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetVP() < consumeVp then
		local Msg = string.format("\#W体力不足\#G%d\#W，无法制作飞行符", consumeVp);
		Atk:SkillFail(Msg);
	end	
end

function skill2632Use(Atk, Target, battle, skillLv)
	
	local consumeVp = 6;
	
	local freeSlot = Atk:GetItems():GetFreeSlot(0);
	if freeSlot >= 1 then
		
		Atk:ChangeVP(-1 * consumeVp);
		
		Atk:GetItems():AddItem(30002, 1);
		Atk:SkillFail("\#W制作成功，获得飞行符");
	else
		Atk:SkillFail("你的当前包裹已满，请整理后再制作飞行符");
	end
end

