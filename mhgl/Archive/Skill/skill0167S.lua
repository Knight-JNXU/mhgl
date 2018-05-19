--血灵丹

function skill0167CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需圣医秘籍修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0167Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = math.floor((skillLv - 15) / 30) + 2;
	
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
	
	local consumeSp = (0.1 * skillLv + 20) * count;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施放血灵丹", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
	--for i = 0, targetcounter  - 1 do
		--local rec = (1.5 - 0.25 * math.floor((skillLv - 15) / 30)) * skillLv + 0.2 * Atk:GetWeaponATK() + 0.01 * targetlist[i]:GetMaxHP();
		local rec = 2 * skillLv + 0.2 * Atk:GetWeaponATK() + 0.01 * targetlist[i]:GetMaxHP() + 0.2 * Atk:GetPOW();
		if rec <= 1 then
			rec = 1;
		end
		
		local turn = 2 + math.floor((skillLv - 30) / 60);
		if turn > 4 then
			turn = 4;
		elseif turn < 2 then
			turn = 2;
		end
		
		targetlist[i]:ChangeHp(rec);
		battle:PushReactionActor(targetlist[i]);
		targetlist[i]:AddBuff(43, rec, 0, 0, turn, 100);
		
		i = i + 1;
	end
end

