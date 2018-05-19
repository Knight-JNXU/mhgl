--三阳玄针

function skill22041CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需武神显圣修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill22041Use(Atk, Target, battle, skillLv)
	
	if Target:IsBuffExist(1505) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在碎星诀状态");
		do return end
	end
	
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 25) / 25) + 2;
	
	if maxTargetCount > 1 then
		maxTargetCount = 1;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	
	local bufflist = {1491, 2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, ATKDownSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((skillLv - 25)/ 25) * 25 + 25;
	local consumeSp = ((0.5 * MSSLv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展碎星诀", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	

	
if Target:IsBuffExist(2043) then
		Target:RemoveBuff(2043);
	elseif Target:IsBuffExist(2043) then
		Target:RemoveBuff(2043);
		Target:AddBuff(1491, skillLv, 0, 0, 6, 100);
	else
		Target:AddBuff(1191, skillLv, 0, 0, 6, 100);
	end
	battle:PushReactionActor(Target);
end


