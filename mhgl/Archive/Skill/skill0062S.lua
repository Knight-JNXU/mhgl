--大漠垂风

function skill0062CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	local reqHp = Atk:GetMaxHP() * 0.3;
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需长河落日修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetHP() > reqHp then
		Atk:SkillFail("\#W[战斗讯息]：此招式必须在生命少于\#G30\%\#W时才能施展");
		do return end
	elseif Atk:IsBuffExist(37) then
		Atk:SkillFail("\#W[战斗讯息]：真气散失导致此招式无法再次施展");
	end
end

function skill0062Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.4 * skillLv + 10;
	
	if consumeSp <= 0 then
		consumeSp = 1;
	end
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展大漠垂风", consumeSp);
	
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
		FinalDam = ((1.2 * Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = ((1.2 * Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam;	
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
	
	local result = skillCanHit(Atk,Target);
	if result == 2 then
		Target:MissSkill();
	else
		Target:ChangeHp(-1 * FinalDam);
	end
	
	if CritHit == 1 then
		Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
	end
	Target:AddBuff(39, 0, 0, 0, 1, 100); 
	Atk:AddBuff(37, 0, 0, 0, 2, 100); 
	battle:PushReactionActor(Target);
	
end

