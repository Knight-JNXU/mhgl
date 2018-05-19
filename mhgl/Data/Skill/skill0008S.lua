--万马奔腾

function skill0008CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需武家秘法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
	
end

function skill0008Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = math.floor((skillLv - 25) / 25) + 2;
	
	if maxTargetCount > 7 then
		maxTargetCount = 7;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end

	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	
	local consumeSp = (0.1 * skillLv + 20) * count;	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展万马奔腾",consumeSp);	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
	--for i = 0, targetcounter  - 1 do
		local nDam = Atk:GetSkillLv(378) - targetlist[i]:GetSkillLv(379);
		local weaponDam = 0.25 * Atk:GetWeaponATK();
		local hpChange = (Atk:GetPOW() - targetlist[i]:GetPOW() + 
						(2.5 - 0.2 * math.floor((skillLv - 25) / 25)) * skillLv + weaponDam + 20) * 1.05 ^ nDam;
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
		i = i + 1;
	end
end

