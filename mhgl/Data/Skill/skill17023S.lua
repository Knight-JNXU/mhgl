--似玉生香

function skill17023CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需闭月羞花修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill17023Use(Atk, Target, battle, skillLv)

	local consumeSp = 50;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展似玉生香", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	if Target:IsBuffExist(1109) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经中了似玉生香");
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
		BuffRate = (60 + 2 * LvDif ^ 0.5) * nDam;
	else
		BuffRate = (60 + 2.2 * LvDif) * nDam;
	end
	if Target:IsBuffExist(1807) then
		BuffRate = BuffRate * 0.9;
	end
	if Target:IsBuffExist(1947) then
		HitRate = HitRate * 0.5;
	end		
	--new
	local TarLv = Target:GetLevel()
	local AtkFx = Atk:GetSkillLv(378)
	local TarFk = Target:GetSkillLv(379)
	if AtkFx > TarFk then
	   BuffRate = BuffRate + (AtkFx - TarFk)
	elseif AtkFx < TarFk then
	   BuffRate = BuffRate - (TarFk - AtkFx)
	end
	if skillLv > TarLv then
	  if skillLv - TarLv > 20 then
	     BuffRate = BuffRate + 50
	  end
	elseif skillLv < TarLv then
	  if TarLv - skillLv > 20 then
	     BuffRate = BuffRate - 50
	  end
	end
	
	if Target:IsMob() or Target:IsBoss()  then
	   if Atk:GetSkillLv(378) < 10 then
	      BuffRate = math.random(40, 60) + (skillLv/10)
	   elseif Atk:GetSkillLv(378) < 20 then
	      BuffRate = math.random(50, 70) + (skillLv/10)
	   elseif Atk:GetSkillLv(378) < 30 then
	      BuffRate = math.random(60, 80) + (skillLv/10)
	   end
	end
	if Atk:GetSkillLv(394) > 0 then --法宝提升封印命中率
	   BuffRate = BuffRate + Atk:GetSkillLv(394)
	end	
	if BuffRate < 1 then
		BuffRate = 1;
	elseif BuffRate > 80 then
	    BuffRate = 80;
	end
	
	
	if Target:IsBuffExist(3089) then
		BuffRate = 100;
	end
	
	if math.random(1, 100) > BuffRate then
		Target:MissSkill();
		if Target:IsBuffExist(3093) then
			Atk:AddBuff(1109, skillLv, 0, 0, turn, 100);
		end
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 3 + math.floor((skillLv - Target:GetLevel()) / 10);
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	local result = skillCanHit(Atk, Target);	
	if result == 2 then
		Target:MissSkill();		
	else	
		Target:AddBuff(1109, skillLv, 0, 0, turn, 100);
	end
	battle:PushReactionActor(Target);
	
end

