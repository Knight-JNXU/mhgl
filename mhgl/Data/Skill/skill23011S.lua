--龙卷雨击

function skill23011CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需瞬息万变修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
	
end

function skill23011Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 25)/ 35) + 2;
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((skillLv - 25)/ 20) * 20 + 25;
	local consumeSp = 20 * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展落叶萧萧",consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local xishu = count;
	if xishu > 5 then
		xishu = 5
		end
	
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
		
		
		local weaponDam = Atk:GetWeaponATK() * 0.3;
		--local hpChange = ((Atk:GetPOW() - targetlist[i]:GetPOW()) + weaponDam +500+ skillLv * 2.5)*(20-xishu)/20* nDam-500;
					
		local fabao = 0;
		local ActRate = math.random(1, 100);
	local ActRateMax = 100;
	local ActNum = 1;
	local a = 1;
	if Atk:GetSkillLv(394) > 0 then --法宝忽视灵力
	   fabao = Atk:GetSkillLv(394)*0.04 
	   --ActRateMax = Atk:GetSkillLv(394)*3
	   if ActRate < ActRateMax then
	      ActNum = 2
	   end
	end
		
		while a <= ActNum do
		local hpChange = ((Atk:GetPOW() - targetlist[i]:GetPOW()) + weaponDam +500+ skillLv * 2.5)*(20-xishu)/20* nDam-500;
		if Atk:GetSkillLv(394) > 0 then --法宝增伤
		   hpChange = hpChange + (hpChange*Atk:GetSkillLv(394)*0.02)
		end
		
		if targetlist[i]:IsMob() or targetlist[i]:IsBoss()  then
		hpChange = hpChange*1.8
		else
		hpChange = hpChange*1.3
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
		a = a + 1;
		end
	end
end

