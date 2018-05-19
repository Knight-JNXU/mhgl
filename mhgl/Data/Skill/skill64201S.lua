--逍遥游

function skill64201CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	local consumeVp = 100;
	
if Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[系统讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetVP() < consumeVp then
		local Msg = string.format("\#W体力不足\#G%d\#W，无法使用无中生有", consumeVp);
		Atk:SkillFail(Msg);
	end	
end

function skill64201Use(Atk, Target, battle, skillLv)
	
	local consumeVp = 100;
	
	local freeSlot = Atk:GetItems():GetFreeSlot(0);
	if freeSlot >= 1 then
		
		Atk:ChangeVP(-1 * consumeVp);
		
		Atk:GetItems():AddItem(RandTable{32401, 32402, 32403, 32250, 32240, 32230, 32190, 32260, 32280, 32320, 32300, 32310, 32220, 63042, 63043, 61021, 401669}, 1);
		Atk:SkillFail("\#W制作成功");
	else
		Atk:SkillFail("你的当前包裹已满，请整理后再使用无中生有");
	end
end

