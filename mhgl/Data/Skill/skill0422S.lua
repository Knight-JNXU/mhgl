--真·天魔刀

function skill0422CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0422Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill1 = Atk:GetSkillLv(5301);
	local skill2 = Atk:GetSkillLv(5389);
	local targetlist = {};
	local maxTargetCount = math.floor(Lv / 30) + 1;
	if maxTargetCount > 3 then
		maxTargetCount = 3;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor(Lv / 30) + 2;
	    if maxTargetCount > 3 then
		    maxTargetCount = 3;
	    elseif maxTargetCount < 1 then
		    maxTargetCount = 1;
	    end
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = 50 * count;
	
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展大海无量", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:GetIndex() ~= Atk:GetIndex() then			
			local wDam = 1;		
			local wDam1 = 1;
			local ZPartnerOwner;		
			local PartnerOwner;			
			if Atk:IsParnter() then
				local ZpBatMob = Atk:ToBatMob();
				if ZpBatMob ~= nil then
					for jj=0, battle:GetActorCount() - 1 do
						local ZpActor = battle:GetActor(jj);
						if ZpActor:IsPlayer() then
							local ZpBatChar = ZpActor:ToBatChar();
							if ZpBatChar ~= nil and ZpBatChar:GetChar_id() == ZpBatMob:GetOwner_id() then
								ZPartnerOwner = ZpActor;
								wDam1 = 1.02 ^ ZPartnerOwner:GetOwner():GetSkillLv(382);
							end
						end
					end
				end
			else
				wDam1 = 1.02 ^ Atk:GetSkillLv(376);
			end
			if targetlist[i]:IsParnter() then
				local pBatMob = targetlist[i]:ToBatMob();
				if pBatMob ~= nil then
					for ii=0, battle:GetActorCount() - 1 do
						local pActor = battle:GetActor(ii);
						if pActor:IsPlayer() then
							local pBatChar = pActor:ToBatChar();
							if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
								PartnerOwner = pActor;
								wDam = wDam1 * 0.982 ^ PartnerOwner:GetOwner():GetSkillLv(383);
							end
						end
					end
				end
			else
				wDam = wDam1 * 0.98 ^ targetlist[i]:GetSkillLv(376);
			end
			
			local randomDam = 1.2 - math.random(150, 300) / 1000;
			local critDam = 2.0;
			local FinalDef = targetlist[i]:GetDEF();
			if 0.7 * Atk:GetATK() > targetlist[i]:GetDEF() then
				if math.random(1, 100) <= 5 then
					FinalDef = targetlist[i]:GetDEF() / 2;
				end
			end
			
			local FinalDam = 0;
			local CritHit = 0;
			local CritRate =  10;
			if Atk:IsBuffExist(2043) then
				CritRate = 30;
			elseif Atk:IsBuffExist(1925) then
				CritRate = 50;
			end
			if math.random(1,100) <= CritRate then
				FinalDam = (((1.25 * Atk:GetATK() - FinalDef) + 300) * wDam - 250) * randomDam * critDam;
				CritHit = 1;
			else
				FinalDam = (((1.25 * Atk:GetATK() - FinalDef) + 300) * wDam - 250) * randomDam;
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
				targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
			end
			
			if CritHit == 1 then
				targetlist[i]:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
			end
			if math.random(1,100) <= 0 and targetlist[i]:IsBuffExist(1105) ~= true and targetlist[i]:GetHP() ~= 0 then 
				targetlist[i]:AddBuff(1105, Lv, 0, 0, 0, 100);
			end			
			if math.random(1,100) <= 0 and targetlist[i]:IsBuffExist(1105) ~= true and targetlist[i]:GetHP() ~= 0 then 
				targetlist[i]:AddBuff(1105, Lv, 0, 0, 0, 100);
			end
			battle:PushReactionActor(targetlist[i]);
		end
		i = i + 1;
	end	
end