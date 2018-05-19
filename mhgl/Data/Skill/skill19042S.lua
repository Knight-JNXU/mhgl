--活血

function skill19042CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需岐黄之术修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill19042Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.4 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展活血", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(2020) then
		Atk:SkillFail("\#W[战斗讯息]：此目标不能接收治疗");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local skillDam = (Atk:GetSkillLv(2800) + Atk:GetSkillLv(2810) + Atk:GetSkillLv(2820) 
					+ Atk:GetSkillLv(2830) + Atk:GetSkillLv(2840)) * 0.48 + (Atk:GetSkillLv(2800) ^ 2 
					+ Atk:GetSkillLv(2810) ^ 2 + Atk:GetSkillLv(2820) ^ 2 + Atk:GetSkillLv(2830) ^ 2 
					+ Atk:GetSkillLv(2840) ^ 2 ) * 0.0016 + 20 ;
	local rec1 = 4.6 * skillLv + 0.1 * skillDam + 0.02 * Target:GetMaxHP() + 0.15 * (Atk:GetPOW() + Atk:GetWeaponATK());
	
	rec1 = rec1 / 3;
	
	if rec1 <= 1 then
		rec1 = 1;
	end
	if rec1 > Target:GetMHP() then
		rec1 = Target:GetMHP();
	end
	
	local rec2 = 2.2 * skillLv + 0.1 * skillDam  + 0.15 * Atk:GetPOW();
	if rec2 <= 1 then
		rec2 = 1;
	end
	if rec2 > Target:GetMaxHP() then
		rec2 = Target:GetMaxHP();
	end
	
	Target:ChangeMHp(rec2);
	Target:ChangeHp(rec1);
	battle:PushReactionActor(Target);
	
end

