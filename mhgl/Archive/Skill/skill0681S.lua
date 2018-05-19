--龙行天下

function skill0681CanUse(Atk, skillLv, reqCharLv)
	
	if Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1817) then
		Atk:SkillFail("\#W[战斗讯息]：处于绝学技能调息状态，无法继续使用四相绝学破军技能");
	end
	
end

function skill0681Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 2) / 4) + 3;
	
	if maxTargetCount > 7 then
		maxTargetCount = 7;
	elseif maxTargetCount < 3 then
		maxTargetCount = 3;
	end
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	local consumeDp = Atk:GetElementSkillCost(681);
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足%d，无法施展龙行天下", consumeDp);
	
	if  Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDP(-1 * consumeDp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		
		local randomDam = 2.25 - math.random(100, 300) / 1000;
		local per = (1000 + Atk:GetElementIngr(1) + 10 * Atk:GetElementSkillLevel(682) 
					- targetlist[i]:GetElementAnti(1)) / 1000;
		if targetlist[i]:GetElementAnti(1) < Atk:GetElementIngr(1) + 10 * Atk:GetElementSkillLevel(682) 
			- Atk:GetElementIngrDowmLimit(1) - Atk:GetElementSkillLevel(683) then
			per = (1000 + Atk:GetElementIngrDowmLimit(1) + 10 * Atk:GetElementSkillLevel(683)) / 1000;
		end
		if per < 0 then
			per = 0;
		end
		local FinalDam = (Atk:GetElementAttack(1) + 25.2 * skillLv + 30) * randomDam * per;
		
		local Rate = skillLv + 65;
		if math.random(1, 100) <= Rate then
			local turn = math.floor(skillLv / 8) + 4;
			if not targetlist[i]:IsBuffExist(1005) then 
				targetlist[i]:AddBuff(1005, skillLv, 0, 0, turn, 100);
			end
		end 
		targetlist[i]:ChangeHp(-1 * FinalDam);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	Atk:AddBuff(1817, skillLv, 0, 0, 4, 100);
end
