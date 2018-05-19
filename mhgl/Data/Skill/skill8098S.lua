--BOSS迷麻散

function skill8098CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8098Use(Atk, Target, battle, skillLv)
	
	local Lv = Atk:GetLevel();
	local consumeSp = 0.4 * Lv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施放迷麻散", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local HitRate = 60 + 2 * (Lv - Target:GetLevel()) + 1.5 * (Atk:GetSkillLv(378) - Target:GetSkillLv(379));
	if HitRate < 10 then
		HitRate = 10;
	elseif HitRate > 85 then
		HitRate = 85;
	end	
	
	if math.random(1, 100) > HitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 2 + math.floor((Lv - Target:GetLevel()) / 10);
	
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	if Target:IsBuffExist(49) then
		Target:RemoveBuff(49);
		Target:AddBuff(50, Lv, 0, 0, 1, 100);
	else
		Target:AddBuff(49, Lv, 1, 0, turn, 100);
	end
	
	battle:PushReactionActor(Target);
	
end

