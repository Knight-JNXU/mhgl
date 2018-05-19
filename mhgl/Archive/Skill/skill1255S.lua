--无极潜渊式--释放

function skill1255Use(Atk, Target, battle, skillLv)
	if Atk:HasBuff(1312) then
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
		local skillDam = (Atk:GetSkillLv(1200) + Atk:GetSkillLv(1210) + Atk:GetSkillLv(1220) 
						+ Atk:GetSkillLv(1230) + Atk:GetSkillLv(1240)) * 0.48 + (Atk:GetSkillLv(1200) ^ 2 
						+ Atk:GetSkillLv(1210) ^ 2 + Atk:GetSkillLv(1220) ^ 2 + Atk:GetSkillLv(1230) ^ 2 
						+ Atk:GetSkillLv(1240) ^ 2 ) * 0.0016 + 20 ;
		local weaponDam = Atk:GetWeaponATK();
		local FinalDam = 6.5 * (((Atk:GetPOW() - Target:GetPOW() + 0.25 * weaponDam) * 1.35 + 2.8 
								* skillLv + 0.1 * skillDam + 300)  * nDam - 250);
		if FinalDam < 1 then
			FinalDam = math.random(1, 10);
		end
		local reDam = Target:GetFinalValue(-FinalDam, Atk, Atk:GetAction(), 1);
		if -reDam < 1 then
			reDam = - 1;
		end
		if - reDam < 45 * skillLv then
			FinalDam = - 45 * skillLv * FinalDam / reDam;
		end
		
		Target:ChangeHp(-1 * FinalDam);
		battle:PushReactionActor(Target);
	else
		Atk:SkillFail("集气期间被打断，无法继续施展无极潜渊式");
		do return end
	end
end
