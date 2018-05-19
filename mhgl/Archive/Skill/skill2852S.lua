--离魂三唱

function skill2852CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需玄元要诀修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill2852Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = 2;
	
	local bufflist = {2020, 1112};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPUpSort, bufflist, 2);
	
	local consumeSp = 0.15 * Atk:GetMaxSP() + 80;
	local consumeHp = 0.1 * Atk:GetMaxHP() + 30;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
		consumeHp = consumeHp * 2;
	end
	local Msg1 = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展离魂三唱", consumeSp);
	local Msg2 = string.format("\#W[战斗讯息]：生命不足\#G%d\#W，无法施展离魂三唱", consumeHp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg1);
		do return end
	end
	if Atk:GetHP() < consumeHp then
		Atk:SkillFail(Msg2);
		do return end
	end
	
	if Target:IsBuffExist(2020) then
		Atk:SkillFail("\#W[战斗讯息]：此目标不能接收治疗");
		do return end
	end
	
	Atk:ChangeHp(-1 * consumeHp, false);
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local weaponDam = Atk:GetWeaponATK();
	local skillDam = (Atk:GetSkillLv(2800) + Atk:GetSkillLv(2810) + Atk:GetSkillLv(2820) 
					+ Atk:GetSkillLv(2830) + Atk:GetSkillLv(2840)) * 0.48 + (Atk:GetSkillLv(2800) ^ 2 
					+ Atk:GetSkillLv(2810) ^ 2 + Atk:GetSkillLv(2820) ^ 2 + Atk:GetSkillLv(2830) ^ 2 
					+ Atk:GetSkillLv(2840) ^ 2 ) * 0.0016 + 20 ;
	local i = 0;
	while targetlist[i] ~= nil do
		local rec = 10 * skillLv + 0.5 * skillDam + 0.2 * targetlist[i]:GetMaxHP() + 0.15 * (Atk:GetPOW() + weaponDam);
		local hprec = 0.2 * targetlist[i]:GetMaxHP() + 2 * rec / 3;
		
		targetlist[i]:ChangeMHp(rec);
		targetlist[i]:ChangeHp(hprec);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	if not Atk:IsBuffExist(1308) and not Atk:IsBuffExist(1309) and 
		not Atk:IsBuffExist(1310) and not Atk:IsBuffExist(1311) then 
		Atk:AddBuff(1308, skillLv, 0, 0, 2, 100);
	elseif Atk:IsBuffExist(1308) then
		Atk:AddBuff(1309, skillLv, 0, 0, 2, 100);
	elseif Atk:IsBuffExist(1309) then
		Atk:AddBuff(1310, skillLv, 0, 0, 2, 100);
	elseif Atk:IsBuffExist(1310) then
		Atk:AddBuff(1311, skillLv, 0, 0, 2, 100);
	end
end

