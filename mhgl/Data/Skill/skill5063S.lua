--MOB先声夺人

function skill5063CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	if Atk:IsBuffExist(1814) then
		Atk:SkillFail("\#W[战斗讯息]：已经处在先声夺人状态");
	end
end

function skill5063Use(Atk, Target, battle, skillLv)
    

    local Lv = Atk:GetLevel() + 10;
	local skill = Atk:GetSkillLv(5300);
	local turn = 2 + math.floor((Lv - 25) / 30) ;
	if turn < 3 then
		turn = 3;
	elseif turn > 6 then
		turn = 6;
	end
	
	if skill == 1 then
	    turn = 2 + math.floor((Lv - 15) / 25) + 2;
	    if turn < 4 then
			turn = 4;
		elseif turn > 10 then
			turn = 10;
		end
	end
	
	Target:AddBuff(1814, Lv, 0, 0, turn, 100);
	battle:PushReactionActor(Target);	
end

