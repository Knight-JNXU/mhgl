--横扫千军

function skill23032CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需巫咒修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill23032Use(Atk, Target, battle, skillLv)
	
	local consumeHp = 0.2 * Atk:GetHP() * math.random(9, 13) / 10;
	
	if consumeHp <= 1 then
		consumeHp = 1;
	end
	
	local reqHp = Atk:GetMaxHP() * 0.25;
	if Atk:GetHP() < reqHp then
		Atk:SkillFail("\#W[战斗讯息]：生命不足\#G25\%\#W，无法施展血雨");
		do return end
	end
	if Atk:GetHP() ~= 1 then
		Atk:ChangeHp(-1 * consumeHp, false);
	end
	
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
						wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
					end
				end
			end
		end
	else
		wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ Target:GetSkillLv(377);
	end
	
	local hpChange = 0.2 * Atk:GetMaxHP() * math.random(12, 14) / 10;
	if Target:IsMob() or Target:IsBoss() then
	   hpChange = hpChange * 1.2
	end
	if Atk:GetSkillLv(394) > 0 then
	   hpChange = hpChange + (hpChange * Atk:GetSkillLv(394) * 0.01)
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
	battle:PushReactionActor(Target);
	Atk:AddBuff(802, skillLv, 0, 0, 1, 100);
end

