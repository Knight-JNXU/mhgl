--BOSS风卷流云

function skill8017CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8017Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	local Lv = Atk:GetLevel();	
	local consumeSp = 0.3 * Lv + 15;

	Atk:ChangeSp(-1 * consumeSp, false);
	
	local listIndex = 0;
	local actor = battle:GetActor(listIndex);
	
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local hpChange = -1.8 * Lv - 10;
		local spChange = -1.5 * Lv - 10;
		targetlist[i]:ChangeHp(hpChange);
		targetlist[i]:ChangeSp(spChange);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end
