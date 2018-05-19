--万相神功

function skill0143CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需分花拂柳修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0143Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = math.floor((skillLv - 15) / 25) + 2;
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPRDownSort, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = (0.1 * skillLv + 20) * count;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展万相神功", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local nDam = Atk:GetSkillLv(378) - targetlist[i]:GetSkillLv(379);
		local weaponDam = 0.25 * Atk:GetWeaponATK();
		local FinalDam = (Atk:GetPOW() - targetlist[i]:GetPOW() + (1.6 - 0.1 * math.floor((skillLv - 15) / 25)) * skillLv + weaponDam ) * 1.05 ^ nDam;
		--local FinalDam = (Atk:GetPOW() - targetlist[i]:GetPOW() + (1.6 - 0.1 * math.floor((skillLv - 15) / 25)) * skillLv + weaponDam + 40) * 1.05 ^ nDam;
		if FinalDam <= 10 then
			FinalDam = math.random(1, 10);
		end
		targetlist[i]:ChangeHp(-1 * FinalDam);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

