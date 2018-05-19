--MOB 水属性 绝学

function skill6013CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6013Use(Atk, Target, battle, skillLv)
	local lianjiRate = 30
	if Atk:GetHP() <= Atk:GetMaxHP()/5*4 and Atk:GetHP() > Atk:GetMaxHP()/5*3 then
		lianjiRate = 30
	elseif Atk:GetHP() <= Atk:GetMaxHP()/5*4 and Atk:GetHP() > Atk:GetMaxHP()/5*3 then
		lianjiRate = 45
	elseif Atk:GetHP() <= Atk:GetMaxHP()/5*3 and Atk:GetHP() > Atk:GetMaxHP()/5*2 then
		lianjiRate = 60
	elseif Atk:GetHP() <= Atk:GetMaxHP()/5*2 and Atk:GetHP() > Atk:GetMaxHP()/5*1 then
		lianjiRate = 80
	elseif Atk:GetHP() <= Atk:GetMaxHP()/5*1 then
		lianjiRate = 100
	end
	
	local lianjiran = math.random(1,100)
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local maxTargetCount = math.floor((Lv - 30)/ 15) + 2;
	
	if maxTargetCount > 7 then
		maxTargetCount = 7;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
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
			local per = 1
			local lv = targetlist[i]:GetLevel()
			local anti = targetlist[i]:GetElementAnti(2)
			
			if targetlist[i]:IsPlayer() then
				if lv < 60 then
					if anti <= lv then
						per = 1.25
					elseif  anti > lv then
						per = ( 1000 - anti - 150 ) /1000	
					end
				elseif lv < 90 then
					if anti <= lv then
						per = 1.25
					elseif anti > lv  and anti <= lv + math.floor(1/3*lv)*3 then
						per = ( 1000 - anti - 50 ) /1000	
					elseif anti > lv + math.floor(1/3*lv)*3 then
						per = ( 1000 - anti - 100 ) /1000	
					end
				else
					if anti <= lv then
						per = 1.25
					elseif anti > lv and anti <= lv + math.floor(1/3*lv)*3 then
						per = ( 1000 - anti - 50 ) /1000	
					elseif anti > lv + math.floor(1/3*lv)*3 and anti <= 2*lv + math.floor(1/3*lv)*3 then
						per = ( 1000 - anti - 100 ) /1000	
					elseif anti > 2*lv + math.floor(1/3*lv)*3 then
						per = ( 1000 - anti - 150 ) /1000	
					end
				end
			else
				per =  ( 1000 - anti  ) /1000
			end
			
			local hpChange = (Atk:GetElementAttack(2) + 3.2 * lv +  20 )  * ranDam * per;
			
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
			local per = 1
			local lv = targetlist[i]:GetLevel()
			local anti = targetlist[i]:GetElementAnti(3)
			
			if targetlist[i]:IsPlayer() then
				if lv < 60 then
					if anti <= lv then
						per = 1.25
					elseif  anti > lv then
						per = ( 1000 - anti - 150 ) /1000	
					end
				elseif lv < 90 then
					if anti <= lv then
						per = 1.25
					elseif anti > lv  and anti <= lv + math.floor(1/3*lv)*3 then
						per = ( 1000 - anti - 50 ) /1000	
					elseif anti > lv + math.floor(1/3*lv)*3 then
						per = ( 1000 - anti - 100 ) /1000	
					end
				else
					if anti <= lv then
						per = 1.25
					elseif anti > lv and anti <= lv + math.floor(1/3*lv)*3 then
						per = ( 1000 - anti - 50 ) /1000	
					elseif anti > lv + math.floor(1/3*lv)*3 and anti <= 2*lv + math.floor(1/3*lv)*3 then
						per = ( 1000 - anti - 100 ) /1000	
					elseif anti > 2*lv + math.floor(1/3*lv)*3 then
						per = ( 1000 - anti - 150 ) /1000	
					end
				end
			else
				per =  ( 1000 - anti  ) /1000
			end
			
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


