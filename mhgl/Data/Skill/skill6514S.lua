--Atk召唤

function skill6514CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill6514Use(Atk, Target, battle, skillLv)

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
	
	if Atk:GetMob_id() == 2943 then
		if Pactor01 == nil then
			local mob1 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob1, Lv, 1);
		end
		if Pactor02 == nil then
			local mob2 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob2, Lv, 2);
		end
		if Pactor03 == nil then
			local mob3 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob3, Lv, 3);
		end
		if Pactor04 == nil then
			local mob4 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob4, Lv, 4);
		end
		if Pactor05 == nil then
			local mob5 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob5, Lv, 5);
		end
		if Pactor06 == nil then
			local mob6 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob6, Lv, 6);	
		end
		if Pactor07 == nil then
			local mob7 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob7, Lv, 7);	
		end
		if Pactor08 == nil then
			local mob8 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob8, Lv, 8);
		end
		if Pactor09 == nil then
			local mob9 = RandTable({2957,2958,2959,2961,2962,2963})
			Atk:CallHelper(mob9, Lv, 9);	
		end
	end
	local A = math.random(1,2);
	if Atk:GetMob_id() == 5022 then
		if Pactor01 == nil then
			local mob1 = RandTable({5023, 5024, 5023, 5023, 5023})
			Atk:CallHelper(mob1, Lv, 1);
		end
		if Pactor02 == nil then
			local mob2 = RandTable({5023, 5024, 5023, 5023, 5023})
			Atk:CallHelper(mob2, Lv, 1);
		end
		if Pactor03 == nil then
			local mob3 = RandTable({5023, 5024, 5023, 5023, 5023})
			Atk:CallHelper(mob3, Lv, 1);
		end
		if Pactor04 == nil then
			local mob4 = RandTable({5023, 5024, 5023, 5023, 5023})
			Atk:CallHelper(mob4, Lv, 1);
		end
		if Pactor05 == nil then
			local mob5 = RandTable({5023, 5024, 5023, 5023, 5023})
			Atk:CallHelper(mob5, Lv, 1);
		end
		if Pactor06 == nil then
			local mob6 = RandTable({5023, 5024, 5023, 5023, 5023})
			Atk:CallHelper(mob6, Lv, 1);
		end
		if Pactor07 == nil then
			local mob7 = RandTable({5023, 5024, 5023, 5023, 5023})
			Atk:CallHelper(mob7, Lv, 1);
		end
		if Pactor08 == nil then
			local mob8 = RandTable({5023, 5024, 5023, 5023, 5023})
			Atk:CallHelper(mob8, Lv, 1);
		end
		if Pactor09 == nil then
			local mob9 = RandTable({5023, 5024, 5023, 5023, 5023})
			Atk:CallHelper(mob9, Lv, 1);
		end
  end
	battle:PushReactionActor(Target);
end

