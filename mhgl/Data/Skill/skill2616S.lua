--护体金针

function skill2616CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需霹雳咒修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill2616Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local consumeSp = 1.2 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展碎甲符", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1710) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处于碎甲符状态");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local bufflist = {1710};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 1);
	
	
	local turn = 4 + math.floor((skillLv - 40) / 30);
	
	if turn < 4 then 
		turn = 4;
	elseif turn > 6 then
		turn = 6;
	end	
	local i = 0;
	while targetlist[i] ~= nil do
		targetlist[i]:AddBuff(1710, skillLv, 0, 0, turn, 100);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end
