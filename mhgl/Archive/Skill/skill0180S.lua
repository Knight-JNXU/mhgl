--神眼无尘

function skill0180CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需刚柔相济修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill0180Use(Atk, Target, battle, skillLv)

	local consumeSp = 0.3 * skillLv +10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展神眼无尘", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local buff = Target:FindBuff(39);
	local rate = 100 + 2 * (skillLv - buff:GetBuffValue1());
	if rate < 20 then
		rate = 20;
	elseif rate > 100 then
		rate = 100;
	end
	
	if math.random(1,100) <= rate then
		Target:RemoveBuff(39);
		battle:PushReactionActor(Target);
	else
		Target:MissSkill();
		battle:PushReactionActor(Target);
	end
	
	
	
end

