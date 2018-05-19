--勾魂摄心大法

function skill2021CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需销魂天魔舞修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1811) then
		Atk:SkillFail("\#W[战斗讯息]：调息期间不能使用该技能");
	end
end

function skill2021Use(Atk, Target, battle, skillLv)
	
	local consumeSp = skillLv * 0.5 + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展勾魂摄心大法", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1114) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经中了勾魂摄心大法");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local wDam = 1;		--是CBatActor类型 
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
						wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(382);
					end
				end
			end
		end
	else
		wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ Target:GetSkillLv(377);
	end
	
	local HitRate = 0;
	if skillLv > Target:GetLevel() then
		HitRate = (60 + 2 * (skillLv - Target:GetLevel()) ^ 0.5) * wDam;
	else
		HitRate = (60 + 2.2 * (skillLv - Target:GetLevel())) * wDam;
	end
	if Target:IsBuffExist(1807) then
		HitRate = HitRate * 0.9;
	end
	if HitRate < 1 then
		HitRate = 1;
	elseif HitRate > 95 then
		HitRate = 95;
	end	
	if math.random(1, 100) > HitRate then
		Target:MissSkill();
		Atk:AddBuff(1811, skillLv, 0, 0, 3, 100);
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 3 + math.floor((skillLv - Target:GetLevel()) / 10);
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	Atk:AddBuff(1811, skillLv, 0, 0, 4, 100);
	Target:AddBuff(1114, skillLv, 0, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

