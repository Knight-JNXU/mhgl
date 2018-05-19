--日月乾坤

function skill21053CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需乾坤袖修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill21053Use(Atk, Target, battle, skillLv)

	if Target:IsBuffExist(1607) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在乾坤妙法状态");
		do return end
	end
	
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 10) / 100) + 1;
	
	if maxTargetCount > 1 then
		maxTargetCount = 1;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	local bufflist = {1607, 1607, 1607};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, ATKDownSort, bufflist, 3);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((skillLv - 10)/ 100) + 1;
	local consumeSp = ((1.2 * MSSLv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展乾坤妙法", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 1 + math.floor((skillLv - 30) / 30);
	
	if turn < 2 then 
		turn = 2;
	elseif turn > 3 then
		turn = 3;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		
		local effectAtk = targetlist[i]:GetATK() * 1000 / 1000;
		if effectAtk <= 1 then
			effectAtk = 1;
		end
		if targetlist[i]:IsBuffExist(2014) then
			turn = turn * 1;
		end
		if targetlist[i]:IsBuffExist(2047) then
			turn = turn * 2;
		end
		
		targetlist[i]:AddBuff(1607, skillLv, effectAtk, 0, turn, 100);
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	if not Atk:IsBuffExist(0) and not Atk:IsBuffExist(0) and 
		not Atk:IsBuffExist(0) and not Atk:IsBuffExist(0) then 
		Atk:AddBuff(0, skillLv, 0, 0, 0, 100);
	elseif Atk:IsBuffExist(0) then
		Atk:AddBuff(0, skillLv, 0, 0, 0, 100);
	elseif Atk:IsBuffExist(0) then
		Atk:AddBuff(0, skillLv, 0, 0, 0, 100);
	elseif Atk:IsBuffExist(0) then
		Atk:AddBuff(0, skillLv, 0, 0, 0, 100);
	end
end
