--搜魂无影

--skill Return number 0 = success, 1 = fail

function skill0501CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需虚灵功修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0501Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.4 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展搜魂无影", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local wDam = Atk:GetSkillLv(376) - Target:GetSkillLv(377);
	local randomDam = 1.2 - (math.random(100, 300) / 1000);
	local critDam = 1.5;
	
	local FinalDam = 0;
	local CritHit = 0;
	if math.random(1,100) <= 10 then
		FinalDam = ((Atk:GetATK() - Target:GetDEF()) * 1.05 ^ wDam) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = ((Atk:GetATK() - Target:GetDEF()) * 1.05 ^ wDam) * randomDam;	
	end
	
	if Target:GetCommand() == LuaI.BATCMD_DEFEND then
		FinalDam = FinalDam / 2;
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
		end
	end	
	
	if FinalDam <= 1 then
		FinalDam = math.random(1, 10);
	end
	
	--local CritRate = 85 + skillLv - Target:GetLevel() + 1.5 *(Atk:GetSkillLv(376) - Target:GetSkillLv(377)) - Target:GetMaxHP() / Target:GetLevel();
	--if CritRate < 5 then
	--	CritRate = 5;
	--elseif CritRate > 85 then
	--	CritRate = 85;
	--end
	--local CritRate = 100;
	--if (math.random(1, 100) <= 100) and LuaI.GetGameTime(0) == 1 and (Target:IsMob() and Target:IsBoss() == false) then
	--	FinalDam = Target:GetHP();
	--	Target:ChangeHp(-1 * FinalDam,false);
	--	battle:PushReactionActor(Target);
	--else
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
		end
		Target:ChangeHp(-1.2 * FinalDam);
		battle:PushReactionActor(Target);
	--end
	
end

