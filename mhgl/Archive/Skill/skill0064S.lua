--灵鹤展翼

function skill0064CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需虎鹤双形修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end	
	elseif Atk:GetHP() < 0.6 * Atk:GetMaxHP() then
		Atk:SkillFail("\#W[战斗讯息]：此招式需有\#G60\%\#W以上的生命才能施展");
	end	
end

function skill0064Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = 2;
	
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = 0.5 * skillLv * count;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展灵鹤展翼", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:GetIndex() ~= Atk:GetIndex() then
			local wDam = Atk:GetSkillLv(376) - targetlist[i]:GetSkillLv(377);
			local randomDam = 1.2 - math.random(100, 300) / 1000;
			local critDam = 1.5;
			local FinalDef = targetlist[i]:GetDEF();
			if 0.8 * Atk:GetATK() > targetlist[i]:GetDEF() then
				if math.random(1, 100) <= 5 then
					FinalDef = targetlist[i]:GetDEF() / 2;
				end
			end
			
			local FinalDam = 0;
			local CritHit = 0;
			if math.random(1,100) <= 5 then
				FinalDam = (0.9 * (Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam * critDam;
				CritHit = 1;
			else
				FinalDam = (0.9 * (Atk:GetATK() - FinalDef) * 1.05 ^ wDam) * randomDam;
			end
			
			if targetlist[i]:GetCommand() == LuaI.BATCMD_DEFEND then
				FinalDam = FinalDam / 2;
				Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
				if CritHit == 1 then
					Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
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
				Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
			end
			battle:PushReactionActor(targetlist[i]);
		end
		
		i = i + 1;
	end
	
end

