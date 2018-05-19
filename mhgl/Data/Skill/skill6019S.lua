--MOB 土属性 绝学 无争山庄

function skill6019CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6019Use(Atk, Target, battle, skillLv)
	local lianjiRate = 30
	if Atk:GetHP() <= Atk:GetMaxHP() and Atk:GetHP() > Atk:GetMaxHP()/3*2 then
		lianjiRate = 45
	elseif Atk:GetHP() <= Atk:GetMaxHP()/3*2 and Atk:GetHP() > Atk:GetMaxHP()/3 then
		lianjiRate = 70
	elseif Atk:GetHP() <= Atk:GetMaxHP()/3 then
		lianjiRate = 100
	end
	
	local lianjiran = math.random(1,100)
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local maxTargetCount = math.floor((Lv - 30)/ 30) + 3;
	
	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 3 then
		maxTargetCount = 3;
	end

	--注意，获取mob_id前一定要先判断是否为mob
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	
	
	local lianjiran = math.random(1,100)
	local i = 0
	if lianjiran > lianjiRate then
		local totalDam = 0
		while targetlist[i] ~= nil do
			local ranDam = 2.25 - math.random(100, 300) / 1000
			local lv = targetlist[i]:GetLevel()
			local anti = targetlist[i]:GetElementAnti(1)
			local per =  ( 1000 - anti  ) /1000
			local hpChange = (Atk:GetElementAttack(1) + 3.2 * lv +  20 )  * ranDam * per
			local result = skillCanHit(Atk, targetlist[i]);
			if result == 2 then
				targetlist[i]:MissSkill();
			else
				targetlist[i]:ChangeHp(-1 * hpChange);
			end
			battle:PushReactionActor(targetlist[i]);
			totalDam = totalDam + hpChange
			i = i + 1
		end
		Atk:ChangeHp(totalDam)
	else
		local totalDam = 0
		local Crit = 2
		targetlist[i]:SetTempReaction(LuaI.BATCMD_CRIT_HIT)
		while targetlist[i] ~= nil do
			local ranDam = 2.25 - math.random(100, 300) / 1000
			local lv = targetlist[i]:GetLevel()
			local anti = targetlist[i]:GetElementAnti(3)
			local per =  ( 1000 - anti  ) /1000
			local hpChange = (Atk:GetElementAttack(3) + 3.2 * lv +  20 )  * ranDam * per * Crit
			
			local result = skillCanHit(Atk, targetlist[i]);
			if result == 2 then
				targetlist[i]:MissSkill();
			else
				targetlist[i]:ChangeHp(-1 * hpChange);
			end
			battle:PushReactionActor(targetlist[i]);
			totalDam = totalDam + hpChange
			i = i + 1
		end
		Atk:ChangeHp(totalDam)
	end
end


