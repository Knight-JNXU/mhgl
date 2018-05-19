--活血化瘀

function skill0134CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需妙手回春修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0134Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 1.3 * skillLv;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展活血化瘀", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local weaponDam = 0.17 * Atk:GetWeaponATK();
	--local rec1 = 3 * skillLv + weaponDam + 0.02 * Target:GetMaxHP();
	local rec1 = 3.8 * skillLv + weaponDam + 0.02 * Target:GetMaxHP() + 0.17 * Atk:GetPOW();
	if rec1 <= 1 then
		rec1 = 1;
	end
	
	--local rec2 = 1.5 * skillLv + weaponDam;
	local rec2 = 1.9 * skillLv + weaponDam  + 0.17 * Atk:GetPOW();
	if rec2 <= 1 then
		rec2 = 1;
	end
	
	Target:ChangeHp(rec1);
	Target:ChangeMHp(rec2, false);
	battle:PushReactionActor(Target);
	
end

