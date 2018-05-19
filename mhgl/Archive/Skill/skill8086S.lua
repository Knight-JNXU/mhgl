--BOSS碧水清茗

function skill8086CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8086Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();		
	local consumeSp = 0.5 * Lv + 5;
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local rec = 0;
	
	if Target:GetCclass() == Atk:GetCclass() and
		Target:GetFaction() == Atk:GetFaction() then
		rec = 5.2 * Lv + 0.02 * Target:GetMaxHP();
		if rec <= 1 then
			rec = 1;
		end
	else
		if Target:IsBuffExist(11) then
			Atk:SkillFail("\#W[战斗讯息]：非唐门医师无法连续\#G2\#W回合吸收碧水清茗");
			
		else
			rec = 5.2 * Lv  + 0.02 * Target:GetMaxHP();
			if rec <= 1 then
				rec = 1;
			end
			Target:AddBuff(11, 0, 0, 0, 1, 100);
		end
	end
	
	Target:ChangeHp(rec);
	battle:PushReactionActor(Target);
	
end

