-- 滴水石穿

function skill8024CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8024Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 0 * (0.8 * Lv + 0);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展滴水石穿", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end	
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = 1;		--是CBatActor类型 
	local hpChange = 10 * (((Atk:GetPOW()/10 - Target:GetPOW()/10 + 1.75 * Lv) * 1.1 + 2.1 * Lv + 260)  * nDam - 250);
	
	if hpChange <= 10 then
		hpChange = math.random(1, 10);
	end	
	
	local spChange = 0.1 * hpChange;	
	local result = skillCanHit(Atk, Target);
	
	if result == 2 then
		Target:MissSkill();
	else
		Target:ChangeHp(-1 * hpChange);
		Target:ChangeSp(-1 * spChange);		
	end
	
	battle:PushReactionActor(Target);
	
end
