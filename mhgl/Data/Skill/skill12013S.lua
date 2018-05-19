--我佛慈悲

function skill12013CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill12013Use(Atk, Target, battle, skillLv)

	local consumeSp = 1 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展", consumeSp);
	
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
		
			  			local jx = 0; 
			   if Atk:HasSkill(64260) then
			    jx = Atk:GetSPR() * 0.2
			   end	
			   	local bj = 0; 
			    if Atk:HasSkill(64330) then
			    bj = Atk:GetSPR() * math.random(1.5, 4)
			   end		
		local nmDam = (Atk:GetSkillLv(2850) - 100) * math.floor((Atk:GetSkillLv(2850) + 500) / 600) + (Atk:GetSkillLv(2450) 
						- 50) * math.floor((Atk:GetSkillLv(2850) + 500) / 550) + Atk:GetSkillLv(2850);
		rec1 = 3.2 * skillLv + 0.25 * Atk:GetWeaponATK() + 0.02 * Target:GetMaxHP() + jx + bj;
		rec1 = rec1 * (1 + nmDam / 1000);
		if rec1 <= 1 then
			rec1 = 1;
		end
		if rec1 > Target:GetMaxHP() then
			rec1 = Target:GetMaxHP();
		end
		rec2 = 4.3 * skillLv + 0.22 * Atk:GetWeaponATK() + jx + bj;
		rec2 = rec2 * (1 + nmDam / 1000) + jx;
		if rec2 <= 0  then
			rec2 = 1;
		end
		if rec2 > Target:GetMaxHP() then
			rec2 = Target:GetMaxHP();
		end
		
		Target:ChangeMHp(rec2*2);
		Target:ChangeHp(rec1*2);
		battle:PushReactionActor(Target);
	end
	
end
