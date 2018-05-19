--猛虎出林

function skill0007CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需天罡真气修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill0007Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.6 * skillLv + 10;	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展猛虎出林", consumeSp);	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = Atk:GetSkillLv(378) - Target:GetSkillLv(379);
	local weaponDam = 0.25 * Atk:GetWeaponATK();
	--local HitRate = (Atk:GetHIT() / Target:GetEVA()) + 100;
	local hpChange = (Atk:GetPOW() - Target:GetPOW() + 3.5 * skillLv + weaponDam + 50)  * 1.05 ^ nDam;
	--local hpChange = (165 - Target:GetPOW()  + 3.5 * skillLv + weaponDam + 50)  * 1.05 ^ nDam;
	if hpChange <= 10 then
		hpChange = math.random(1, 10);
	end	
	local result = skillCanHit(Atk, Target);
	
	if result == 2 then
		Target:MissSkill();
	else
		Target:ChangeHp(-1 * hpChange);
	end
	
	battle:PushReactionActor(Target);
	
end

