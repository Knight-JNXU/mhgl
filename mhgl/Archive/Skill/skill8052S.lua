--天魔移踪术

function skill8052CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8052Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local targetlist = {};
	local maxTargetCount = 4;
	
	local bufflist = {2020, 1112};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPUpSort, bufflist, 2);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((Lv - 20)/ 25) * 25 + 20;
	local consumeSp = 10 * ((0.8 * MSSLv + 20) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展天魔移踪术", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	if Target:IsBuffExist(2020) then
		Atk:SkillFail("\#W[战斗讯息]：选中的目标不能接收治疗,技能施展失败");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local rec = 10 * ((3 - 0.1 * count) * Lv + 0.15 * Atk:GetPOW()/10 + 0.02 * targetlist[i]:GetMaxHP()/40);
		if rec <= 1 then
			rec = 1;
		end
		if rec > targetlist[i]:GetMHP() then
			rec = targetlist[i]:GetMHP();
		end
		
		targetlist[i]:ChangeHp(rec);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

