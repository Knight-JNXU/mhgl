--剑锁影缠

function skill4520CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill4520Use(Atk, Target, battle, skillLv)

	local sLv = Atk:GetLevel();
	local targetlist = {};
	local maxTargetCount = math.random(3, 10);
	local consumeSp = 0.5 * sLv + 10;
	if Target:IsParnter() then
		maxTargetCount = 1;
	elseif Target:IsMob() and not Target:IsParnter() then
		consumeSp = 1.0 * sLv + 10;
	else
		local Msg1 = string.format("\#W[战斗讯息]：剑锁影缠不能对人物角色使用");
		Atk:SkillFail(Msg1);
		do return end
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展剑锁影缠", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
			Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	local buffRate = 88;
	if Target:IsMob() and not Target:IsParnter() and math.random(1, 100) < 40 then
		i = 1;
		buffRate = 68;
	end
	while targetlist[i] ~= nil do
		local Apos = Atk:GetPosition();
		
		local HitRate = 0;
		if sLv > targetlist[i]:GetLevel() then
			HitRate = buffRate + 2 * (sLv - targetlist[i]:GetLevel()) ^ 0.5;
		else
			HitRate = buffRate + 2.2 * (sLv - targetlist[i]:GetLevel());
		end
		
		if math.random(1, 100) <= HitRate then
			targetlist[i]:AddBuff(1706, sLv, Apos, 0, 3, 100);
		else
			targetlist[i]:MissSkill();
		end
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

