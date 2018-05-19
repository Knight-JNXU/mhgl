--隔山打牛

function skill0024CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需五虎断魂修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);	
		do return end
	elseif Atk:IsBuffExist(36) == false then
		Atk:SkillFail("\#W[战斗讯息]：此招式需先气聚丹田后才能施展");
	end		
end

function skill0024Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	
	local maxTargetCount = math.floor((skillLv - 35) / 35) + 2
	
	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	maxTargetCount = maxTargetCount + 1
	
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = (0.1 * skillLv + 20) * count;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展隔山打牛", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local m = 1;
	local i = 0;
	while targetlist[i] ~= nil do
		if i ~= 0 then
			local nDam = Atk:GetSkillLv(378) - targetlist[i]:GetSkillLv(379);
			local weaponDam = 0.25 * Atk:GetWeaponATK();
			local hpChange = (1.8 * (Atk:GetPOW() - targetlist[i]:GetPOW()) + (3 - 0.2 * (math.floor((skillLv - 35) / 35))) * skillLv + weaponDam + 20)  * 1.05 ^ nDam;
			if hpChange <= 10 then
				hpChange = math.random(1, 10);
			end
			local result = skillCanHit(Atk, targetlist[i]);
			if result == 2 then
				targetlist[i]:MissSkill();
			else
				targetlist[i]:ChangeHp(-1 * hpChange);
			end
			battle:PushReactionActor(targetlist[i]);
			
			m = 0;
		end
		
		i = i + 1;
	end
	
	if m == 1 then
		Atk:SkillFail("\#W[战斗讯息]：对方人数不足\#G2\#W人，无法施展隔山打牛");
		do return end
	end
	
	Atk:AddBuff(75, 0, 0, 0, 1, 100);
	Atk:RemoveBuff(36);
	
end
