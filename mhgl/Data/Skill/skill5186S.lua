--MOB神灵归元术

function skill5186CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill5186Use(Atk, Target, battle, skillLv)

	--[[local consumeSp = 1 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展神灵归元术", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end]]

	local rec1 = 0;
	local rec2 = 0;
	--[[if (Target:IsPlayer() and Target:GetHP() == 0) == false then 
		Atk:SkillFail("\#W[战斗讯息]：目标无效");
		do return end
	else 
		Atk:ChangeSp(-1 * consumeSp, false);]]
	local Lv = Atk:GetLevel();
	local nDamskill1 = 0;
	local skill = Atk:GetSkillLv(5300);
	local nDam = 1.02 ^ (math.floor((Lv+100)/173) * math.floor((Lv-73)/3)) * 0.98 ^ Target:GetSkillLv(379);
	
	local DamBonus1 = {0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,11,12,13,14,15,16,17,18,19,20};
	local nDamsBonus1 = 0;
	local j = 1;
	while j <= 30 do
	    nDamskill1 = Atk:GetSkillLv(5430 + j - 1);
		if nDamskill1 == 1 then 
            nDamsBonus1 = nDamsBonus1 + DamBonus1[j];
		end
		j = j + 1;
	end	
	
		rec1 = 3.5 * (Lv + 10) + 0.02 * Target:GetMaxHP() + nDamsBonus1 * Lv;
		rec1 = rec1 * (1 + nDam / 1000);
		if rec1 <= 1 then
			rec1 = 1;
		end
		if rec1 > Target:GetMaxHP() then
			rec1 = Target:GetMaxHP();
		end
		
		rec2 = 5.3 * (Lv + 10) + nDamsBonus1 * Lv;
		rec2 = rec2 * (1 + nDam / 1000);
		if rec2 <= 0  then
			rec2 = 1;
		end
		if rec2 > Target:GetMaxHP() then
			rec2 = Target:GetMaxHP();
		end
		
		if Atk:IsMob() then
			if Atk:GetMob_id() == 30309 or Atk:GetMob_id() == 32163 or Atk:GetMob_id() == 32164 then
				rec1 = 0.5 * Target:GetMaxHP();
				rec2 = 0.5 * Target:GetMaxHP();
			elseif Atk:GetMob_id() == 30713 or Atk:GetMob_id() == 30741 or Atk:GetMob_id() == 32147 or Atk:GetMob_id() == 32148 then
				rec1 = Target:GetMaxHP();
				rec2 = Target:GetMaxHP();
			elseif Atk:GetMob_id() == 2936 or Atk:GetMob_id() == 2937 then
				rec1 = 0.33333333333 * Target:GetMaxHP();
				rec2 = 0.33333333333 * Target:GetMaxHP();
			end
			
		end
		
		Target:ChangeMHp(rec2);
		Target:ChangeHp(rec1);
		battle:PushReactionActor(Target);
	--end
	
end
