--龙翔凤舞

function skill8081CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8081Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local targetlist = {};
	local maxTargetCount = 3;
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	
	local consumeSp = 10 * (0.8 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展龙翔凤舞", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:GetIndex() ~= Atk:GetIndex() then
			
			local wDam = 1;		--是CBatActor类型 			
			local randomDam = 1.2 - (math.random(100, 300) / 1000);
			local critDam = 2.0;
			local FinalDef = targetlist[i]:GetDEF();
			if 0.8 * Atk:GetATK() > targetlist[i]:GetDEF() then
				if math.random(1, 100) <= 5 then
					FinalDef = targetlist[i]:GetDEF() / 2;
				end
			end
			
			local FinalDam = 0;
			local CritHit = 0;
			if math.random(1,100) <= 5 then
				FinalDam = ((1.15 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam;
				CritHit = 1;
			else
				FinalDam = ((Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;	
			end
			
			if FinalDam <= 10 then
				FinalDam = math.random(1, 10);
			end
			
			local reDam = targetlist[i]:GetFinalValue(-FinalDam, Atk, Atk:GetAction(), 1);
			
			if targetlist[i]:GetCommand() == LuaI.BATCMD_DEFEND then
				FinalDam = FinalDam / 2;
				reDam = reDam / 2;
				
				if CritHit == 1 then
					targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_DEFEND_CRIT_HIT);
				else
					targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_DEFEND_HIT);
				end
			else
				if CritHit == 1 then
					targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
				else
					targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
				end
			end
			battle:PushReactionActor(targetlist[i]);
		end
		
		i = i + 1;
	end
	
	Atk:AddBuff(1300, 1, 0, 0, 1, 100);
	
end

