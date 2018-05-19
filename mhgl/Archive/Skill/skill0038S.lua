--金龙戏珠

function skill0038CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需天元掌法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill0038Use(Atk, Target, battle, skillLv)
	local targetlist = {};
	
	local maxTargetCount = math.floor((skillLv - 30 )/ 25) + 2;
	
	if maxTargetCount > 4 then
		maxTargetCount = 4;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	if Target:IsPlayer() or
		Target:IsParnter() then
		maxTargetCount = 1;
	end
	
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = (0.1 * skillLv + 20) * count;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展金龙戏珠", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local NormalDam = 0;
	--local ElementDam = 0;
	
	local i = 0;
	while targetlist[i] ~= nil do
		NormalDam = (5.2 - 0.3 * count) * skillLv + 0.25 * Atk:GetWeaponATK()  + 30;
			
		if targetlist[i]:IsPlayer() or targetlist[i]:IsParnter() then
			NormalDam =  skillLv + 0.25 * Atk:GetWeaponATK() +  (Atk:GetPOW()-Target:GetPOW()) + 20;

		

			if Atk:IsBuffExist(55) then
			NormalDam = NormalDam * 1.1;

			end
		
			local turn = 3 + math.floor((skillLv - Target:GetLevel()) / 5);
	
			if turn < 1 then
				turn = 0;
			elseif turn > 5 then
				turn = 5;
			end
	
			local AtkEffect = (1 - 0.15 * skillLv / 100) * Target:GetATK();
		
			Target:AddBuff(45, skillLv, AtkEffect, 0, turn, 100);
		end	
			local result = skillCanHit(Atk, targetlist[i]);
			if result == 2 then
				targetlist[i]:MissSkill();
			else
				targetlist[i]:ChangeHp(-1 * NormalDam);
			end
			battle:PushReactionActor(targetlist[i]);
			i = i + 1;
	end	
end
