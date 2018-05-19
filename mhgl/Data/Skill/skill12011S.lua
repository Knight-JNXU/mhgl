-- 判官令

function skill12011CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需拘魂诀修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);	
	end	
end

function skill12011Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 20;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展判官令", consumeSp);
	
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
	
	local hpChange = (skillLv*3+75)*1.5*nDam+Atk:GetSkillLv(378)*5;
	
	if Target:IsParnter() or Target:IsPlayer() then
	  hpChange = (skillLv * 3 + 75)*nDam+Atk:GetSkillLv(378)*5;
	 end
	
	if LuaI.GetGameTime(0) == 1 then
		hpChange = hpChange * 1.3;
	end
	if Target:IsMob() or Target:IsBoss() then
	   hpChange = hpChange * 1.5
	end
	if Atk:GetSkillLv(394) > 0 then
	   hpChange = hpChange + (hpChange * Atk:GetSkillLv(394) * 0.03)
	end
	if hpChange <= 10 then
		hpChange = math.random(1, 10);
	end	
	
	local spChange = 1.5 * skillLv;
	
	local result = skillCanHit(Atk, Target);
	
	if result == 2 then
		Target:MissSkill();
	else
		Target:ChangeHp(-1 * hpChange);
		Target:ChangeSp(-1 * spChange);
		
	end
	
	battle:PushReactionActor(Target);
	
end
