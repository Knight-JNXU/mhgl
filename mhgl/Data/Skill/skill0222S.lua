--剑锁影缠

function skill0222CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill0222Use(Atk, Target, battle, skillLv)

	local sLv = Atk:GetLevel();
	local targetlist = {};
	local maxTargetCount = math.random(3, 6);
	local consumeSp = 0.5 * sLv + 10;
	if Target:IsParnter() then
		maxTargetCount = 1;
	elseif Target:IsMob() and not Target:IsParnter() then
		consumeSp = 1.0 * sLv + 10;
	else
		--local Msg1 = string.format("\#W[战斗讯息]：不能对人物角色使用");
		--Atk:SkillFail(Msg1);
		--do return end
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展", consumeSp);
	
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
								wDam = wDam1 * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
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
			if Atk:IsBuffExist(1925) then
				CritRate = 30;
			elseif Atk:IsBuffExist(0) then
				CritRate = 40;
			end
			if math.random(1,100) <= CritRate then
				FinalDam = (((1.25 * Atk:GetATK() - FinalDef) + 250) * wDam - 150) * randomDam * critDam;
				CritHit = 1;
			else
				FinalDam = (((1.25 * Atk:GetATK() - FinalDef) + 250) * wDam - 150) * randomDam;
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
			if math.random(1,100) <= 20 and targetlist[i]:IsBuffExist(1123) ~= true and targetlist[i]:GetHP() ~= 0 then 
				targetlist[i]:AddBuff(1123, Lv, 0, 0, 1, 100);
			end			
			if math.random(1,100) <= 15 and targetlist[i]:IsBuffExist(1123) ~= true and targetlist[i]:GetHP() ~= 0 then 
				targetlist[i]:AddBuff(1123, Lv, 0, 0, 1, 100);
			end
			battle:PushReactionActor(targetlist[i]);
		end
		i = i + 1;
	end	
end