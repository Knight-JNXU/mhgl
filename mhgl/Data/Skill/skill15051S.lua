--姐妹同心

function skill15051CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需姊妹相随修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill15051Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 40;	
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展姐妹同心", consumeSp);
	
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
	
	if skillLv > Target:GetLevel() then
		HitRate = (70 + 2 * (skillLv - Target:GetLevel()) ^ 0.5) * nDam;
	else
		HitRate = (70 + 2.2 * (skillLv - Target:GetLevel())) * nDam;
	end
	
	if HitRate < 1 then
		HitRate = 1;
	elseif HitRate > 95 then
		HitRate = 95;
	end	
	
	local FinalDam = 0;	
	if math.random(1, 100) > HitRate then
	   Target:MissSkill();
	   else
	   FinalDam = skillLv * 5;
	end
	
		
	
	
	
	
    Target:ChangeSp(-1 * FinalDam);
    
	battle:PushReactionActor(Target);
	
	
end
