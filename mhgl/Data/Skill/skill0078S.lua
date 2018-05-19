--无影鬼羽

function skill0078CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需亡魂绝命修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill0078Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.5 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展无影鬼羽", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local wDam = Atk:GetSkillLv(376) - Target:GetSkillLv(377);
	local randomDam = 1.2 - (math.random(100, 300) / 1000);
	local critDam = 1.5;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = 0;
	local CritHit = 0;
	if math.random(1,100) <= 5 then
		FinalDam = ((1.15 * Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = ((1.15 * Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam;	
	end
	
	if Target:GetCommand() == LuaI.BATCMD_DEFEND then
		FinalDam = FinalDam / 2;
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
		end
	end	
	
	if FinalDam <= 10 then
		FinalDam = math.random(1, 10);
	end
	
	local BuffRate = 60 + 2 * (skillLv - Target:GetLevel());
	
	if BuffRate < 10 then
		BuffRate = 10;
	elseif BuffRate > 80 then
		BuffRate = 80;
	end
	
	local turn = 2 + math.floor(skillLv - Target:GetLevel()) / 10;
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	Target:ChangeHp(-1 * FinalDam);
	if CritHit == 1 then
		Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
	end
	if math.random(1, 100) <= BuffRate then
		Target:AddBuff(71, 0, 0, 0, turn, 100); 
	end
	battle:PushReactionActor(Target);
	
end

