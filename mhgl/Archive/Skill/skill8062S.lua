--裂石惊沙

function skill8062CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8062Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.7 * Lv + 10);	
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展裂石惊沙", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end	
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = 1;		--是CBatActor类型 
	local FinalDam = {0};
	local DamRate = {1};
	local lianji = 1;
	
	local jichuRate = 0;
	local Rate = 0;
	if math.random(1, 100) <= Rate then
		lianji = 2;
		FinalDam = {0,0};
		DamRate = {0.8, 0.8};
	end
	
	local i = 1;
	while i <= lianji do
		
		FinalDam[i] = 10 * (((Atk:GetPOW()/10 - Target:GetPOW()/10 + 1.75 * Lv) * 1.35 + 2.9 * Lv + 300) * nDam - 250) * DamRate[i];
		if FinalDam[i] <= 10 then
			FinalDam[i] = math.random(1, 10);
		end	
		
		Target:AddAttriChangeToLst(-1 * FinalDam[i], 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
		
		i = i + 1;
	end
	
	battle:PushReactionActor(Target);
	
end
