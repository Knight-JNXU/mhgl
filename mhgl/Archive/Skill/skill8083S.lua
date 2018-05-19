--云叠山倾

function skill8083CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8083Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeHp = 10 * (0.6 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeHp = consumeHp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：生命不足\#G%d\#W，无法施展云叠山倾", consumeHp);
	
	if Atk:GetHP() < consumeHp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeHp(-1 * consumeHp, false);
	
	local wDam = 1;		--是CBatActor类型 
	local HitRate = 0;
	local randomDam = 1.2 - (math.random(100, 300) / 1000);
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	if Atk:IsBuffExist(1526) then
		HitRate = 60
	end
	
	local FinalDam = 0;
	local rec = 0;
	local CritHit = 0;
	if math.random(1,100) <= 5 then
		FinalDam = 0.12 * Atk:GetATK() * wDam * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = 0.12 * Atk:GetATK() * wDam * randomDam;
	end
	
	
	
	if Target:GetCommand() == LuaI.BATCMD_DEFEND then
		FinalDam = FinalDam / 2;
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
		end
	else
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
		end
	end	
	
	if FinalDam <= 10 then
		FinalDam = math.random(1, 10);
	end
	
	local reDam = Target:GetFinalValue(-FinalDam, Atk, Atk:GetAction(), 1);
	rec = -1 * reDam * 0.3;
	
	if rec <= 0 then
		rec = 1;
	elseif rec >= Target:GetSP() then
		rec = Target:GetSP();
	end
	
	Target:ChangeSp(-0.3 * FinalDam);
	
	if math.random(1, 100) <= HitRate then
		Atk:ChangeSp(rec);
	end
	local turn = 5;
	
	if Target:GetHP() ~= 0 and (Target:IsBuffExist(1000) == false) and  math.random(1, 100) <= HitRate then
		Target:AddBuff(1004, 1, reDam * -0.002, 0, turn, 100); 
	end
	
	battle:PushReactionActor(Target);
	
end

