--勾魂摄心大法

function skill0080CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需天魔无相修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0080Use(Atk, Target, battle, skillLv)
	
	local consumeSp = skillLv;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展勾魂摄心大法", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local HitRate = 55 + 2 * (skillLv - Target:GetLevel()) + 1.5 * (Atk:GetSkillLv(378) - Target:GetSkillLv(379));
	if HitRate < 10 then
		HitRate = 10;
	elseif HitRate > 80 then
		HitRate = 80;
	end	
	
	if math.random(1, 100) > HitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 2 + math.floor((skillLv - Target:GetLevel()) / 10);
	
	if turn < 1 then
		turn = 1;
	elseif turn > 3 then
		turn = 3;
	end
	
	Target:AddBuff(73, 0, 0, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

