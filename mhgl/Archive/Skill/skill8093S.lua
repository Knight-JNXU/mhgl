--激电惊芒

function skill8093CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8093Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local targetlist = {};
	
	local maxTargetCount = 2;
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((Lv - 25)/ 25) * 25 + 25;
	local consumeSp = 10 * ((1.2 * MSSLv + 10) / maxTargetCount) * count ;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展激电惊芒", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local nDam = 1;		--是CBatActor类型 		
		local hpChange = 10 * ((Atk:GetPOW()/10 + 1.75 * Lv - 0.6 * targetlist[i]:GetPOW()/10) * 0.8 + 2.1 * Lv + 280) * nDam - 250);
		if hpChange <= 1 then
			hpChange = 1;
		end
		
		targetlist[i]:ChangeHp(-1 * hpChange);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end
