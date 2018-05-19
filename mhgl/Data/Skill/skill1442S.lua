--凤飞羽散

function skill1442CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需幻念聆音修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk.SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk.SkillFail(Msg);
	end	
end

function skill1442Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.4 * skillLv +10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展凤飞羽散", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);

	local buffid = {1500, 1501, 1503, 1504, 1505, 1506, 1507, 1514, 1516, 1518, 1519, 1200, 1201, 1202, 
					1203, 1517, 1632, 1633, 1634, 1709, 1803, 1806, 1815, 3075};--对应skillid
	local HitRate = 0;
	local i = 1;
	local Rate = 0;
	
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
	
	if Target:GetLevel() > skillLv then
		Rate = 60 + 2.2 * (skillLv - Target:GetLevel()); 
	else
		Rate = 60 + 2 * (skillLv - Target:GetLevel()) ^ 0.5;
	end
	
	local HitRate = Rate * nDam;
	if HitRate > 90 then
		HitRate = 90;
	end
	
	if HitRate < 5 then
		HitRate = 5;
	end
	
	if math.random(1, 100) <= HitRate then
		i = 1;
		while buffid[i] ~= nil do
			Target:RemoveBuff(buffid[i]);
			i = i + 1;
		end
	else 
		Target:MissSkill();
	end
	
	battle:PushReactionActor(Target);
	
end


