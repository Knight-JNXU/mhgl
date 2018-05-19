--BOSS无忧散

function skill8097CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8097Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();		
	local consumeSp = 0.4 * Lv + 10;
	
	Atk:ChangeSp(-1 * consumeSp, false);	
	
	local turn = 3 + math.floor((Lv - Target:GetLevel()) / 10);
	
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end	
	
	local value1 = math.floor((Lv + 20) / 50);
	local skillcount = 0;
	local skilllist = {};
	while value1 > 0 do
		local RandomSkill = Atk:GetRandomSkill();
		
		if RandomSkill == 0 then
			break;
		else
			local i = 0;
			local exist = 0;
			while i < skillcount do
				if RandomSkill == skilllist[i] then
					exist = 1;
					break;
				end
				
				i = i + 1;
			end
				
			if exist == 0 then
				table.insert(skilllist, RandomSkill);
				skillcount = skillcount + 1;
			end
		end
		
		value1 = value1 - 1;
	end
		
	local buffvalue1 = 0;
	local buffvalue2 = 0;
	local buffvalue3 = 0;
	if skillcount > 0 then
		local i = 0;
		while i < skillcount do
			if i == 0 then
				buffvalue1 = skilllist[i];
			elseif i == 1 then
				buffvalue2 = skilllist[i];
			elseif i == 2 then
				buffvalue3 = skilllist[i];
			end
			
			i = i + 1;
		end
	end
	
	Target:AddBuff(48, 62, buffvalue2, buffvalue3, turn, 100);
	battle:PushReactionActor(Target);
end

