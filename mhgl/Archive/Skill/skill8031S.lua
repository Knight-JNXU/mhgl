--小李飞刀

function skill8031CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8031Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local targetlist = {};
	local maxTargetCount = 3;
	
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
	
	local consumeSp = 10 * (0.3 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展小李飞刀", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do 
	
		local nDam = 1;
		local hpChange = 3.7 * Lv * 10;		
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

