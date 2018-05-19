--爆裂蛊

function skill0174CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需蛊术修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0174Use(Atk, Target, battle, skillLv)
	local targetlist = {};	
	
	local maxTargetCount = 0;
	if Target:IsPlayer() or Target:IsParnter() then
		maxTargetCount = math.floor((skillLv - 10) / 30) + 1;
		if maxTargetCount > 3 then
			maxTargetCount = 3;
		elseif maxTargetCount < 1 then
			maxTargetCount = 1;
		end
	else
		maxTargetCount = math.floor((skillLv - 10) / 30) + 2;
		if maxTargetCount > 5 then
			maxTargetCount = 5;
		elseif maxTargetCount < 2 then
			maxTargetCount = 2;
		end
	end
	
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPRDownSort, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = (0.2 * skillLv + 15) * count;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展爆裂蛊", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local nDam = Atk:GetSkillLv(378) - targetlist[i]:GetSkillLv(379);
		local weaponDam = 0.25 * Atk:GetWeaponATK();
		local FinalDam = (Atk:GetPOW() - targetlist[i]:GetPOW() + (1.4 - 0.1 * maxTargetCount) * skillLv + weaponDam ) * 1.05 ^ nDam;
		--local FinalDam = (Atk:GetPOW() - targetlist[i]:GetPOW() + (1.4 - 0.1 * maxTargetCount) * skillLv + weaponDam + 45) * 1.05 ^ nDam;
		if FinalDam <= 10 then
			FinalDam = math.random(1, 10);
		end
		
		targetlist[i]:ChangeHp(-1 * FinalDam);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

