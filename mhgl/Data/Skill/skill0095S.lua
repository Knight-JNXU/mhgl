--乱披风

function skill0095CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需微风凌波修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill0095Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = 1;
	
	local HitRate = 60 + 2 * (skillLv - Target:GetLevel()) + 1.5 * (Atk:GetSkillLv(376) - Target:GetSkillLv(377));
	if HitRate < 10 then
		HitRate = 10;		
	elseif HitRate > 85 then
		HitRate = 85;
	end
	
	if math.random(1, 100) > HitRate then
		maxTargetCount = 1;
	else
		maxTargetCount = math.floor(skillLv / 35) + 1;
		if maxTargetCount > 4 then
			maxTargetCount = 4;
		elseif maxTargetCount < 2 then
			maxTargetCount = 2;
		end
	end
	
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = (0.2 * skillLv + 5) * count;
	local consumeHp = Atk:GetHP() * (math.random(3, 5) / 100);
	
	if consumeHp <= 1 then
		consumeHp = 1;
	end
	
	local Msg1 = string.format("\#W[战斗讯息]：生命不足\#G%d\#W，无法施展乱披风", consumeHp);
	local Msg2 = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展乱披风", consumeSp);
	
	if Atk:GetHP() < consumeHp then
		Atk:SkillFail(Msg1);
	elseif Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg2);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	Atk:ChangeHp(-1 * consumeHp, false);

	local i = 0;
	while targetlist[i] ~= nil do
		local hpChange = (3.7 - 0.2 * maxTargetCount) * skillLv + 40;
		targetlist[i]:ChangeHp(-1 * hpChange);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

