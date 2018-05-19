--MOB鹤翼天翔

function skill6215CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6215Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill1 = Atk:GetSkillLv(5300);
	local skill2 = Atk:GetSkillLv(5302);
	local targetlist = {};
	local maxTargetCount = math.floor((Lv - 25) / 20) + 2;
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	if skill1 == 1 or skill2 == 1 then
	    maxTargetCount = math.floor((Lv - 25) / 20) + 3;
	    if maxTargetCount > 7 then
		    maxTargetCount = 7;
	    elseif maxTargetCount < 3 then
		    maxTargetCount = 3;
	    end
	end

	if Atk:GetMob_id() == 30726 then
		maxTargetCount = 4;
	end
	
	
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:GetIndex() ~= Atk:GetIndex() then			
			local wDam = 1;
			local PartnerOwner;			--是CBatActor类型 
			if targetlist[i]:IsParnter() then
				local pBatMob = targetlist[i]:ToBatMob();
				if pBatMob ~= nil then
					for ii=0, battle:GetActorCount() - 1 do
						local pActor = battle:GetActor(ii);
						if pActor:IsPlayer() then
							local pBatChar = pActor:ToBatChar();
							if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
								PartnerOwner = pActor;
								wDam = 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(382);
							end
						end
					end
				end
			else
				wDam =0.98 ^ targetlist[i]:GetSkillLv(376);
			end
			
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
				FinalDam = 0.7 * ((1.05 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam * critDam;
				CritHit = 1;
			else
				FinalDam = 0.7 * ((1.05 * Atk:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;
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
				--targetlist[i]:ChangeHp(-1 * FinalDam);
				targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
			end
			
			if CritHit == 1 then
				targetlist[i]:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
			end
			
			battle:PushReactionActor(targetlist[i]);
		end
		i = i + 1;
	end
	Atk:AddBuff(1303, (Lv + 10), 0, 0, 1, 100);
end

