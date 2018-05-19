--BOSS上官金虹龙翔凤舞
function skill0601CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0601Use(Atk, Target, battle, skillLv)
    local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local targetlist = {};
	local maxTargetCount = math.floor(Lv / 50) + 3;
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 3 then
		maxTargetCount = 3;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor(Lv / 50) + 3;
	    if maxTargetCount > 6 then
		    maxTargetCount = 6;
	    elseif maxTargetCount < 3 then
		    maxTargetCount = 3;
	    end
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:GetIndex() ~= Atk:GetIndex() then			
			local wDam = 1.02 ^ (math.floor((Lv+100)/170) * math.floor((Lv-73)/3)) * 0.98 ^ targetlist[i]:GetSkillLv(377);
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
			local CritRate =  math.floor((Lv + 10) / 10) + 2;
			if math.random(1,100) <= CritRate then
				FinalDam = ((1.05 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam;
				CritHit = 1;
			else
				FinalDam = ((1.05 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;
			end
			
			
			if targetlist[i]:GetCommand() == LuaI.BATCMD_DEFEND then
				FinalDam = FinalDam / 2;
				Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
				if CritHit == 1 then
					targetlist[i]:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
				end
			end
			if  FinalDam <= 10 then
				FinalDam = math.random(1, 10);
			end
			
			local result = skillCanHit(Atk,targetlist[i]);
			if result == 2 then
				targetlist[i]:MissSkill();
			else
				targetlist[i]:ChangeHp(-1 * FinalDam);
			end
			
			if CritHit == 1 then
				targetlist[i]:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
			end
			
			battle:PushReactionActor(targetlist[i]);
		end
		i = i + 1;
	end
end
