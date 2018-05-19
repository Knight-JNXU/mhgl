--跑镖MOB无穷物抗和法抗转换

function skill5672CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5672Use(Atk, Target, battle, skillLv)
    local Lv = Atk:GetLevel();
	local nDamskill1 = 0;
	local targetlist = {};	
	local listIndex = 0;
	local actor = battle:GetActor(listIndex);		
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do		
		local hpChange = -1 * Lv;
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(hpChange);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	if not Atk:IsBuffExist(297) and not Atk:IsBuffExist(298) then
		local r = math.random(1,2)
		if r == 1 then
			Atk:AddBuff(297, 0, 0, 0, 120, 100);
		else
			Atk:AddBuff(298, 0, 0, 0, 120, 100);
		end
	elseif Atk:IsBuffExist(297) and not Atk:IsBuffExist(298) then
		Atk:AddBuff(298, 0, 0, 0, 120, 100);
		Atk:RemoveBuff(297);
	elseif not Atk:IsBuffExist(297) and Atk:IsBuffExist(298) then
		Atk:AddBuff(297, 0, 0, 0, 120, 100);
		Atk:RemoveBuff(298);
	end
end

