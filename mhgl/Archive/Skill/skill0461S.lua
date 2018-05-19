--金针术

function skill0461CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0461Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = 2;	

	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local Lv = Atk:GetLevel();
	local consumeSp = 0.5 * Lv + 1;
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展金针术",consumeSp);	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
	--for i = 0, targetcounter  - 1 do
		
		local hpChange = Atk:GetPOW() - targetlist[i]:GetPOW() + 30;
		if hpChange <= 1 then
			hpChange = 1;
		elseif hpChange > 120 then
			hpChange = math.random(110, 130);
		end
		
		--if hpChange > targetlist[i]:GetHP() then
		--	hpChange = targetlist[i]:GetHP();
		--end
		
		targetlist[i]:ChangeHp(-1 * hpChange);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

