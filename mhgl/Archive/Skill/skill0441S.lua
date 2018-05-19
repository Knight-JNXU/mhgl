--飞砂手

function skill0441CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0441Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = 2;
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelHor, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local Lv = Atk:GetLevel();
	local consumeSp = 0.5 * Lv + 1;
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展飞砂手", consumeSp);	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
	--for i = 0, targetcounter  - 1 do
		local hpChange = 120 - 20 * count;
		if hpChange <= 1 then
			hpChange = 1;
		end
		
		local Rate = 0;
		if Atk:GetLevel() <= 20 then
			Rate = 85;
		else
			Rate = 85 - 2.8 * (Atk:GetLevel() - 20) ^ 2;
		end
		
		if math.random(1, 100) <= Rate then
			targetlist[i]:ChangeHp(-1 * hpChange);	
        else 
            targetlist[i]:ChangeHp(-1 * hpChange / 2);		
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

