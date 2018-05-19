--流星飞坠

function skill9895CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill9895Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 0.9 * Lv +10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展流星飞坠", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = 1;		--是CBatActor类型 
	
	local HitRate = 58;	
	if HitRate < 1 then
		HitRate = 1;
	elseif HitRate > 95 then
		HitRate = 95;
	end	
	local CritRate = Atk:GetATK()/140 + 2;
	local hpChange = 0;
	local spChange = 0;
	if math.random(1, 100) <= 3 then
		hpChange = 0.8 * Atk:GetATK() + 3 * Lv * 10;
		spChange = 10 * Lv;
	elseif math.random(1, 100) <= CritRate then
		hpChange = 0.2 * Atk:GetATK() + 3 * Lv * 10;
		spChange = 5 * Lv;
	else
		hpChange = 0.05 * Atk:GetATK() + 5 * Lv;
		spChange = 2 * Lv;
	end
	
	if hpChange <= 1 then
		hpChange = 1;
	end
	
	if spChange <= 1 then
		spChange = 1;
	end
	
	Target:ChangeHp(-1 * hpChange);
	Target:ChangeSp(-1 * spChange);
	battle:PushReactionActor(Target);
	
end

