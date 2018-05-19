--Atk召唤白云城弟子

function skill5293CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5293Use(Atk, Target, battle, skillLv)
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
		if (actor ~= nil and actor:GetTeam() == Atk:GetTeam() and actor:IsValidTarget() and actor:GetHP() ~= 0 and not actor:IsBuffExist(3113) and not actor:IsBuffExist(2053) and not actor:HasSkill(5343)) then			
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;
		end		
	end
	
	local Lv = Atk:GetLevel();
	local team = Atk:GetTeam();
	local Pactor01 = battle:GetActorByPosition(6, team);
	local Pactor02 = battle:GetActorByPosition(7, team);
	local Pactor03 = battle:GetActorByPosition(8, team);
	local Pactor04 = battle:GetActorByPosition(9, team);
	local Pactor05 = battle:GetActorByPosition(10, team);
	local Pactor06 = battle:GetActorByPosition(11, team);
	local Pactor07 = battle:GetActorByPosition(12, team);
	local Pactor08 = battle:GetActorByPosition(13, team);
	local Pactor09 = battle:GetActorByPosition(14, team);
	local Pactor10 = battle:GetActorByPosition(15, team);
	local Pactor11 = battle:GetActorByPosition(16, team);
	local Pactor12 = battle:GetActorByPosition(17, team);
	local Pactor13 = battle:GetActorByPosition(18, team);
	local Pactor14 = battle:GetActorByPosition(19, team);
	local Pactor15 = battle:GetActorByPosition(0, team);
	local Pactor16 = battle:GetActorByPosition(1, team);
	local Pactor17 = battle:GetActorByPosition(2, team);
	local Pactor18 = battle:GetActorByPosition(3, team);
	local Pactor19 = battle:GetActorByPosition(4, team);
	
	if Atk:GetMob_id() == 30303 then
		if Pactor10 == nil then
			Atk:CallHelper(30301, Lv, 10);
		elseif Pactor11 == nil then
			Atk:CallHelper(30301, Lv, 11);
		elseif Pactor12 == nil then
			Atk:CallHelper(30301, Lv, 12);
		elseif Pactor13 == nil then
			Atk:CallHelper(30301, Lv, 13);
		elseif Pactor14 == nil then
			Atk:CallHelper(30301, Lv, 14);
		elseif Pactor15 == nil then
			Atk:CallHelper(30301, Lv, 15);	
		elseif Pactor16 == nil then
			Atk:CallHelper(30301, Lv, 16);	
		elseif Pactor17 == nil then
			Atk:CallHelper(30301, Lv, 17);
		elseif Pactor18 == nil then
			Atk:CallHelper(30301, Lv, 18);
		elseif Pactor19 == nil then
			Atk:CallHelper(30301, Lv, 19);
		else			
			do return end
		end	
	elseif Atk:GetMob_id() == 10417 then
		local summon = math.random(1, 3)
		if summon == 1 then
			Atk:CallHelper(1011, Lv, 15);	
		elseif summon == 2 then
			Atk:CallHelper(1012, Lv, 15);	
		else
			Atk:CallHelper(1013, Lv, 15);	
		end
	elseif Atk:GetMob_id() == 10323 then
		local mob = RandTable({10319, 10320, 10321, 10322})
		if Pactor01 == nil then
			Atk:CallHelper(mob, Lv, 1);
		elseif Pactor02 == nil then
			Atk:CallHelper(mob, Lv, 2);
		elseif Pactor03 == nil then
			Atk:CallHelper(mob, Lv, 3);
		elseif Pactor04 == nil then
			Atk:CallHelper(mob, Lv, 4);
		elseif Pactor05 == nil then
			Atk:CallHelper(mob, Lv, 5);
		elseif Pactor06 == nil then
			Atk:CallHelper(mob, Lv, 6);	
		elseif Pactor07 == nil then
			Atk:CallHelper(mob, Lv, 7);	
		elseif Pactor08 == nil then
			Atk:CallHelper(mob, Lv, 8);
		elseif Pactor09 == nil then
			Atk:CallHelper(mob, Lv, 9);		
		else			
			do return end
		end	
	elseif Atk:GetMob_id() == 32149 then
		local mob = 0
		local summon = math.random(1, 100)
		if summon <= 10 then
			mob = RandTable({32144, 32145, 32146})
		elseif summon <= 90 then
			mob = RandTable({32142, 32143})
		else
			mob = RandTable({32147, 32148})
		end
		if Pactor01 == nil then
			Atk:CallHelper(mob, Lv, 1);
		elseif Pactor02 == nil then
			Atk:CallHelper(mob, Lv, 2);
		elseif Pactor03 == nil then
			Atk:CallHelper(mob, Lv, 3);
		elseif Pactor04 == nil then
			Atk:CallHelper(mob, Lv, 4);
		elseif Pactor05 == nil then
			Atk:CallHelper(mob, Lv, 5);
		elseif Pactor06 == nil then
			Atk:CallHelper(mob, Lv, 6);	
		elseif Pactor07 == nil then
			Atk:CallHelper(mob, Lv, 7);	
		elseif Pactor08 == nil then
			Atk:CallHelper(mob, Lv, 8);
		elseif Pactor09 == nil then
			Atk:CallHelper(mob, Lv, 9);		
		else			
			do return end
		end	
	elseif Atk:GetMob_id() == 2943 then
		if Pactor01 == nil then
			local mob1 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob, Lv, 1);
		end
		if Pactor02 == nil then
			local mob2 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob, Lv, 2);
		end
		if Pactor03 == nil then
			local mob3 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob, Lv, 3);
		end
		if Pactor04 == nil then
			local mob4 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob, Lv, 4);
		end
		if Pactor05 == nil then
			local mob5 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob, Lv, 5);
		end
		if Pactor06 == nil then
			local mob6 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob, Lv, 6);	
		end
		if Pactor07 == nil then
			local mob7 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob, Lv, 7);	
		end
		if Pactor08 == nil then
			local mob8 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob, Lv, 8);
		end
		if Pactor09 == nil then
			local mob9 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob, Lv, 9);	
		end
	end
	
	battle:PushReactionActor(Target);
	
	if Atk:GetMob_id() == 10417 then
		Atk:AddBuff(1305, Lv, 0, 0, 6, 100);
	end
end

