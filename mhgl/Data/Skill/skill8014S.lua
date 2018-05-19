--冰雪封天

function skill8014CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8014Use(Atk, Target, battle, skillLv)
	
	local Lv = Atk:GetLevel();
	local consumeSp = 0 * (0.6 * Lv + 0);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展冰雪封天", consumeSp);
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end

	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = 1;		--是CBatActor类型 
	local hpChange = 10 * (((Atk:GetPOW()/10 - Target:GetPOW()/10 + 1.75 * Lv) * 1.2 + 2.6	* Lv + 280)  * nDam - 250) * 0.75;
	if hpChange <= 10 then
		hpChange = math.random(1, 10);
	end

	local result = skillCanHit(Atk, Target);
	if result == 2 then
		Target:MissSkill();
	else
		Target:ChangeHp(-1 * hpChange);
	end
	
	local HitRate = 30;
	if Target:IsBuffExist(1807) then
		HitRate = HitRate * 0.9;
	end
	
	if math.random(1, 100) <= HitRate then
		if Target:IsBuffExist(1106) == false and Target:GetHP() ~= 0 then
			local turn = 2;
			Target:AddBuff(1106, 1, 0, 0, turn, 100);
		end
	end 
	
	battle:PushReactionActor(Target);
	
end


