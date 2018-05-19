--玉冰障

function skill3012CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需冰玄神功修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill3012Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.8 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展玉冰障", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1806) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在玉冰障状态");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local skillDam = (Atk:GetSkillLv(3000) + Atk:GetSkillLv(3010) + Atk:GetSkillLv(3020) 
					+ Atk:GetSkillLv(3030) + Atk:GetSkillLv(3040)) * 0.48 + (Atk:GetSkillLv(3000) ^ 2 
					+ Atk:GetSkillLv(3010) ^ 2 + Atk:GetSkillLv(3020) ^ 2 + Atk:GetSkillLv(3030) ^ 2 
					+ Atk:GetSkillLv(3040) ^ 2 ) * 0.0016 + 20 ;
	local rec1 = 2.4 * skillLv + 0.2 * skillDam + 0.01 * Target:GetMaxHP() + 0.1 * (Atk:GetPOW() + Atk:GetWeaponATK());
	local rec2 = 1.7 * skillLv + 0.2 * skillDam + 0.05 * (Atk:GetPOW() + Atk:GetWeaponATK());
	if rec1 <= 1 then
		rec1 = 1;
	end
	if rec2 <= 1 then
		rec2 = 1;
	end
	
	Target:ChangeMHp(rec2);
	Target:ChangeHp(rec1);
	
	local turn = 2 + math.floor((skillLv - 25) / 35);
	
	if turn < 2 then
		turn = 2;
	elseif turn > 5 then
		turn = 5;
	end
	if Target:IsBuffExist(2014) then
		turn = turn * 2;
	end
	if Target:IsBuffExist(2047) then
		turn = turn * 4;
	end
	
	local val = 3 * (math.floor(Atk:GetSkillLv(3050) / 5) + math.floor((Atk:GetSkillLv(3050) - 50) / 5) * 
				math.floor((Atk:GetSkillLv(3050) + 500) / 550) + math.floor((Atk:GetSkillLv(3050) - 100) / 5) * 
				math.floor((Atk:GetSkillLv(3050) + 500) / 600));
	Target:AddBuff(1806, skillLv, val, 0, turn, 100);
	Target:AddBuff(1815, skillLv, val, 0, turn, 100);
	battle:PushReactionActor(Target);
end

