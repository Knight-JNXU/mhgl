--以身入灭

function skill4552CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4552Use(Atk, Target, battle, skillLv)
	
	local sLv = Atk:GetLevel();
	local targetlist = {};
	local maxTargetCount = math.floor( math.random(15, 35) / 10);
	if sLv > 29 then
		maxTargetCount = maxTargetCount + 1;
	end
	if sLv > 59 then
		maxTargetCount = maxTargetCount + 1;
	end
	if math.random(1, 100) < 40 then
		maxTargetCount = maxTargetCount + 1;
		local iflag = 1;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	local consumeSp = 0.2 * Atk:GetMaxSP();
	local consumeHp = 0.1 * Atk:GetHP();
	if consumeSp < 10 then
		consumeSp = math.random(9, 11);
	end
	if consumeHp < 10 then
		consumeHp = math.random(9, 11);
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展以身入灭",consumeSp);
	local Msg1 = string.format("\#W[战斗讯息]：生命不足\#G%d\#W，无法施展以身入灭",consumeHp);
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	if  Atk:GetHP() < consumeHp then
		Atk:SkillFail(Msg1);
		do return end
	end
	Atk:ChangeSp(-1 * consumeSp, false);
	Atk:ChangeHp(-1 * consumeHp, false);
	
	local i = 0;
	if iflag == 1 then
		i = 1;
	end
	while targetlist[i] ~= nil do
		
		local FinalDam = 2.4 * sLv + 0.1 * targetlist[i]:GetHP();
		
		if FinalDam < sLv * 2 then
			FinalDam = sLv * 2 + math.random(1, 10);
		end
		if FinalDam > sLv * 8 then
			FinalDam = sLv * 8 + math.random(1, 10);
		end
		
		targetlist[i]:ChangeHp(-1 * FinalDam);
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

