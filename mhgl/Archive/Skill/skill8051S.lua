--紫煞手

function skill8051CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8051Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local targetlist = {};
	
	local maxTargetCount = 5;
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((Lv - 25)/ 20) * 20 + 25;
	local consumeSp = 10 * ((0.7 * MSSLv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展紫煞手", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		
		local nDam = 1;		--是CBatActor类型 
		local FinalDam = 10 * (((Atk:GetPOW()/10 - targetlist[i]:GetPOW()/10 + 1.75 * Lv) * 0.5 + (1.6 - 0.05 * count) * Lv + 260) * nDam - 250);
		if FinalDam <= 10 then
			FinalDam = math.random(1, 10);
		end		
		targetlist[i]:ChangeHp(-1 * FinalDam);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

