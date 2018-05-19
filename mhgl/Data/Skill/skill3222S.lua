--气疗术

function skill3222CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需冷泉心法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill3222Use(Atk, Target, battle, skillLv)
	
	local consumeHp = 1 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeHp = consumeHp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：生命不足\#G%d\#W，无法施展气疗术", consumeHp);
	
	if Atk:GetHP() < consumeHp then
		Atk:SkillFail(Msg);
		do return end
	end
	if Target:IsBuffExist(1203) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在气疗术状态");
		do return end
	end
	if Target:IsBuffExist(2020) then
		Atk:SkillFail("\#W[战斗讯息]：此目标不能接收治疗");
		do return end
	end
	
	Atk:ChangeHp(-1 * consumeHp, false);
	
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
	
	local skillDam = (Atk:GetSkillLv(3200) + Atk:GetSkillLv(3210) + Atk:GetSkillLv(3220) 
					+ Atk:GetSkillLv(3230) + Atk:GetSkillLv(3240)) * 0.48 + (Atk:GetSkillLv(3200) ^ 2 
					+ Atk:GetSkillLv(3210) ^ 2 + Atk:GetSkillLv(3220) ^ 2 + Atk:GetSkillLv(3230) ^ 2 
					+ Atk:GetSkillLv(3240) ^ 2 ) * 0.0016 + 20 ;
	local rec = skillLv + 0.1 * skillDam + 0.01 * Target:GetMaxSP() + 0.05 * Atk:GetPOW();
	local Rate = math.floor(Atk:GetSkillLv(3250) / 15) + 10;
	if math.random(1, 100) <= Rate then
		rec = rec * ( math.random(100, 150) / 1000 + 1)
	end
	
	Target:ChangeSp(rec);
	Target:AddBuff(1203, skillLv, rec, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end
