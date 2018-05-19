--推宫过气

function skill0136CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需妙手回春修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0136Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local targetcounter = 0;
	
	local maxTargetCount = math.floor((skillLv - 25) / 30) + 2;
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPUpSort, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = (0.1 * skillLv + 15) * count;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展推宫过气", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
	--for i = 0, targetcounter  - 1 do
		--local rec = 4.5 * skillLv + 0.25 * Atk:GetWeaponATK() + 0.02 * targetlist[i]:GetMaxHP();
		local rec = 4.2 * skillLv + 0.25 * Atk:GetWeaponATK() + 0.02 * targetlist[i]:GetMaxHP() + 0.25 * Atk:GetPOW();
		if rec <= 0 then
			rec = 1;
		end
		targetlist[i]:ChangeHp(rec);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

