--五气朝元

function skill9795CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill9795Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local listIndex = 0;
	local actor = battle:GetActor(listIndex);
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local rec = 0.25 * targetlist[i]:GetMaxHP() + targetlist[i]:GetLevel() * (Atk:GetWC() / 100);
		if rec <= 1 then
			rec = 1;
		end
		if rec > targetlist[i]:GetLevel() * 18 then
			rec = targetlist[i]:GetLevel() * 18;
		end
		
		targetlist[i]:ChangeHp(rec);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end


