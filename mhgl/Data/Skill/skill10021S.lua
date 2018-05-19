--龙腾

function skill10021CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需龙腾修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill10021Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 30;	
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展龙腾", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = 1;		--是CBatActor类型 
	local PartnerOwner;			--是CBatActor类型 
	if Target:IsParnter() then
		local pBatMob = Target:ToBatMob();
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
		nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ Target:GetSkillLv(379);
	end
	
	local weaponDam = Atk:GetWeaponATK()*0.3;
	--local hpChange = ((Atk:GetPOW() - Target:GetPOW()) + weaponDam+500 + skillLv * 3) * nDam-500;
	
	local fabao = 0;
	local ActRate = math.random(1, 100);
	local ActRateMax = 0;
	local ActNum = 1;
	local i = 1;
	if Atk:GetSkillLv(394) > 0 then --法宝忽视灵力
	   fabao = Atk:GetSkillLv(394)*0.04 
	   ActRateMax = Atk:GetSkillLv(394)*3
	   if ActRate < ActRateMax then
	      ActNum = 2
	   end
	end
	while i <= ActNum do
		local hpChange = ((Atk:GetPOW() - (1 - fabao)* Target:GetPOW()) + weaponDam+500 + skillLv * 3) * nDam-500-math.random(1, 100);
		
		if Atk:GetSkillLv(394) > 0 then --法宝增伤
		   hpChange = hpChange + (hpChange*Atk:GetSkillLv(394)*0.02)
		end
		if Target:IsMob() or Target:IsBoss()  then
		hpChange = hpChange*2
		else
		hpChange = hpChange*1.7
		end
	
	if hpChange <= 10 then
		hpChange = math.random(1, 10);
	end
	
	local result = skillCanHit(Atk, Target);
	
	if result == 2 then
		Target:MissSkill();
	else
		Target:ChangeHp(-1 * hpChange);
	end
	
	battle:PushReactionActor(Target);
	i = i + 1;
	end
end

