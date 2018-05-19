--杨柳甘露

function skill20022CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需观音咒修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill20022Use(Atk, Target, battle, skillLv)

	local consumeSp = 150;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展杨柳甘露", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	--Atk:ChangeSp(-1 * consumeSp, false);
	
	local rec1 = 0;
	local rec2 = 0;
	if (Target:IsPlayer() and Target:GetHP() == 0) == false then 
		Atk:SkillFail("\#W[战斗讯息]：目标无效");
		do return end
	else 
		Atk:ChangeSp(-1 * consumeSp, false);
		
		rec1 =  (skillLv/12*skillLv/12+skillLv*6+Atk:GetSkillLv(378))* 3;
		if rec1 <= 1 then
			rec1 = 1;
		end
		if rec1 > Target:GetMaxHP() then
			rec1 = Target:GetMaxHP();
		end
		
		rec2 = ((skillLv/12*skillLv/12+skillLv*6+Atk:GetSkillLv(378))* 3)*1.5;
		if rec2 <= 0  then
			rec2 = 1;
		end
		if rec2 > Target:GetMaxHP() then
			rec2 = Target:GetMaxHP();
		end
		
		local fabao = 0;
		if Atk:GetSkillLv(394) <= 5 and Atk:GetSkillLv(394) > 0 then
		   fabao = 0.1
		elseif Atk:GetSkillLv(394) > 5 then
		   fabao = Atk:GetSkillLv(394)*0.02
		end
		rec1 = rec1 + (rec1*fabao);
		rec2 = rec2 + (rec2*fabao);
		
		Target:ChangeMHp(rec2);
		Target:ChangeHp(rec1);		
		battle:PushReactionActor(Target);
	end	
end

