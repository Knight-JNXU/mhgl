--惊神无量刀

function skill0671CanUse(Atk, skillLv, reqCharLv)
	
	if Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1817) then
		Atk:SkillFail("\#W[战斗讯息]：处于绝学技能调息状态，无法继续使用四相绝学破军技能");
	end
	
end

function skill0671Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 2) / 4) + 1;
	
	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	local consumeDp = Atk:GetElementSkillCost(671);
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足%d，无法施展惊神无量刀", consumeDp);
	
	if  Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		
		local randomDam = 2.25 - math.random(100, 300) / 1000;
		local per = (1000 + Atk:GetElementIngr(3) + 10 * Atk:GetElementSkillLevel(672) 
					- targetlist[i]:GetElementAnti(3)) / 1000;
		if targetlist[i]:GetElementAnti(3) < Atk:GetElementIngr(1) + 10 * Atk:GetElementSkillLevel(672) 
			- Atk:GetElementIngrDowmLimit(3) - Atk:GetElementSkillLevel(673) then
			per = (1000 + Atk:GetElementIngrDowmLimit(3) + 10 * Atk:GetElementSkillLevel(673)) / 1000;
		end
		if per < 0 then
			per = 0;
		end
		local FinalDam = 0.8 * (Atk:GetElementAttack(3) + 25.2 * skillLv + 30) * randomDam * per;
		if i == 0 then
			FinalDam = 2.5 * FinalDam;
			local Rate = skillLv + 60;
			if math.random(1, 100) <= Rate then
				local buffid = {1500, 1501, 1503, 1504, 1505, 1506, 1507, 1514, 1516, 1518, 1519, 1200, 1201, 1202, 
								1203, 1517, 1632, 1633, 1634, 1709, 1803, 1806, 1815, 3075};--对应skillid
				local j = 1;
				while buffid[j] ~= nil do
					targetlist[i]:RemoveBuff(buffid[j]);
					j = j + 1;
				end
			end
		end
		targetlist[i]:ChangeHp(-1 * FinalDam);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	Atk:AddBuff(1817, skillLv, 0, 0, 4, 100);
end
