--BOSS西门吹雪变态一剑西来

function skill6212CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6212Use(Atk, Target, battle, skillLv)
	local targetlist = {};	
	
	local listIndex = 0;
	local actor = battle:GetActor(listIndex);
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local hpChange = targetlist[i]:GetHP();
		targetlist[i]:ChangeHp(-1.2 * hpChange);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

