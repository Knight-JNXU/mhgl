--返生蛊

function skill0173CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需蛊术修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0173Use(Atk, Target, battle, skillLv)

	local consumeSp = 0.6 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展返生蛊", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local rec = 0;
	
	if Target:GetHP() == 0 then
		rec = Target:GetMaxHP();
		if rec <= 1 then
			rec = 1;
		end			
		
		if Target:IsBuffExist(52) then
			Target:AddBuff(53, 0, 0, 0, 999, 100);
			Target:RemoveBuff(52);
		elseif Target:IsBuffExist(53) then
			Target:AddBuff(54, 0, 0, 0, 999, 100);
			Target:RemoveBuff(53);
		end
		Target:AddBuff(52, 0, 0, 0, 999, 100);
		Target:ChangeHp(rec);
		Target:ChangeMHp(rec);
		battle:PushReactionActor(Target);
	else
		Atk:UseSkillMsg("\#W[战斗讯息]：目标还未死亡");
	end	
end

