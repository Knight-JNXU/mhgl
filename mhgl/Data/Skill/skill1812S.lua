--鹰击

function skill1812CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需生死搏修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill1812Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = 2;
	
	if skillLv < 60  then
		maxTargetCount = 2;
	elseif skillLv < 90 then
	maxTargetCount = 3;
	elseif skillLv < 120 then
	maxTargetCount = 4;
	elseif skillLv < 150 then
	maxTargetCount = 5;
	elseif skillLv >= 150 then
	maxTargetCount = 6;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((skillLv - 35)/ 20) * 20 + 35;
	local consumeSp = 30 * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展鹰击", consumeSp);
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	if Atk:IsBuffExist(1502) == false then
	  Atk:SkillFail("\#W[战斗讯息]：此招式需在变身状态下才能施展");
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
			if 0.8 * Atk:GetATK() > targetlist[i]:GetDEF() then
				if math.random(1, 100) <= 5 then
					FinalDef = targetlist[i]:GetDEF() / 2;
				end
			end
			
			local FinalDam = 0;
			local CritHit = 0;
			local CritRate =  math.floor(Atk:GetSkillLv(1850) / 10) + 2;
			FinalDam = ((1.05 * Atk:GetATK() - FinalDef  + 250) * wDam - 250) * randomDam;
			--法宝结算
		    local fabao = 0;
		    if Atk:GetSkillLv(394) > 0 then
		       fabao = Atk:GetSkillLv(394)*0.02
			   CritRate = math.random(20,30)
			   FinalDam = ((1.05 * Atk:GetATK() - (1-fabao)*FinalDef  + 250) * wDam - 250) * randomDam;
			   FinalDam = FinalDam + (FinalDam*Atk:GetSkillLv(394)*0.02)
		    end
		    --法宝结算
			if targetlist[i]:IsMob() or targetlist[i]:IsBoss() then
	           FinalDam = FinalDam * 1.3
	        end
			if math.random(1,100) <= CritRate then
				FinalDam = FinalDam * critDam;
				CritHit = 1;
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
			local st = 0;
		    if Atk:GetSkillLv(394) > 1 then
			    st = 50
			   end
			
				local r = math.random(1, 100) 
			  if Atk:GetSkillLv(394) >= 0 then 
			   if r <= st then
				bx = 0
				elseif r <= 100 then
				bx = 1
				else
				bx = 1			
			   end			
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
	
	Atk:AddBuff(1303, skillLv, 0, 0, bx, 100);
end

