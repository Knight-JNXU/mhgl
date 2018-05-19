--一剑西来

function skill8011CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8011Use(Atk, Target, battle, skillLv)
	
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
	local consumeSp = 0 * ((1.5 * MSSLv + 0) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展一剑西来",consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		
		local nDam = 1;		--是CBatActor类型 
		local hpChange = 10 * ((Atk:GetPOW()/10 - targetlist[i]:GetPOW()/10 + (2.1 - 0.1 * count) * Lv + 1.85 * Lv + 270)  * nDam - 250);		
		
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

