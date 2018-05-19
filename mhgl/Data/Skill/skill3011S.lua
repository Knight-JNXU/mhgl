--残雪飘飞

function skill3011CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需冰玄神功修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill3011Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};	
	
	local maxTargetCount = 0;
	maxTargetCount = math.floor((skillLv - 25) / 25) + 2;
	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = 0.4 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展残雪飘飞", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local weaponDam = 0.25 * Atk:GetWeaponATK();
		local FinalDam = (3.4 - 0.1 * count) * skillLv + weaponDam; 
		if FinalDam <= 10 then
			FinalDam = math.random(1, 10);
		end
		local SSFinalDam = 0.25 * FinalDam;
		targetlist[i]:ChangeHp(-1 * FinalDam);
		targetlist[i]:ChangeMHp(-1 * SSFinalDam);
		
		local duRate = math.floor (Atk:GetSkillLv(3050) / 5) + 25;
		if math.random(1, 100) < duRate then
			targetlist[i]:AddBuff(1001, skillLv, 0, 0, 3, 100);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

