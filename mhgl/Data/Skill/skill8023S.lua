--醉迷花留香

function skill8023CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8023Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	local Lv = Atk:GetLevel();
	--Sp=0.3 * 技能等级 +10
	local consumeSp = 10 * (0.7 * Lv +10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展醉迷花留香", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	--local skillid = {2041,2411,3031};
	local buffid = {1000,1001,1002,1003,1004,1005,1006,3098,3099};--对应skillid
	local rate = {0, 0, 0, 0, 0, 0, 0, 0};
	local hitRate = 0;
	local rateMax = 0;
	
	local j = 0;
	while targetlist[j] ~= nil do
		
		
		local i = 1;
		while buffid[i] ~= nil do
			if targetlist[j]:IsBuffExist(buffid[i]) then
				local buff = targetlist[j]:FindBuff(buffid[i]);
				rate[i] = buff:GetBuffCoolDown();
				if rate[i] > rateMax then
					rateMax = rate[i];
				end
			end
			i = i + 1;
		end
		
		if rateMax > 0 then
			i= 1;
			while buffid[i] ~= nil do
				targetlist[j]:RemoveBuff(buffid[i]);
				targetlist[j]:AddBuff(1640, 1, 0, 0, 2, 100);
				i = i + 1;
			end			
		end
		
		battle:PushReactionActor(targetlist[j]);
		j = j + 1;
	end
end


