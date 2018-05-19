--MOB融合

function skill6253CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6253Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();		
	local targetlist = {};
	local maxTargetCount = 10;
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPUpSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:IsBuffExist(3142) then
			local rec1 = 1.1 * targetlist[i]:GetMaxHP();		
			targetlist[i]:ChangeHp(-1 * rec1);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	local protectList = {};
	local protectListCount = 0;
	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		
		--敌方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() ~= Atk:GetTeam() and actor:IsValidTarget() and actor:HasSkill(5637)) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;
		end
		
		--己方所有有效目标选择列表
		if (actor ~= nil and actor:GetTeam() == Atk:GetTeam() and actor:IsValidTarget() and actor:GetHP() ~= 0) then			
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end		
	end
		
	local team = Atk:GetTeam();
	local Pactor1 = battle:GetActorByPosition(6, team);
	local Pactor2 = battle:GetActorByPosition(7, team);
	local Pactor3 = battle:GetActorByPosition(8, team);
	local Pactor4 = battle:GetActorByPosition(9, team);
	local Pactor5 = battle:GetActorByPosition(10, team);
	local Pactor6 = battle:GetActorByPosition(11, team);
	local Pactor7 = battle:GetActorByPosition(12, team);
	local Pactor8 = battle:GetActorByPosition(13, team);
	local Pactor9 = battle:GetActorByPosition(14, team);
	
	if Pactor1 == nil then
		Atk:CallHelper(12004, Lv, 1);
	elseif Pactor2 == nil then
		Atk:CallHelper(12004, Lv, 2);
	elseif Pactor3 == nil then
		Atk:CallHelper(12004, Lv, 3);
	elseif Pactor4 == nil then
		Atk:CallHelper(12004, Lv, 4);
	elseif Pactor5 == nil then
		Atk:CallHelper(12004, Lv, 5);
	elseif Pactor6 == nil then
		Atk:CallHelper(12004, Lv, 6);	
	elseif Pactor7 == nil then
		Atk:CallHelper(12004, Lv, 7);	
	elseif Pactor8 == nil then
		Atk:CallHelper(12004, Lv, 8);
	elseif Pactor9 == nil then
		Atk:CallHelper(12004, Lv, 9);	
	else			
		do return end
	end				
end

