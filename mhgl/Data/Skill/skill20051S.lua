--普度众生

function skill20051CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此技能需金刚经修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此技能需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill20051Use(Atk, Target, battle, skillLv)
	
	if Target:IsBuffExist(1201) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在普度众生状态");
		do return end
	end
	if Target:IsBuffExist(2020) then
		Atk:SkillFail("\#W[战斗讯息]：选中的目标不能接收治疗,技能施展失败");
		do return end
	end
	
	local targetlist = {};
	local maxTargetCount = 1;
	
	if skillLv > 120 then
	    if Atk:HasSkill(394) then
		   maxTargetCount = 6;
		else
		   maxTargetCount = 6;
		end
	elseif maxTargetCount < 120 then
	    if Atk:HasSkill(394) then
		   maxTargetCount = 2;
		else
		   maxTargetCount = 2;
		end
	end
	local bufflist = {1201, 2020, 2024, 2057, 1112, 1607};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 6);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local MSSLv = math.floor((skillLv - 20)/ 25) * 25 + 20;
	local consumeSp = 50 * maxTargetCount;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展普度众生", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	
	local i = 0;
	while targetlist[i] ~= nil do
		local rec1 = skillLv * 3*(1+Atk:GetSkillLv(378)/100) + 7000+Atk:GetSkillLv(378)*25;
		local rec2 = skillLv * 3*(1+Atk:GetSkillLv(378)/100) + 7000+Atk:GetSkillLv(378)*25;
		local fabao = 0;
		if Atk:GetSkillLv(394) > 0 then
		   fabao = Atk:GetSkillLv(394) * 0.15
		end
		rec1 = rec1 + (rec1*fabao);
		rec2 = rec2 + (rec2*fabao);
		if rec1 <= 1 then
			rec1 = 1;
		end
		
		if rec2 <= 1 then
		rec2 = 1;
	    end
		
		local turn = 2 + math.floor((skillLv - 20) / 20); -- buff持续回合数
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
		if Atk:HasSkill(394) then -- buff持续回合数 法宝+1
		   turn = turn + 1;
		end
		if rec1 > 1000 then
		   rec1 = 980 + math.random(1,26)
		   rec2 = rec1
		end
		targetlist[i]:ChangeMHp(rec2);
	    targetlist[i]:ChangeHp(rec1);
	    targetlist[i]:AddBuff(1201, skillLv, rec1, rec2, turn, 100);
		battle:PushReactionActor(targetlist[i]);
		
		i = i + 1;
	end

end