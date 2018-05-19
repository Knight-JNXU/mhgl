--MOB屠戮友军

function skill5289CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill5289Use(Atk, Target, battle, skillLv)

	--[[local consumeSp = 1 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展神灵归元术", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end]]

	local rec1 = Target:GetHP();
	
	--[[if (Target:IsPlayer() and Target:GetHP() == 0) == false then 
		Atk:SkillFail("\#W[战斗讯息]：目标无效");
		do return end
	else 
		Atk:ChangeSp(-1 * consumeSp, false);]]
	local Lv = Atk:GetLevel();
		
		if Target:IsBuffExist(3106) then
			Target:ChangeHp(-1.1 * rec1);
		else
			Target:ChangeHp(0.3 * rec1);
		end
		battle:PushReactionActor(Target);
	--end
	
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
