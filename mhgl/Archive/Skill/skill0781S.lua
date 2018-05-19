--灵犀一指

function skill0781CanUse(Atk, skillLv, reqCharLv)
	
	if Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1817) then
		Atk:SkillFail("\#W[战斗讯息]：处于绝学技能调息状态，无法继续使用四相绝学破军技能");
	end
end

function skill0781Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = 4;
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	local consumeDp = Atk:GetElementSkillCost(781);
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足%d，无法施展灵犀一指", consumeDp);
	
	if  Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		
		local randomDam = 2.25 - math.random(100, 300) / 1000;
		local per = (1000 + Atk:GetElementIngr(3) + 10 * Atk:GetElementSkillLevel(782) 
					- targetlist[i]:GetElementAnti(3)) / 1000;
		if targetlist[i]:GetElementAnti(3) < Atk:GetElementIngr(3) + 10 * Atk:GetElementSkillLevel(782) 
			- Atk:GetElementIngrDowmLimit(3) - 10 * Atk:GetElementSkillLevel(783) then
			per = (1000 + Atk:GetElementIngrDowmLimit(3) + 10 * Atk:GetElementSkillLevel(783)) / 1000;
		end
		if per < 0 then
			per = 0;
		end
		local FinalDam = (Atk:GetElementAttack(3) + 25.2 * skillLv + 30) * randomDam * per;
		
		local Rate = skillLv + 25;
		if math.random(1, 100) <= Rate then
			if not targetlist[i]:IsBuffExist(1106) then 
				targetlist[i]:AddBuff(1106, skillLv, 0, 0, 1, 100);
			end
		end 
		targetlist[i]:ChangeHp(-1 * FinalDam);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	Atk:AddBuff(1817, skillLv, 0, 0, 4, 100);
end
