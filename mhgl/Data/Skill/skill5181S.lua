--MOB归元术+活血生肌

function skill5181CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5181Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
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
	
	
	local rec1 = 4.6 * (Lv + 10) + 0.02 * Target:GetMaxHP() + 0.15 * Atk:GetPOW();
	local rec2 = 2.2 * (Lv + 10) + 0.15 * Atk:GetPOW();
	
	if Target:IsMob() == true then
		rec1 = rec1 + 1.5 * nDamsBonus1 * Lv;
		rec2 = rec2 + 0.75 * nDamsBonus1 * Lv;
	end
	
	if rec1 <= 1 then
		rec1 = 1;
	end
	
	if rec1 > Target:GetMHP() then
		rec1 = Target:GetMHP();
	end
	
	if rec2 <= 1 then
		rec2 = 1;
	end
	if rec2 > Target:GetMaxHP() then
		rec2 = Target:GetMaxHP();
	end
	
	Target:ChangeHp(rec1);
	Target:ChangeMHp(rec2);
	battle:PushReactionActor(Target);
	
end

