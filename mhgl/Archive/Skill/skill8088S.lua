--BOSS鬼门阵

function skill8088CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8088Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();		
	local consumeSp = 0.4 * Lv + 10;

	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 1 + math.floor(Lv - 35) / 45;
	
	if turn < 1 then
		turn = 1;
	elseif turn > 3 then
		turn = 3;
	end
	
	local reAtkCount = 1 + math.floor(Lv - 35) / 45;
	
	if reAtkCount < 1 then
		reAtkCount = 1;
	elseif reAtkCount > 3 then
		reAtkCount = 3;
	end
	
	Target:AddBuff(13, Lv, reAtkCount, 0, turn, 100);
	
	battle:PushReactionActor(Target);
end

