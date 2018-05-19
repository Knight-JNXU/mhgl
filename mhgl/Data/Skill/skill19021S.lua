--我佛慈悲

function skill19021CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需大慈大悲修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill19021Use(Atk, Target, battle, skillLv)

	local consumeSp = 1 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展我佛慈悲", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end

	local rec1 = 0;
	local rec2 = 0;
	if (Target:IsPlayer() and Target:GetHP() == 0) == false then 
		Atk:SkillFail("\#W[战斗讯息]：目标无效");
		do return end
	else 
		Atk:ChangeSp(-1 * consumeSp, false);
		
		local nmDam = (Atk:GetSkillLv(19050) - 100) * math.floor((Atk:GetSkillLv(19050) + 500) / 600) + (Atk:GetSkillLv(19050) 
						- 50) * math.floor((Atk:GetSkillLv(19050) + 500) / 500) + Atk:GetSkillLv(19050);
		rec1 = 4.5 * skillLv + 0.25 * Atk:GetWeaponATK() + 0.02 * Target:GetMaxHP();
		rec1 = rec1 * (1 + nmDam / 1000);
		if rec1 <= 1 then
			rec1 = 1;
		end
		
		
		rec2 = 6.5 * skillLv + 0.25 * Atk:GetWeaponATK();
		rec2 = rec2 * (1 + nmDam / 1000);
		if rec2 <= 0  then
			rec2 = 1;
		end
		rec2 = rec2*2
		rec1 = rec1*2
		local CritRate = math.random(1,100)
		if Atk:GetSkillLv(394) > 0 then --法宝
			rec2 = rec2 + (rec2 * Atk:GetSkillLv(394) * 0.03)
			rec1 = rec1 + (rec1 * Atk:GetSkillLv(394) * 0.03)
		end
		if CritRate <= 20 then
			rec2 = rec2*2
			rec1 = rec1*2
		end
		
		if rec1 > Target:GetMaxHP() then
			rec1 = Target:GetMaxHP();
		end
		if rec2 > Target:GetMaxHP() then
			rec2 = Target:GetMaxHP();
		end
	
		
		Target:ChangeMHp(rec2);
		Target:ChangeHp(rec1);
		battle:PushReactionActor(Target);
	end
	
end
