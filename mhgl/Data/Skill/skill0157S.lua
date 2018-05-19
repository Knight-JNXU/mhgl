--碧水清茗

function skill0157CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需百毒归元修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0157Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.5 * skillLv + 5;
	
	local Msg1 = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展此招式", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg1);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local rec = 0;
	
	if Target:GetCclass() == Atk:GetCclass() and
		Target:GetFaction() == Atk:GetFaction() then
		--rec = 5.2 * skillLv + 0.25 * Atk:GetWeaponATK() + 0.02 * Target:GetMaxHP();
		rec = 4.2 * skillLv + 0.25 * Atk:GetWeaponATK() + 0.02 * Target:GetMaxHP() + 0.25 * Atk:GetPOW();
		if rec <= 1 then
			rec = 1;
		end
	else
		if Target:IsBuffExist(11) then
			Atk:SkillFail("\#W[战斗讯息]：非唐门医师无法连续\#G2\#W回合吸收碧水清茗");
			
		else
			--rec = 5.2 * skillLv + 0.2 * Atk:GetWeaponATK() + 0.02 * Target:GetMaxHP();
			rec = 4.2 * skillLv + 0.2 * Atk:GetWeaponATK() + 0.02 * Target:GetMaxHP() + 0.2 * Atk:GetPOW();
			if rec <= 1 then
				rec = 1;
			end
			Target:AddBuff(11, 0, 0, 0, 1, 100);
		end
	end
	
	Target:ChangeHp(rec);
	battle:PushReactionActor(Target);
	
end

