--天雷斩

function skill22011CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此技能需气吞山河修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此技能需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill22011Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = math.floor((skillLv - 35) / 20) + 1;
	
	if maxTargetCount > 1 then
		maxTargetCount = 1;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	
	if Atk:GetSkillLv(394) > 0 then
	   maxTargetCount = maxTargetCount + 1;
	end
	
	if Target:IsParnter() or Target:IsPlayer() then
	  maxTargetCount = 1
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((skillLv - 35)/ 20) * 20 + 35;
	local consumeSp = 50 * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展裂石", consumeSp);
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	Atk:ChangeSp(-1 * consumeSp, false);
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:GetIndex() ~= Atk:GetIndex() then			
			
			local wDam = 1;		--是CBatActor类型 
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
								wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
							end
						end
					end
				end
			else
				wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ targetlist[i]:GetSkillLv(377);
			end
			local randomDam = 1.2 - math.random(100, 300) / 1000;
			local weaponDam = 0.25 * (Atk:GetHIT() - Atk:GetAGI() * 1.7 - 6);
			local critDam = 2.0;
			local FinalDef = targetlist[i]:GetDEF();
			if 1.18 * Atk:GetATK() > targetlist[i]:GetDEF() then
				if math.random(1, 100) <= 5 then
					FinalDef = targetlist[i]:GetDEF() / 2;
				end
			end
			local sh = 1.25 * Atk:GetATK() - FinalDef ;
			local FinalDam = 0;
			local CritHit = 0;
			local CritRate =  math.floor(Atk:GetSkillLv(22010) / 10) + 2;
			if math.random(1,100) <= 5 then
				FinalDam =((1.15*Atk:GetATK() - targetlist[i]:GetDEF() + 250) * wDam - 200)  * randomDam * critDam;
				CritHit = 1;
			else
			    FinalDam =((1.15*Atk:GetATK() - targetlist[i]:GetDEF() + 250) * wDam - 200) * randomDam ;
				end
			
			FinalDam = FinalDam * 1 --强制降低
			if targetlist[i]:GetCommand() == LuaI.BATCMD_DEFEND then
				FinalDam = FinalDam / 1.5  ;
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
				if Atk:GetSkillLv(394) > 0 then
				   FinalDam = FinalDam + (FinalDam * Atk:GetSkillLv(394) * 0.01)
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
			if targetlist[i]:IsBuffExist(0) then
	targetlist[i]:AddBuff(0, skillLv, 0, 0, 0, 100);
	
	elseif targetlist[i]:IsBuffExist(0) then
	targetlist[i]:AddBuff(0, skillLv, 0, 0, 0, 100);
	
	elseif targetlist[i]:IsBuffExist(0) then
	targetlist[i]:AddBuff(0, skillLv, 0, 0, 0, 100);
	end
			battle:PushReactionActor(targetlist[i]);
		end
		i = i + 1;
	end
	
	if Atk:IsBuffExist(1493) then
	Atk:AddBuff(1494, skillLv, 0, 0, 150, 100);
	
	elseif Atk:IsBuffExist(1492) then
	Atk:AddBuff(1493, skillLv, 0, 0, 150, 100);
	else
	Atk:AddBuff(1492, skillLv, 0, 0, 150, 100);
	end
	
end

