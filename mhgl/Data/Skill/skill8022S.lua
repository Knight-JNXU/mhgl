--无形无影剑

function skill8022CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8022Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.4 * Lv +10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展无形无影剑", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);

	local buffid = {1500, 1501, 1503, 1504, 1505, 1506, 1507, 1514, 1516, 1200, 1201, 1202, 1203, 1517, 1803, 1806, 1815, 3075};--对应skillid
	--local buffcount = 13;
	local HitRate = 90;
	local i = 1;	
	local nDam = 1;		--是CBatActor类型 
	
	if HitRate > 90 then
		HitRate = 90;
	end
	
	if HitRate < 5 then
		HitRate = 5;
	end
	
	if math.random(1, 100) <= HitRate then
		i = 1;
		while buffid[i] ~= nil do
			Target:RemoveBuff(buffid[i]);
			i = i + 1;
		end
	else 
		Target:MissSkill();
	end
	
	battle:PushReactionActor(Target);
	
end


