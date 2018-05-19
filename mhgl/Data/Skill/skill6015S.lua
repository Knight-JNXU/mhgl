--MOB 风属性 绝学 单秒 怜星专用

function skill6015CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6015Use(Atk, Target, battle, skillLv)
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
	local Lv = Atk:GetLevel();
	local per = 1
	local lv = Target:GetLevel()
	local anti = Target:GetElementAnti(0)
	
	local lianjiran = math.random(1,100)
	
	if Target:IsPlayer() then
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
	
	local hpChange = (Atk:GetElementAttack(0) + 3.2 * lv +  20 ) * per;
	
	local i = 0
	local j = 0
	if lianjiran > lianjiRate then
		local ranDam = 2.25 - math.random(100, 300) / 1000
		local result = skillCanHit(Atk, Target);
		if result == 2 then
			Target:MissSkill();
		else
			Target:ChangeHp(-1 * hpChange * ranDam);
			Atk:ChangeHp(hpChange * ranDam)
		end
		battle:PushReactionActor(Target);
	else
		local totalDam = 0
		local ranDam = 2.25 - math.random(100, 300) / 1000
		local crit = 4
		
		Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
		
		if result == 2 then
			Target:MissSkill();		
		else
			Target:AddAttriChangeToLst(-1 * hpChange * ranDam * crit , 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
		end
		totalDam = hpChange * ranDam * crit + totalDam
		Atk:ChangeHp(totalDam)
		battle:PushReactionActor(Target)
	end
end


