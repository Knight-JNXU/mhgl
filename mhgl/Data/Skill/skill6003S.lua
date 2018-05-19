--MOB 火属性 绝学

function skill6003CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6003Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local maxTargetCount = math.floor((Lv - 30)/ 30) + 3;
	
	if maxTargetCount > 5 then
		maxTargetCount = 1;
	elseif maxTargetCount < 2 then
		maxTargetCount = 1;
	end

	--注意，获取mob_id前一定要先判断是否为mob
	if Atk:GetMob_id() == 10420 then
		maxTargetCount = 3;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	
	
	
	local i = 0;
	while targetlist[i] ~= nil do
		local ranDam = 2.25 - math.random(100, 300) / 1000
		local lv = targetlist[i]:GetLevel()
		local anti = targetlist[i]:GetElementAnti(3)
		local per =  ( 1000 - anti  ) /1000
		
		local hpChange = (Atk:GetElementAttack(3) + 3.2 * lv +  20 )  * ranDam * per;
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1
	end
end


