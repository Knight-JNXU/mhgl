--五丁开山

function skill0023CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需五虎断魂修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill0023Use(Atk, Target, battle, skillLv)

	local targetlist = {};
	
	local maxTargetCount = math.floor((skillLv - 10) / 20) + 2;
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, 0);

	local consumeSp = 0.1 * skillLv + 20;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展五丁开山", consumeSp);

	local i = 0;
	while targetlist[i] ~= nil do
		if  Atk:GetSP() < consumeSp * (i + 1) then
			Atk:SkillFail(Msg);
			break
		end
		
		Atk:ChangeSp(-1 * consumeSp, false);
		
		local nDam = Atk:GetSkillLv(378) - targetlist[i]:GetSkillLv(379);
		local weaponDam = 0.25 * Atk:GetWeaponATK();
		local hpChange = (Atk:GetPOW() - 0.85  * targetlist[i]:GetPOW() + 1.5 * skillLv + weaponDam + 50)* 1.05 ^ nDam;
		if hpChange <= 10 then
			hpChange = math.random(1, 10);
		end
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
		end
		
		battle:PushReactionActor(targetlist[i]);
		
		if targetlist[i]:GetHP() == 0 then
			i = i + 1;
		else
			break
		end	
	end	
end
