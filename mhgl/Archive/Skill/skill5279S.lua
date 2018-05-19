--MOB迷乱之舞

function skill5279CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill5279Use(Atk, Target, battle, skillLv)
	
	local BwskillLv = Atk:GetLevel();
	local targetlist = {};
	--local consumeDp = 90;
	--[[if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展九转离魂", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);]]
	
	local bufflist = {1113, 1114};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 2);
	
	local i = 0;
	while targetlist[i] ~= nil do
		if math.random(1, 100) > 0 then
			local Rate = math.random(1, 2);
			local BuffTable = {
				{Buff_id = 1113,Buff_name = "米酒"},
				{Buff_id = 1114,Buff_name = "烧刀子"}};
				
			local buffevent = BuffTable[Rate].Buff_id;
			if targetlist[i]:IsPlayer() then
				targetlist[i]:AddBuff(buffevent, BwskillLv, 1, 0, 2, 100);
			else
				if math.random(1, 100) <= 50 then
					targetlist[i]:AddBuff(buffevent, BwskillLv, 1, 0, 2, 100);
				end
			end
		end		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end	
	--local rec = Atk:GetMaxHP() - Atk:GetHP();
	--Atk:AddBuff(1201, BwskillLv, rec, 0, 2, 100);	
end

