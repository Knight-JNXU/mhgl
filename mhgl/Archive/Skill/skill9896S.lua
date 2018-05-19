--惊神无量刀

function skill9896CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill9896Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();----
	local consumeSp = Lv;----
	
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展惊神无量刀", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	Atk:ChangeSp(-1 * consumeSp, false);--------
	
	local wDam = 1;		--
	local wDam1 = 1;--
	local ZPartnerOwner;	--	
	local PartnerOwner;		--	
	if Atk:IsParnter() then--
		local ZpBatMob = Atk:ToBatMob();--
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
	if Target:IsParnter() then
		local pBatMob = Target:ToBatMob();
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
		wDam = wDam1 * 0.98 ^ Target:GetSkillLv(377);
	end
	
	local critDam = 2.0;
	local FinalDef = Target:GetDEF();
	if 0.8 * Atk:GetATK() > Target:GetDEF() then
		if math.random(1, 100) <= 5 then
			FinalDef = Target:GetDEF() / 2;
		end
	end
	
	local FinalDam = 0;
	local CritHit = 0;
	local CritRate =  5;
	local randomDam = 1.2 - math.random(150, 250) / 1000;
	if Atk:IsBuffExist(2043) then
		CritRate = 25;
	elseif Atk:IsBuffExist(2010) then
		CritRate = 15;
	end
	if math.random(1,100) <= CritRate then
		FinalDam = ((1.2 * Atk:GetATK() - 0.9 * FinalDef + 250) * wDam - 250) * randomDam * critDam;
		CritHit = 1;
	else
		FinalDam = ((1.2 * Atk:GetATK() - 0.95 * FinalDef + 250) * wDam - 250) * randomDam;
	end
				
	if Target:GetCommand() == LuaI.BATCMD_DEFEND then
		FinalDam = FinalDam / 2;
		Target:SetTempReaction(LuaI.BATCMD_DEFEND_HIT);
		if CritHit == 1 then
			Target:SetTempReaction(LuaI.BATCMD_DEFEND_CRIT_HIT);
		end
	end
	if  FinalDam <= 10 then
		FinalDam = math.random(1, 10);
	end
	
	local result = skillCanHit(Atk,Target);
	if result == 2 then
		Target:MissSkill();
	else
		Target:ChangeHp(-1 * FinalDam);
	end
	
	if CritHit == 1 then
		Target:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
	end

	if math.random(1, 100) <= 10 then
		local buffid = {1500, 1501, 1503, 1504, 1505, 1506, 1507, 1514, 1516, 1200, 1201, 1202, 
						1203, 1517, 1632, 1634, 1803, 1806, 1815, 3075};
		local i = 1;
		while buffid[i] ~= nil do
			Target:RemoveBuff(buffid[i]);
			i = i + 1;
		end
	end
	
	battle:PushReactionActor(Target);		
end
