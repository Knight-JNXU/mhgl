--MOB燕南天-嫁衣神功

function skill6229CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6229Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local targetlist = {};
	--local maxTargetCount = math.floor((Lv + 10 - 25) / 25) + 2;
	local maxTargetCount = 1;
	
	--[[if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor((Lv + 10 - 25) / 25) + 3;
	    if maxTargetCount > 6 then
		    maxTargetCount = 6;
	    elseif maxTargetCount < 3 then
		    maxTargetCount = 3;
	    end
	end]]
	
	if not Atk:IsBuffExist(1517) then
		Atk:SkillFail("\#W[战斗讯息]：生命不足\#G50\%\#W，无法施展风雷七星斩");
		do return end
	end
	
	local bufflist = {1517};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, ATKDownSort, bufflist, 1);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		local turn = 150;		
		local effectAtk = targetlist[i]:GetATK() * 1500 / 1000;		
		if effectAtk <= 1 then
			effectAtk = 1;
		end
		
		targetlist[i]:AddBuff(1517, (Lv + 10), effectAtk, 0, turn, 100);		
		targetlist[i]:ChangeHp(targetlist[i]:GetMaxHP(), false);
		--targetlist[i]:AddBuff(3080, (Lv + 10), 0, 0, turn, 100);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
	Atk:RemoveBuff(1517);
end

