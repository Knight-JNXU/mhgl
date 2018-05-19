--飞沙走石

function skill11012CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需火云术修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);	
	end		
end

function skill11012Use(Atk, Target, battle, skillLv)

	local targetlist = {};
	
	local maxTargetCount = math.floor((skillLv - 30) / 25) + 2;
	
	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((skillLv - 30)/ 25) * 25 + 30;
	local consumeSp = 30 * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展飞沙走石", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local nDam = 1;		--是CBatActor类型 
		local PartnerOwner;			--是CBatActor类型 
		local Crit = 0; --暴击标志
	    local CritRate = 10; --暴击概率
		local CRate = math.random(1,100)
	    local CritMult = 1.8; --暴击倍数
		if CRate <= 10 then
	       CritMult = 2.5
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
							nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
							CritMult = 2;
						end
					end
				end
			end
		else
			nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ targetlist[i]:GetSkillLv(379);
		end
		
		
		local weaponDam = Atk:GetWeaponATK() * 0.3;
		local hpChange = 0;
					
		if Atk:GetSkillLv(394) > 0 then
		   CritRate = Atk:GetSkillLv(394)*2.5
		end
		
		if math.random(1,100) <= CritRate then
			hpChange = ((Atk:GetPOW() *CritMult- targetlist[i]:GetPOW()) + weaponDam +500+ skillLv * 3)*(20-count)/15 * nDam -500;
			Crit = 1;
		else
			hpChange = ((Atk:GetPOW() - targetlist[i]:GetPOW()) + weaponDam +500+ skillLv * 3)*(20-count)/15 * nDam-500;
			Crit = 0;
		end
		
		if Atk:IsBuffExist(5026) then
		hpChange = hpChange + Atk:GetSkillLv(11040)*1.25;
	    end
		
		
		if targetlist[i]:IsMob() or targetlist[i]:IsBoss()  then
		hpChange = hpChange*1.6
		else
		hpChange = hpChange*1.2
		end
		
		if hpChange <= 10 then
			hpChange = math.random(1, 10);
		end
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			--targetlist[i]:ChangeHp(-1 * hpChange);
			if Crit == 1 then
		       targetlist[i]:AddAttriChangeToLst(-1 * hpChange, 0, 0, 0, LuaI.BATCMD_CRIT_HIT); --暴击效果  BATCMD_CRIT_HIT暴击效果 BATCMD_SKILL_HIT普通效果  BATCMD_DEFEND_CRIT_HIT防御暴击效果  BATCMD_DEFEND_HIT防御效果
		    else
		       targetlist[i]:AddAttriChangeToLst(-1 * hpChange, 0, 0, 0, LuaI.BATCMD_SKILL_HIT); --普通效果
		    end
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end
