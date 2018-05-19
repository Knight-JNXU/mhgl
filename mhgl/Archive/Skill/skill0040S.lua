--反手道

function skill0040CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需混元乾坤修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(55) == false then
		Atk:SkillFail("\#W[战斗讯息]：此招式需先达到行云流水的境界后才能施展");
	end
	
end

function skill0040Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.5 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展反手道", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	--local FinalDam = 4 * skillLv;
	
	local nDam = Atk:GetSkillLv(378) - Target:GetSkillLv(379);
	local weaponDam = 0.25 * Atk:GetWeaponATK();
	local FinalDam = (Atk:GetPOW() - (1 - 0.1 * skillLv /100) * Target:GetPOW() + skillLv + weaponDam)  * 1.05 ^ nDam;
	if FinalDam <= 1 then
		FinalDam = 1;
	end
	
	--local FirstAttrib = math.random(1 , 5);
	local result = skillCanHit(Atk, Target);
	if result == 2 then
		Target:MissSkill();
	else	
		Target:AddBuff(76 , skillLv, 0, 0, 4, 100);
		Target:ChangeHp(-1 * FinalDam);
	end
	--Target:ChangeMHp(-0.5 * FinalDam);
	battle:PushReactionActor(Target);
	
end

