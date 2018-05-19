--剑锁影缠·改

function skill6200CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill6200Use(Atk, Target, battle, skillLv)

	local sLv = Atk:GetLevel();
	local targetlist = {};
	local maxTargetCount = 10;
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);	
	
	--[[local consumeSp = 1.0 * sLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展剑锁影缠", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
			Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);]]
	
	local i = 0;
	--[[if math.random(1, 100) < 40 then
		i = 1;
	end]]
	while targetlist[i] ~= nil do
		local Apos = Atk:GetPosition();
		local r = math.random(1, 100)
		if r <= 70 then
			--if targetlist[i]:IsMob() then
				if targetlist[i]:IsBuffExist(1706) then
					targetlist[i]:RemoveBuff(1706);
				end
				targetlist[i]:AddBuff(1706, sLv, Apos, 0, 3, 100);
			--end
			battle:PushReactionActor(targetlist[i]);
		end
		i = i + 1;
	end
end

