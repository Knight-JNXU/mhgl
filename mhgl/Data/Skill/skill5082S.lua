--MOB云龙探爪

function skill5082CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	if Atk:IsBuffExist(1813) then
		Atk:SkillFail("\#W[战斗讯息]：已经处在云龙探爪状态");
	end	
end

function skill5082Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);

	local turn = 3 + math.floor((Lv -35)/ 25);
	
	if turn < 3 then 
		turn = 3;
	elseif turn > 6 then
		turn = 6;
	end	
	
	Target:AddBuff(1813, (Lv + 10), 0, 0, turn, 100);
	battle:PushReactionActor(Target);
end

