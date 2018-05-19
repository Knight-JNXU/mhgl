--剑光一闪

function skill8012CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8012Use(Atk, Target, battle, skillLv)
	
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.6 * Lv + 10);	
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展剑光一闪", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = 1;		--是CBatActor类型 
	local hpChange = 10 * (((Atk:GetPOW()/10 - Target:GetPOW()/10 + 1.75 * Lv) * 1.2 + 2.6 * Lv + 280)  * nDam - 250);
	
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

