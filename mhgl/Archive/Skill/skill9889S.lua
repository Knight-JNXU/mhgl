--风卷流云

function skill9889CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill9889Use(Atk, Target, battle, skillLv)
	local targetlist = {};	
	
	local listIndex = 0;
	local actor = battle:GetActor(listIndex);
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local hpChange = targetlist[i]:GetHP();
		targetlist[i]:ChangeHp(-1 * hpChange);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end
