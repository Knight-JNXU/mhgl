--MOB 风属性 绝学 单秒

function skill6004CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6004Use(Atk, Target, battle, skillLv)
	
	local Lv = Atk:GetLevel();
	
	--[[local maxTargetCount = 1
	
	if maxTargetCount > 7 then
		maxTargetCount = 1;
	elseif maxTargetCount < 2 then
		maxTargetCount = 1;
	end

	--注意，获取mob_id前一定要先判断是否为mob
	if Atk:GetMob_id() == 10420 then
		maxTargetCount = 1;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	]]
		local ranDam = 2.25 - math.random(100, 300) / 1000
		local per = 1
		local lv = Target:GetLevel()
		local anti = Target:GetElementAnti(0)
		
		if Target:IsPlayer() then
			if lv < 60 then
				if anti <= lv then
					per = 1
				elseif  anti > lv then
					per = ( 1000 - anti - 150 ) /1000	
				end
			elseif lv < 90 then
				if anti <= lv then
					per = 1
				elseif anti > lv  and anti <= lv + math.floor(1/3*lv)*3 then
					per = ( 1000 - anti - 50 ) /1000	
				elseif anti > lv + math.floor(1/3*lv)*3 then
					per = ( 1000 - anti - 100 ) /1000	
				end
			else
				if anti <= lv then
					per = 1
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
		
		local hpChange = (Atk:GetElementAttack(0) + 3.2 * lv +  20 )  * ranDam * per;
		
		local result = skillCanHit(Atk, Target);
		if result == 2 then
			Target:MissSkill();
		else
			Target:ChangeHp(-1 * hpChange);
		end
		battle:PushReactionActor(Target);
		
	
end


