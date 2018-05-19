--MOB迷乱之舞

function skill9895CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill9895Use(Atk, Target, battle, skillLv)
	
	local BwskillLv = Atk:GetLevel();
	local targetlist = {};
	local bufflist = {1008, 1002};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 2);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if math.random(1, 100) > 0 then
			local Rate = math.random(1, 2);
			local BuffTable = {
				{Buff_id = 1008,Buff_name = "掉血毒12%"},
				{Buff_id = 1002,Buff_name = "唐门秘毒"}};
			local buffevent = BuffTable[Rate].Buff_id;
			if targetlist[i]:IsPlayer() then
				targetlist[i]:AddBuff(buffevent, BwskillLv, 1, 0, 3, 100);
			else
				if math.random(1, 100) <= 50 then
					targetlist[i]:AddBuff(buffevent, BwskillLv, 1, 0, 3, 100);
				end
			end
		end		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end	
end

