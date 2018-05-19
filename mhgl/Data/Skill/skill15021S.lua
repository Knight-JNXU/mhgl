--含情脉脉

function skill15021CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需催情大法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	end
end

function skill15021Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 50;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展含情脉脉", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(90001) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经中了含情脉脉");
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
		HitRate = (60 + 2 * (skillLv - Target:GetLevel()) ^ 0.5) * nDam;
	else
		HitRate = (60 + 2.2 * (skillLv - Target:GetLevel())) * nDam;
	end
	
	if Target:IsBuffExist(1807) then
		HitRate = HitRate * 0.9;
	end
	if Target:IsBuffExist(1947) then
		HitRate = HitRate * 0.5;
	end	
	--new
	local TarLv = Target:GetLevel()
	local AtkFx = Atk:GetSkillLv(378)
	local TarFk = Target:GetSkillLv(379)
	if AtkFx > TarFk then
	   HitRate = HitRate + (AtkFx - TarFk)
	elseif AtkFx < TarFk then
	   HitRate = HitRate - (TarFk - AtkFx)
	end
	if skillLv > TarLv then
	  if skillLv - TarLv > 20 then
	     HitRate = HitRate + 50
	  end
	elseif skillLv < TarLv then
	  if TarLv - skillLv > 20 then
	     HitRate = HitRate - 50
	  end
	end
	if Target:IsMob() or Target:IsBoss()  then
	   if Atk:GetSkillLv(378) < 10 then
	      HitRate = math.random(40, 60) + (skillLv/10)
	   elseif Atk:GetSkillLv(378) < 20 then
	      HitRate = math.random(50, 70) + (skillLv/10)
	   elseif Atk:GetSkillLv(378) < 30 then
	      HitRate = math.random(60, 80) + (skillLv/10)
	   end
	end
	if Atk:GetSkillLv(394) > 0 then --法宝提升封印命中率
	   HitRate = HitRate + Atk:GetSkillLv(394)
	end
	if HitRate < 1 then
		HitRate = 1;
	elseif HitRate > 80 then
	    HitRate = 80;
	end
	if math.random(1, 100) > HitRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 3 + math.floor((skillLv - Target:GetLevel()) / 10);
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	
	Target:AddBuff(90001, skillLv, 0, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

