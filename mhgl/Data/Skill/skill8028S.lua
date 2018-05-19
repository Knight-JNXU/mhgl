--BOSS立劈华山

function skill8028CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

end

function skill8028Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	local Lv = Atk:GetLevel();		
	local maxTargetCount = math.floor((Lv - 25 )/ 25) + 2;
	
	if maxTargetCount > 4 then
		maxTargetCount = 4;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	if Target:IsPlayer() or
		Target:IsParnter() then
		maxTargetCount = 1;
	end
	
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = (0.1 * Lv + 20) * count;

	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local NormalDam = 0;
	--local ElementDam = 0;
	
	local i = 0;
	while targetlist[i] ~= nil do
		NormalDam = (5.2 - 0.3 * count) * Lv + 0.25 * Atk:GetWeaponATK() + 30;


		

			if Atk:IsBuffExist(55) then
			NormalDam = NormalDam * 1.1;

			end
		
			local turn = 3 + math.floor((Lv - Target:GetLevel()) / 5);
	
			if turn < 1 then
				turn = 0;
			elseif turn > 5 then
				turn = 5;
			end
	
			local HitEffect = (1 - 0.15 * Lv / 100) * Target:GetHIT();
		
			Target:AddBuff(61, Lv, HitEffect, 0, turn, 100);

			targetlist[i]:ChangeHp(-1 * NormalDam);
			battle:PushReactionActor(targetlist[i]);
			i = i + 1;
	end
end
