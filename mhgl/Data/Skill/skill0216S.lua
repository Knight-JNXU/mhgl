--小李飞刀

function skill0216CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill0216Use(Atk, Target, battle, skillLv)
	local lv = Atk:GetLevel();
	local targetlist = {};
	
	local maxTargetCount = math.floor( lv / 50) + 1;
	if maxTargetCount > 3 then
		maxTargetCount = 3;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	local count = 0;
	local countDam = 1;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	
	if count == 1 then
		countDam = 1.52  ;
	elseif count == 2 then
		countDam = 1.44  ;
	elseif count == 3 then
		countDam = 1.36 ;
	else
		countDam = 1.28 ;
	end
	
	local consumeSp = 50;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足%d，无法施展夜舞倾城", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do 
	
		local nDam = 1;
		local hpChange = Atk:GetSTR() * 1.5 + Atk:GetSTR() * 0.3 + Atk:GetATK() * 0.1;		
		if hpChange <= 1 then
			hpChange = 1;
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

