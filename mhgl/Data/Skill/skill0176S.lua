--迷麻散

function skill0176CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需禁方秘药修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill0176Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.4 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施放迷麻散", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local HitRate = 60 + 2 * (skillLv - Target:GetLevel()) + 1.5 * (Atk:GetSkillLv(378) - Target:GetSkillLv(379));
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
	
	local turn = 2 + math.floor((skillLv - Target:GetLevel()) / 10);
	
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	if Target:IsBuffExist(49) then
		Target:RemoveBuff(49);
		Target:AddBuff(50, skillLv, 0, 0, 1, 100);
	else
		Target:AddBuff(49, skillLv, 1, 0, turn, 100);
	end
	
	battle:PushReactionActor(Target);
	
end

