--BOSS混元掌

function skill8220CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

	
end

function skill8220Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	local Lv = Atk:GetLevel();
	local consumeSp = 0.3 *Lv + 15;
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	--local listIndex = 0;
	--local actor = battle:GetActor(listIndex);
	
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local hpChange = 1.5 * (-1.8 * Lv - 10);

		targetlist[i]:ChangeHp(hpChange);
		targetlist[i]:ChangeMHp(hpChange/2);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end
