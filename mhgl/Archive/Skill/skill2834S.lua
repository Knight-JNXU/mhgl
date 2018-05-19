--万息回元术

function skill2834CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需青莲秘籍修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill2834Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 25) / 25) + 2;
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	local bufflist = {2020, 1112};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPUpSort, bufflist, 2);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((skillLv - 25)/ 25) * 25 + 25;
	local consumeSp = ((0.8 * MSSLv + 20) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展万息回元术", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	if Target:IsBuffExist(2020) then
		Atk:SkillFail("\#W[战斗讯息]：选中的目标不能接收治疗,技能施展失败");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local skillDam = (Atk:GetSkillLv(2800) + Atk:GetSkillLv(2810) + Atk:GetSkillLv(2820) 
					+ Atk:GetSkillLv(2830) + Atk:GetSkillLv(2840)) * 0.48 + (Atk:GetSkillLv(2800) ^ 2 
					+ Atk:GetSkillLv(2810) ^ 2 + Atk:GetSkillLv(2820) ^ 2 + Atk:GetSkillLv(2830) ^ 2 
					+ Atk:GetSkillLv(2840) ^ 2 ) * 0.0016 + 20 ;
	local i = 0;
	while targetlist[i] ~= nil do
		local rec1 = (3 - 0.1 * count) * skillLv + 0.5 * skillDam + 
					0.1 * targetlist[i]:GetMaxHP() + 0.15 * (Atk:GetPOW() + Atk:GetWeaponATK());
		local rec2 = (1.3 - 0.05 * count) * skillLv + 0.5 * skillDam + 0.1 * Atk:GetPOW();
		rec1 = rec1 / 3;
		if rec1 <= 1 then
			rec1 = 1;
		end
		if rec1 > targetlist[i]:GetMHP() then
			rec1 = targetlist[i]:GetMHP();
		end
		
		if rec2 <= 1 then
			rec2 = 1;
		end
		if rec2 > targetlist[i]:GetMaxHP() then
			rec2 = targetlist[i]:GetMaxHP();
		end
		
		targetlist[i]:ChangeMHp(rec2);
		targetlist[i]:ChangeHp(rec1);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

