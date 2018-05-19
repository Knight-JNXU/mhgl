--双龙戏珠

function skill10033CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需九龙决修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
	
end

function skill10033Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = 2;
	if skillLv > 150 then
	   if math.random(1, 100) < 25 then
	      maxTargetCount = 3;
	   end
	end
	
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((skillLv - 25)/ 20) * 20 + 25;
	local consumeSp = 70;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展九龙决",consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		
		local nDam = 1;		--是CBatActor类型 
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
							nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
						end
					end
				end
			end
		else
			nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ targetlist[i]:GetSkillLv(379);
		end
		
		
		local weaponDam = Atk:GetWeaponATK()*0.3;
		local hpChange = (skillLv*3+Atk:GetPOW() - targetlist[i]:GetPOW()+weaponDam+500)*(20-count)/20*nDam-500;
		
		local fabao = 0;
		if Atk:GetSkillLv(394) > 0 then
		   fabao = Atk:GetSkillLv(394)*0.04 
		end
		
		if Atk:HasSkill(394) then
			hpChange = (skillLv*3+Atk:GetPOW() - (1-fabao) * targetlist[i]:GetPOW()+weaponDam+500)*(20-count)/20*nDam-500;
			hpChange = hpChange + (hpChange*Atk:GetSkillLv(394)*0.02)
		end
		
		if targetlist[i]:IsMob() or targetlist[i]:IsBoss()  then
		hpChange = hpChange*1.9
		else
		hpChange = hpChange*1.6
		end
		
		if hpChange <= 10 then
			hpChange = math.random(1, 10);
		end
		
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

