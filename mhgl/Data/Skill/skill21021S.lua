--生命之泉

function skill21021CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需修仙术修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill21021Use(Atk, Target, battle, skillLv)
	
	if Target:IsBuffExist(1202) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在生命之泉状态");
		do return end
	end
	if Target:IsBuffExist(2020) then
		Atk:SkillFail("\#W[战斗讯息]：选中的目标不能接收治疗,技能施展失败");
		do return end
	end
	
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 20) / 25) + 2;
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	if Atk:GetSkillLv(394) > 0 then --法宝 +1
	   maxTargetCount = maxTargetCount + 1
	end
	local bufflist = {1202, 2020, 2024, 2057, 1112, 1607};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 6);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((skillLv - 20)/ 25) * 25 + 20;
	local consumeSp = ((0.8 * MSSLv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展生命之泉", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local skillDam = (Atk:GetSkillLv(3200) + Atk:GetSkillLv(3210) + Atk:GetSkillLv(3220) 
					+ Atk:GetSkillLv(3230) + Atk:GetSkillLv(3240)) * 0.48 + (Atk:GetSkillLv(3200) ^ 2 
					+ Atk:GetSkillLv(3210) ^ 2 + Atk:GetSkillLv(3220) ^ 2 + Atk:GetSkillLv(3230) ^ 2 
					+ Atk:GetSkillLv(3240) ^ 2 ) * 0.0016 + 20 ;
	local i = 0;
	while targetlist[i] ~= nil do
		local rec = 0.8 * skillLv + 0.1 * skillDam + 0.01 * targetlist[i]:GetMaxHP() + 0.05 * Atk:GetPOW();
		local Rate = math.floor(Atk:GetSkillLv(3250) / 15) + 10;
		if math.random(1, 100) <= Rate then
			rec = rec * ( math.random(100, 150) / 1000 + 1)
		end
		
		if rec <= 1 then
			rec = 1;
		end
		if Atk:GetSkillLv(394) > 0 then
		   rec = rec + (rec * Atk:GetSkillLv(394) * 0.05)
		end
		if Atk:GetSkillLv(394) > 10 then
		   rec = rec * 1.6
		end
		local turn = 2 + math.floor((skillLv - 20) / 20);
		if turn > 8 then
			turn = 8;
		elseif turn < 2 then
			turn = 2;
		end
		if targetlist[i]:IsBuffExist(2014) then
			turn = turn * 2;
		end
		if targetlist[i]:IsBuffExist(2047) then
			turn = turn * 4;
		end
		
		targetlist[i]:ChangeHp(rec);
		targetlist[i]:AddBuff(1202, skillLv, rec, 0, turn, 100);
		battle:PushReactionActor(targetlist[i]);
		
		i = i + 1;
	end
end

