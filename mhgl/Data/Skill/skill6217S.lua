--MOB屠戮友军

function skill6217CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill6217Use(Atk, Target, battle, skillLv)

	
	local rec1 = Target:GetHP();
	local Lv = Atk:GetLevel();
	local rec2 = 0.5 * Atk:GetMaxHP();
		
	if Target:IsBuffExist(3106) then
		Target:ChangeHp(-1.1 * rec1);
		Atk:ChangeHp(rec2);
	else
		Target:ChangeHp(0.3 * rec1);
	end
	battle:PushReactionActor(Target);
	
	
	if not Atk:IsBuffExist(4000) and Target:IsBuffExist(3106) then
		Atk:AddBuff(4000, 1, 0, 0, 120, 100);
	elseif Atk:FindBuff(4000):GetBuffValue1() == 1 and Target:IsBuffExist(3106) then
		Atk:RemoveBuff(4000);
		Atk:AddBuff(4000, 2, 0, 0, 120, 100);
	elseif Atk:FindBuff(4000):GetBuffValue1() == 2 and Target:IsBuffExist(3106) then
		Atk:RemoveBuff(4000);
		Atk:AddBuff(4000, 3, 0, 0, 120, 100);
	elseif Atk:FindBuff(4000):GetBuffValue1() == 3 and Target:IsBuffExist(3106) then
		Atk:RemoveBuff(4000);
		Atk:AddBuff(4000, 4, 0, 0, 120, 100);
	elseif Atk:FindBuff(4000):GetBuffValue1() == 4 and Target:IsBuffExist(3106) then
		Atk:RemoveBuff(4000);
		Atk:AddBuff(3107, (Lv + 10), 0, 0, 120, 100);
	end
end
