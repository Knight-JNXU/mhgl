---封测活动BOSS 万马奔腾 

function skill8303CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8303Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local Lv = Atk:GetLevel();
	local maxTargetCount = math.floor((Lv - 25) / 25) + 2;
	
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
	local consumeSp = (0.1 * Lv + 20) * count;	
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
		local hpChange = (Atk:GetPOW() - targetlist[i]:GetPOW() + 
						(2.5 - 0.3 * math.floor((Lv - 25) / 25)) * Lv + 8.0 * Lv )  * 1.05 ^ nDam;
		if hpChange <= 10 then
			hpChange = math.random(1, 10);
		end
		
		targetlist[i]:ChangeHp(-1 * hpChange);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

