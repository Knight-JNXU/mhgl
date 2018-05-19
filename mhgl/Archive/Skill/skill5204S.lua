--MOB万毒萦绕

function skill5204CanUse(Atk, skillLv, reqSkillLv, reqCharLv)	
end

function skill5204Use(Atk, Target, battle, skillLv)
	if Target:IsBuffExist(1002) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经中了万毒萦绕");
		do return end
	end
	
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local BuffRate = 0;
	local BuffRateBase = 54;
	
	if skill == 1 then
		BuffRateBase = 80;
	end
	
	local nDam = 1;
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
						nDam = 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
					end
				end
			end
		end
	else
		nDam =0.98 ^ Target:GetSkillLv(379);
	end
	
	local LvDif = Lv + 10 - Target:GetLevel();
	if LvDif > 0 then
		BuffRate = (BuffRateBase + 2 * LvDif ^ 0.5) * nDam;
	else
		BuffRate = (BuffRateBase + 2.2 * LvDif) * nDam;
	end
	if BuffRate < 1 then
		BuffRate = 1;
	elseif BuffRate > 100 then
		BuffRate = 100;
	end
	
	if Target:IsMob() then
		if Target:GetMob_id() == 10493 then
			BuffRate = 100;
		end
	end
	
	if math.random(1, 100) > BuffRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 3 + math.floor((Lv + 10 - Target:GetLevel()) / 10);
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	local hpDam = 0.15;
	local spDam = 0.1;
	local mhpDam = 0.1;
	
	if skill == 1 then
	    hpDam = 0.5;
		spDam = 0.5;
		mhpDam = 0.3;
	end
	
	local hpChange = Target:GetHP() * hpDam;
	local spChange = Target:GetSP() * spDam;
	local mhpChange = Target:GetMHP() * mhpDam;
	local result = skillCanHit(Atk, Target);	
	if result == 2 then
		Target:MissSkill();
	else	
		Target:AddBuff(1002, (Lv + 10), 0, 0, turn, 100);
		Target:ChangeHp(-1 * hpChange);
		Target:ChangeSp(-1 * spChange);
		Target:ChangeMHp(-1 * mhpChange);
	end
	
	battle:PushReactionActor(Target);	
	
end

