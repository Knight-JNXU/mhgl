--雷霆万均

function skill16015CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需九龙决修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
	
end

function skill16015Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = 3;
	if Atk:GetSkillLv(394) > 0 then -- 法宝影响目标数量
	   maxTargetCount = 4;
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
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展雷霆万均",consumeSp);
	
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
		
		
		local weaponDam = Atk:GetWeaponATK();
		local hpChange = (skillLv*3.2+Atk:GetPOW() - targetlist[i]:GetPOW()+weaponDam+1700)*(20-count)/20*nDam-500;
		
		
		
		if hpChange <= 10 then
			hpChange = math.random(1, 10);
		end
		
		--法宝结算
		local hpChangeMax = hpChange
		local hpChangeMin = hpChangeMax - 500
		if hpChangeMin < 0 then
		   hpChangeMin = 1
		end
		if Atk:GetSkillLv(394) > 0 then
		   hpChangeMax = hpChangeMax + (hpChangeMax * Atk:GetSkillLv(394) * 0.05)
		end
		--法宝结算
		hpChange = math.random(hpChangeMin, hpChangeMax);
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

