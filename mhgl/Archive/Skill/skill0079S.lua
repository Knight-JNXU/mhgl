--鬼眼

function skill0079CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需亡魂绝命修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0079Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.6 * skillLv + 10;
	
	local Msg1 = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展鬼眼", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg1);
		do return end
	end
	
	if Target:IsBuffExist(70) ~= true and
		Target:IsBuffExist(2005) ~= true and
		Target:IsBuffExist(2038) ~= true then
		Atk:SkillFail("\#W[战斗讯息]：鬼眼对没有遁形的目标无效");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local buff = Target:FindBuff(70);
	local rate = 100 + 2 * (skillLv - buff:GetBuffValue1());
	if rate < 20 then
		rate = 20;
	elseif rate > 100 then
		rate = 100;
	end
	
	if math.random(1,100) <= rate then
		Target:RemoveBuff(70);
		Target:AddBuff(74, 0, 0, 0, 999, 100);
		battle:PushReactionActor(Target);
	else
		Target:MissSkill();
		battle:PushReactionActor(Target);
	end	
end

