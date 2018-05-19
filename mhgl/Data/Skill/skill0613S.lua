--BOSS萧十一郎惊虹一刀

function skill0613CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0613Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local Lv = Atk:GetLevel();
	local maxTargetCount = math.floor(Lv/30) + 1;
	
	if maxTargetCount > 4 then
		maxTargetCount = 4;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	
	local consumeSp = (0.1 * Lv + 20) * count;	

	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
	--for i = 0, targetcounter  - 1 do
		local hpChange =  Atk:GetATK() - targetlist[i]:GetDEF();
						
		if hpChange <= 10 then
			hpChange = math.random(Atk:GetLevel(), Atk:GetLevel() * 2 + 8);
		end
		
		targetlist[i]:ChangeHp(-1 * hpChange);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

