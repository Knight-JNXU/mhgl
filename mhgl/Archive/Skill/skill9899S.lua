--天外飞仙

function skill9899CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	if Atk:IsBuffExist(1525) == false then
		Atk:SkillFail("\#W[战斗讯息]：此招式需在月煌虚引状态下才能施展");
	end
end

function skill9899Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local targetlist = {};
	
	local maxTargetCount = 4;
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((Lv - 35)/ 20) * 20 + 35;
	local consumeSp = ((1.2 * MSSLv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展天外飞仙", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:GetIndex() ~= Atk:GetIndex() then			
			
			local wDam = 1;		--是CBatActor类型 			
			local randomDam = 1.2 - math.random(100, 300) / 1000;
			local critDam = 2.0;
			local FinalDef = targetlist[i]:GetDEF();
			if 0.8 * Atk:GetATK() > targetlist[i]:GetDEF() then
				if math.random(1, 100) <= 5 then
					FinalDef = targetlist[i]:GetDEF() / 2;
				end
			end
			
			local FinalDam = 0;
			local CritHit = 0;			
			if math.random(1,100) <= 10 then
				FinalDam = ((1.2 * Atk:GetATK() - 0.85 * FinalDef + 250) * wDam - 250) * randomDam * critDam;
				CritHit = 1;
			else
				FinalDam = ((1.2 * Atk:GetATK() - 0.85 * FinalDef + 250) * wDam - 250) * randomDam;
			end
			
			
			if targetlist[i]:GetCommand() == LuaI.BATCMD_DEFEND then
				FinalDam = FinalDam / 2;
				if  FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				end
				
				local result = skillCanHit(Atk,targetlist[i]);
				if result == 2 then
					targetlist[i]:MissSkill();
				else
					--targetlist[i]:ChangeHp(-1 * FinalDam);
					if CritHit == 1 then
						targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_DEFEND_CRIT_HIT);
					else
						targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_DEFEND_HIT);
					end
				end
			else
				if  FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				end
				
				local result = skillCanHit(Atk,targetlist[i]);
				if result == 2 then
					targetlist[i]:MissSkill();
				else
					--targetlist[i]:ChangeHp(-1 * FinalDam);
					if CritHit == 1 then
						targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
					else
						targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
					end
				end
			end
			battle:PushReactionActor(targetlist[i]);
		end
		i = i + 1;
	end
	Atk:RemoveBuff(1525);	
	Atk:AddBuff(1303, 1, 0, 0, 1, 100);
end

