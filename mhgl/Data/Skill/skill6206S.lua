--雷雨,当两喽都被控制后,使用该技能,给两喽加BUFF(100%吸法术伤害,但物理伤害增加50%;或100%吸物理伤害,但法术伤害增加50%)

function skill6206CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6206Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local targetlist = {};
	local maxTargetCount = 2
	
	if Atk:GetMob_id() == 32021 or Atk:GetMob_id() == 32022 then
		maxTargetCount = 1
	end
	
	local battle = Atk:GetBattle();	
	local mobcount = 0;
	for i = 0, battle:GetActorCount() - 1 do	
		local actor = battle:GetActor(i);
		if actor ~= nil and not actor:IsPlayer() and not actor:IsParnter() then
			mobcount = mobcount + 1
		end
	end
		
	local bufflist = {3057, 3067};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 2);

	local i = 0;
	while targetlist[i] ~= nil do
		local turn = 2 + math.floor((Lv + 10 - 25) / 30);
		
		if turn < 2 then 
			turn = 2;
		elseif turn > 5 then
			turn = 5;
		end
		
		--[[if Atk:IsMob() then
			if Atk:GetMob_id() == 10411 then
				turn = 5;
			end 
		end]]
		
		--[[local effectAtk = targetlist[i]:GetATK() * 1075 / 1000;
		if effectAtk <= 1 then
			effectAtk = 1;
		end]]
		if targetlist[i]:IsMob() and (Atk:GetMob_id() == 32021 or Atk:GetMob_id() == 32022) then
			if mobcount == 2 then
				if Atk:GetMob_id() == 32021 then
					targetlist[i]:AddBuff(3120, 0, 0, 0, 5, 100);
				else
					targetlist[i]:AddBuff(3121, 0, 0, 0, 5, 100);
				end
			else
				if math.random(1,100) < 51 then
					targetlist[i]:AddBuff(3120, 0, 0, 0, 5, 100);
				else
					targetlist[i]:AddBuff(3121, 0, 0, 0, 5, 100);
				end	
			end
			--[[elseif targetlist[i]:IsBuffExist(3120) then
				targetlist[i]:AddBuff(3121, 0, 0, 0, turn, 100);				
			else
				targetlist[i]:AddBuff(3120, 0, 0, 0, turn, 100);
			end]]--
			if not targetlist[i]:IsBuffExist(4000) then
				targetlist[i]:AddBuff(4000, 0, 0, 0, 200, 100);
			end
		else		
			if math.random(1,100) < 51 then
				targetlist[i]:AddBuff(3057, 0, 0, 0, turn, 100);
			else
				targetlist[i]:AddBuff(3067, 0, 0, 0, turn, 100);
			end
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

