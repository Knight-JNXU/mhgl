--屠戮

function buff3112Active(buff, Char, Other, Type) 
	
	if Type == DO_ACTION then
		local battle = Char:GetBattle();
		local actorCount = battle:GetActorCount();
		local actorList = {};
		local actorListCount = 0;
		local protectList = {};
		local protectListCount = 0;
		local actorList1 = {};
		local actorListCount1 = 0;
		local actorList2 = {};
		local actorListCount2 = 0;
		local protectList1 = {};
		local protectListCount1 = 0;
		
		local atkActor = -1;
		local protectActor = -1;
		
		local AtkRate = 25;
		local SkillRate = 100;
		local DefRate = 100;
		local ProtectRate = 100;
		local ExcapeRate = 100;

		for i = 0, actorCount - 1 do
			local actor = battle:GetActor(i);
			
			--敌方所有有效目标选择列表
			if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget()) then
				actorList[actorListCount] = actor:GetIndex();
				actorListCount = actorListCount + 1;
			end
			
			--己方所有有效目标选择列表
			if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget()) then
				protectList[protectListCount] = actor:GetIndex();
				protectListCount = protectListCount + 1;
			end				
			
			--屠戮友军目标选择列表
			if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget() and actor:IsBuffExist(3106)) then
				protectList1[protectListCount1] = actor:GetIndex();
				protectListCount1 = protectListCount1 + 1;
			end
		end
		
		if Char:IsMob() then		
			if Char:GetMob_id() == 30722 then
				if Char:IsBuffExist(3107) then
					if actorListCount > 0 then
						local R = math.random(0, actorListCount - 1);
						Char:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 6218, 0);
					else
						Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
					end
				else
					if protectListCount1 > 0 then
						local S = math.random(0, protectListCount1 - 1);
						Char:InputCommand(LuaI.BATCMD_SKILL, protectList1[S], 6217, 0);
					elseif actorListCount > 0 then
						local T = math.random(0, actorListCount - 1);
						Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);
					else
						Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
					end 
				end	
			else					
				if Char:IsBuffExist(3107) then
					if actorListCount > 0 then
						local R = math.random(0, actorListCount - 1);
						Char:InputCommand(LuaI.BATCMD_SKILL, actorList[R], 5290, 0);
					else
						Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
					end
				else
					if protectListCount1 > 0 then
						local S = math.random(0, protectListCount1 - 1);
						Char:InputCommand(LuaI.BATCMD_SKILL, protectList1[S], 5289, 0);
					elseif actorListCount > 0 then
						local T = math.random(0, actorListCount - 1);
						Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);
					else
						Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
					end 
				end	
			end
		end
	end
end
