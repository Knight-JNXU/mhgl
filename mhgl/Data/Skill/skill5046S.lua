--MOB翠烟遁形

function skill5046CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5046Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local turn = math.floor((Lv + 10 - 30) / 40) + 2;
	if turn > 5 then
		turn = 5;
	elseif turn < 2 then
		turn = 2;
	end
	
	Target:AddBuff(1700, (Lv + 10), 0, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

