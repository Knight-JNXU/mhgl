--正骨

function skill19047CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此技能需小佛乘法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此技能需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill19047Use(Atk, Target, battle, skillLv)
	
	local consumeSp = skillLv * 1.5 + 20;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展舍生取义", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local rec = 1 * Target:GetMaxHP() + Target:GetLevel() * (Atk:GetWC() / 100);
	if rec <= 1 then
		rec = 1;
	end
	if rec > Target:GetLevel() * 9000 then
		rec = Target:GetLevel() * 9000;
	end
	local rec2 = 1 * Target:GetMaxHP() + Target:GetLevel() * (Atk:GetWC() / 100);
	if rec2 <= 1 then
		rec2 = 1;
	end
	if rec2 > Target:GetLevel() * 9000 then
		rec2 = arget:GetLevel() * 9000;
	end
	local DefEffect = 0.8 + math.floor(Atk:GetSkillLv(19040) / 5) / 100;
	local PowEffect = 0.8 + math.floor(Atk:GetSkillLv(19040) / 5) / 100;
	Target:ChangeMHp(rec2);	
	Target:ChangeHp(rec);
	battle:PushReactionActor(Target);
end


