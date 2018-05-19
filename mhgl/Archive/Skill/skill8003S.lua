--火凤燎云

function skill8003CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8003Use(Atk, Target, battle, skillLv)
	
	if Target:IsBuffExist(1202) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在凝血术状态");
		do return end
	end
	if Target:IsBuffExist(2020) then
		Atk:SkillFail("\#W[战斗讯息]：选中的目标不能接收治疗,技能施展失败");
		do return end
	end
	
	local Lv = Atk:GetLevel();
	local targetlist = {};
	local maxTargetCount = 5;
	
	local bufflist = {1202, 2020, 2024, 2057, 1112, 1607};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 6);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((Lv - 20)/ 25) * 25 + 20;
	local consumeSp = 10 * ((0.8 * MSSLv + 10) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展火凤燎云", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);		
	local i = 0;
	while targetlist[i] ~= nil do
		local rec = 10 * (0.8 * Lv + 0.05 * Atk:GetPOW()/10 + 0.01 * targetlist[i]:GetMaxHP()/40);
		local Rate = 10;
		if math.random(1, 100) <= Rate then
			rec = rec * ( math.random(100, 150) / 1000 + 1)
		end
		
		if rec <= 1 then
			rec = 1;
		end
		
		local turn = 8;
		if targetlist[i]:IsBuffExist(2014) then
			turn = turn * 2;
		end
		if targetlist[i]:IsBuffExist(2047) then
			turn = turn * 4;
		end
		
		targetlist[i]:ChangeHp(rec);
		targetlist[i]:AddBuff(1202, 1, rec, 0, turn, 100);
		battle:PushReactionActor(targetlist[i]);
		
		i = i + 1;
	end
end

