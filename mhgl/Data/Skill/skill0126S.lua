--大手印

function skill0126CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需圣灵心法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0126Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.4 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展大手印", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = Atk:GetSkillLv(378) - Target:GetSkillLv(379);
	local weaponDam = 0.25 * Atk:GetWeaponATK();
	local Dam = (Atk:GetPOW() - (1 - 0.1 * skillLv /100) * Target:GetPOW() + skillLv + weaponDam)  * 1.05 ^ nDam;
	
	if Dam <= 1 then
		Dam = 1;
	end
	
	local turn = 1 + math.floor(skillLv / 50);
	Target:ChangeSp(-1 * Dam);
	Target:AddBuff(76, 0, 0, 0, turn, 100);
	battle:PushReactionActor(Target);	
end
