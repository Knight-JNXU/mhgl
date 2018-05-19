--七绝透心针

function skill2452CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需银图秘录修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill2452Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local Hitrate = math.random(1, 100);
	local maxTargetCount = 5
	
	if Hitrate > 90 then
		maxTargetCount = 5;
	elseif Hitrate > 80 then
		maxTargetCount = 4;
	elseif Hitrate > 70 then
		maxTargetCount = 7;
	else
		maxTargetCount = 6;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = 0.7 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展七绝透心针", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
		
	local i = 0;
	while targetlist[i] ~= nil do 
		
		local FinalDam = (3.4 - 0.2 * count) * skillLv + Atk:GetSkillItemATK();
		local critrate = math.random(1, 100);
		if critrate <= 2 then
			FinalDam = 4 * FinalDam;
		elseif critrate <= 7 then
			FinalDam = 3 * FinalDam;
		end
		
		if FinalDam <= 1 then
			FinalDam = 1;
		end
		
		targetlist[i]:ChangeHp(-1 * FinalDam);
		
		local buffRate = 24;	
		if math.random(1, 100) <= buffRate then
			if targetlist[i]:IsBuffExist(1106) ==  false then
				targetlist[i]:AddBuff(1106, skillLv, 0, 0, 1, 100);
			end
		end
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

