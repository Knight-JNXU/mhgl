--BOSS万胜连环

function skill8020CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8020Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local maxAtkTime =  math.floor((Lv - 35 )/ 25) + 2;
	if maxAtkTime > 6 then
		maxAtkTime = 6;
	elseif maxAtkTime < 2 then
		maxAtkTime = 2;
	end
	
	local consumeSp = (0.2 * Lv + 20) * maxAtkTime;
	
	--local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展万胜连环", consumeSp);
	
	--if  Atk:GetSP() < consumeSp then
	--	Atk:SkillFail(Msg);
	--	do return end
	--end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local hpChange = ((1.2 - 0.1 * math.floor((Lv - 35) / 25)) * Atk:GetPOW() - Target:GetPOW() + 1.5 * Lv);
	
	if hpChange <= 10 then
		hpChange = math.random(Atk:GetLevel(), Atk:GetLevel() * 2 + 8);
	end	
	
	local i = 1;
	local KillFlag = 0;
	while i <= maxAtkTime and KillFlag == 0 do
		
		if hpChange >= Target:GetHP() - hpChange * (i - 1) then
			KillFlag = 1;
		end	
		Target:AddAttriChangeToLst(-1 * hpChange, 0, 0, 0, LuaI.BATCMD_SKILL_HIT);	
		i = i + 1;
	end
	battle:PushReactionActor(Target);
	
	Atk:AddBuff(22, 0, 0, 0, 1, 100);
	Atk:RemoveBuff(36);
	
end
