--活血生肌

function skill0135CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需妙手回春修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0135Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.3 * skillLv;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展活血生肌", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local weaponDam = 0.17 * Atk:GetWeaponATK();
	--local rec = 3 * skillLv + weaponDam + 0.02 * Target:GetMaxHP();
	local rec = 3.8 * skillLv + weaponDam + 0.02 * Target:GetMaxHP() + 0.17 * Atk:GetPOW();
	if rec <= 1 then
		rec = 1;
	end
	
	Target:ChangeHp(rec);
	Target:RemoveBuff(71);
	Target:RemoveBuff(72);
	battle:PushReactionActor(Target);
	
end

