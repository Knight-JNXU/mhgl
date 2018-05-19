--弛纵心猿秘法

function skill2641CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需弛纵心法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill2641Use(Atk, Target, battle, skillLv)

	local consumeSp = 0.8 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展弛纵心猿秘法", consumeSp);
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	if Target:IsBuffExist(1111) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经中了弛纵心猿秘法");
		do return end
	end
	if Target:IsBoss() then
		Atk:SkillFail("\#W[战斗讯息]：不能睡眠主怪");
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
	
	local BuffRate = 0;
	local LvDif = skillLv - Target:GetLevel();
	if LvDif > 0 then
		BuffRate = (66 + 2 * LvDif ^ 0.5) * nDam;
	else
		BuffRate = (66 + 2.2 * LvDif) * nDam;
	end
	if Target:IsBuffExist(1807) then
		BuffRate = BuffRate * 0.9;
	end
	if BuffRate < 1 then
		BuffRate = 1;
	elseif BuffRate > 95 then
		BuffRate = 95;
	end
	
	if math.random(1, 100) > BuffRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	local turn = 8 + math.floor((skillLv - Target:GetLevel()) / 10);
	if turn < 6 then
		turn = 6;
	elseif turn > 10 then
		turn = 10;
	end
	local result = skillCanHit(Atk, Target);	
	if result == 2 then
		Target:MissSkill();
	else	
		Target:AddBuff(1111, skillLv, 1, 0, turn, 100);
	end
	battle:PushReactionActor(Target);	
end

