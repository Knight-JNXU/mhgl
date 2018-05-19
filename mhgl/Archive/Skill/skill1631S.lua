--气撼九重天

function skill1631CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需破天劲修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill1631Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.4 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展气撼九重天", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1113) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在混乱状态");
		do return end
	end
	
	if Target:IsPlayer() then
		Atk:SkillFail("\#W此招式不能用于玩家");
		do return end
	end	
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local hitRate = 0;
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
	local lv = skillLv - Target:GetLevel();
	if lv > 0 then
		hitRate = (44 + 2 * lv ^ 0.5) * wDam;
	else
		hitRate = (44 + 2.2 * lv) * wDam;
	end
	
	if Target:IsBuffExist(1807) then
		hitRate = hitRate * 0.9;
	end
	
	if hitRate < 1 then
		hitRate = 1;
	elseif hitRate > 95 then
		hitRate = 95;
	end
	
	local turn = 3 + math.floor(lv / 10);
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	if math.random(1, 100) <= hitRate then
		Target:AddBuff(1113, skillLv, 0, 0, turn, 100); 
	else
		Target:MissSkill();
	end
	
	battle:PushReactionActor(Target);
	
end

