--推宫过气

function skill2832CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	local consumeSp = 0.8 * skillLv + 10;
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W此招式需青莲秘籍修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetSP() < consumeSp then
		local Msg = string.format("\#W內力不足\#G%d\#W，无法施展推宫过气", consumeSp);
		Atk:SkillFail(Msg);
	end
end

function skill2832Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.8 * skillLv + 10;
	
	Atk:ChangeSp(-1 * consumeSp);
	
	--local weaponDam = 0.17 * Atk:GetWeaponATK();
	local skillDam = (Atk:GetSkillLv(2800) + Atk:GetSkillLv(2810) + Atk:GetSkillLv(2820) 
					+ Atk:GetSkillLv(2830) + Atk:GetSkillLv(2840)) * 0.48 + (Atk:GetSkillLv(2800) ^ 2 
					+ Atk:GetSkillLv(2810) ^ 2 + Atk:GetSkillLv(2820) ^ 2 + Atk:GetSkillLv(2830) ^ 2 
					+ Atk:GetSkillLv(2840) ^ 2 ) * 0.0016 + 20 ;
	local rec1 = 4 * skillLv + 0.5 * skillDam + 0.02 * Target:GetMaxHP() + 0.15 * Atk:GetPOW();
	
	rec1 = rec1 / 3;
	
	if rec1 <= 1 then
		rec1 = 1;
	end
	if rec1 > Target:GetMHP() then
		rec1 = Target:GetMHP();
	end
	
	local rec2 = 4 * skillLv + 0.15 * Atk:GetPOW() + 0.5 * skillDam;
	if rec2 <= 1 then
		rec2 = 1;
	end
	if rec2 > Target:GetMaxHP() then
		rec2 = Target:GetMaxHP();
	end
	
	Target:ChangeMHp(rec2);
	Target:ChangeHp(rec1);
	
end

