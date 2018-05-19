--MOB气疗术

function skill5227CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

end

function skill5227Use(Atk, Target, battle, skillLv)	
	--[[local consumeHp = 1 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeHp = consumeHp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：生命不足\#G%d\#W，无法施展气疗术", consumeHp);
	
	if Atk:GetHP() < consumeHp then
		Atk:SkillFail(Msg);
		do return end
	end
	if Target:IsBuffExist(1203) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在气疗术状态");
		do return end
	end
	if Target:IsBuffExist(2020) then
		Atk:SkillFail("\#W[战斗讯息]：此目标不能接收治疗");
		do return end
	end
	
	Atk:ChangeHp(-1 * consumeHp, false);]]
	
	local Lv = Atk:GetLevel();
	local skill = Atk:GetSkillLv(5300);
	local targetlist = {};
	local maxTargetCount = 1;
	
	local RecBonus = {0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,11,12,13,14,15,16,17,18,19,20};
	local nRecBonus = 0;
	local k = 1;
	while k <= 30 do
	    local nRecskill = Atk:GetSkillLv(5430 + k - 1);
		if nRecskill == 1 then 
            nRecBonus = nRecBonus + RecBonus[k];
		end
		k = k + 1;
	end	
	
	if maxTargetCount > 3 then
		maxTargetCount = 3;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor((Lv) / 60) + 1;
	    if maxTargetCount > 3 then
		    maxTargetCount = 3;
	    elseif maxTargetCount < 1 then
		    maxTargetCount = 1;
	    end
	end
	
	local bufflist = {1203, 2020, 2024, 2057, 1112};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 5);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		
		local rec = (Lv + 10) + 0.01 * targetlist[i]:GetMaxSP() + 0.05 * Atk:GetPOW() + nRecBonus * Lv;		
		local Rate = math.floor((Lv + 10) / 15) + 10;
		
		if math.random(1, 100) <= Rate then
			rec = rec * ( math.random(100, 150) / 1000 + 1);
		end
		
		local turn = 2 + math.floor((Lv + 10 - 25) / 30);
		if turn > 5 then
			turn = 5;
		elseif turn < 2 then
			turn = 2;
		end
		if targetlist[i]:IsBuffExist(2014) then
			turn = turn * 2;
		end
		if targetlist[i]:IsBuffExist(2047) then
			turn = turn * 4;
		end
	
	--[[local skillDam = (Atk:GetSkillLv(3200) + Atk:GetSkillLv(3210) + Atk:GetSkillLv(3220) 
					+ Atk:GetSkillLv(3230) + Atk:GetSkillLv(3240)) * 0.48 + (Atk:GetSkillLv(3200) ^ 2 
					+ Atk:GetSkillLv(3210) ^ 2 + Atk:GetSkillLv(3220) ^ 2 + Atk:GetSkillLv(3230) ^ 2 
					+ Atk:GetSkillLv(3240) ^ 2 ) * 0.0016 + 20 ;]]
				
		targetlist[i]:ChangeSp(rec);
		targetlist[i]:AddBuff(1203, (Lv + 10), rec, 0, turn, 100);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end
