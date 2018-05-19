--五雷轰顶

function skill16011CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需天罡气修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill16011Use(Atk, Target, battle, skillLv)

	local consumeSp = 50;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足%d，无法施展五雷轰顶", consumeSp);
	
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
	
	local HitRate = 0;
	if skillLv > Target:GetLevel() then
		HitRate = (58 + 2 * (skillLv - Target:GetLevel()) ^ 0.5) * nDam;
	else
		HitRate = (58 + 2.2 * (skillLv - Target:GetLevel())) * nDam;
	end
	if HitRate < 1 then
		HitRate = 1;
	elseif HitRate > 75 then
		HitRate = 75;
	end	
	--法宝结算
	local fabao = 0;
	if Atk:GetSkillLv(394) > 0 then
	   fabao = Atk:GetSkillLv(394)
	end
	HitRate = HitRate + fabao
	--法宝结算
	
	
	
	local hpChange = 0;
	local spChange = 0;
	local PassiveDam = math.floor (Atk:GetSkillLv(16010) / 15);
	if math.random(1, 100) <= HitRate then
		
		hpChange = (0.25 + PassiveDam / 100) * Target:GetHP();
		spChange = (0.25 + PassiveDam / 100) * Target:GetSP();
		if hpChange > 100 * skillLv then
			hpChange = 100 * skillLv + math.random(1,10);	
		end
	else
		hpChange = (0.05 + PassiveDam / 100) * Target:GetHP() + 50;
		if hpChange > (10 + PassiveDam) * skillLv then
			hpChange = (10 + PassiveDam) * skillLv + math.random(1,10);	
		end
	end
	
	if hpChange <= 1 then
		hpChange = 1;
	end
	
	if spChange <= 1 then
		spChange = 1;
	end
	
	Target:ChangeHp(-1 * hpChange);
	Target:ChangeSp(-1 * spChange);
	battle:PushReactionActor(Target);
	
end

