-- 黄泉之息

function skill12023CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需幽冥术修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);	
	end	
end

function skill12023Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 50;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展黄泉之息", consumeSp);
	
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
	
	local hpChange = (skillLv*3+100)*nDam+Atk:GetSkillLv(378)*5;
	
	
	if LuaI.GetGameTime(0) == 1 then
		hpChange = hpChange * 1.3;
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
	if Target:IsBuffExist(7023) then
	Target:AddBuff(7024, skillLv, 0, 0, 150, 100);
	
	elseif Target:IsBuffExist(7022) then
	Target:AddBuff(7023, skillLv, 0, 0, 150, 100);
	
	elseif Target:IsBuffExist(7021) then
	Target:AddBuff(7022, skillLv, 0, 0, 150, 100);
	
	elseif Target:IsBuffExist(7020) then
	Target:AddBuff(7021, skillLv, 0, 0, 150, 100);
	
	elseif Target:IsBuffExist(7019) then
	Target:AddBuff(7020, skillLv, 0, 0, 150, 100);
	
	elseif Target:IsBuffExist(7018) then
	Target:AddBuff(7019, skillLv, 0, 0, 150, 100);
	
	elseif Target:IsBuffExist(7017) then
	Target:AddBuff(7018, skillLv, 0, 0, 150, 100);
	
	elseif Target:IsBuffExist(7016) then
	Target:AddBuff(7017, skillLv, 0, 0, 150, 100);
	
	elseif Target:IsBuffExist(7015) then
	Target:AddBuff(7016, skillLv, 0, 0, 150, 100);
	
	elseif Target:IsBuffExist(7014) then
	Target:AddBuff(7015, skillLv, 0, 0, 150, 100);
	else
	Target:AddBuff(7014, skillLv, 0, 0, 150, 100);
	end
	battle:PushReactionActor(Target);
	
end
