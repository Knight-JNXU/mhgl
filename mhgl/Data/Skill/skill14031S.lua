--云体风身

function skill14031CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1203) then
		Atk:SkillFail("\#W[战斗讯息]：已经处在魔息术状态");
	end
end

function skill14031Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.5 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展魔息术", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 2 + math.floor((skillLv - 25) / 30);
	if turn > 5 then
		turn = 5;
	elseif turn < 2 then
		turn = 2;
	end
	if Target:IsBuffExist(2014) then
		turn = turn * 2;
	end
	if Target:IsBuffExist(2047) then
		turn = turn * 4;
	end
	
	local skillDam = (Atk:GetSkillLv(14010) + Atk:GetSkillLv(14010) + Atk:GetSkillLv(14020) 
					+ Atk:GetSkillLv(14030) + Atk:GetSkillLv(14040)) * 0.48 + (Atk:GetSkillLv(14000) ^ 2 
					+ Atk:GetSkillLv(14010) ^ 2 + Atk:GetSkillLv(14020) ^ 2 + Atk:GetSkillLv(14030) ^ 2 
					+ Atk:GetSkillLv(14040) ^ 2 ) * 0.0016 + 20 ;
	local rec = skillLv + 0.25 * skillDam + 0.025 * Target:GetMaxSP() + 0.09 * Atk:GetPOW();
	local Rate = math.floor(Atk:GetSkillLv(14030) / 15) + 10;
	if math.random(1, 100) <= Rate then
		rec = rec * ( math.random(100, 150) / 1000 + 1)
	end
	
	Target:ChangeSp(rec);
	Target:AddBuff(1203, skillLv, rec, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end