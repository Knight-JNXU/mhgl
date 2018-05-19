--天蚕教使者及其喽啰偏向于攻击平民

function buff3111Active(buff, Char, Other, Type) 
	
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
		local protectList2 = {};
		local protectListCount2 = 0;
		
		local AtkRate = 75;
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
			
			--敌方平民目标优先选择列表
			if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget() and actor:IsMob() and not actor:IsParnter()) then
				actorList1[actorListCount1] = actor:GetIndex();
				actorListCount1 = actorListCount1 + 1;
			end
			
			--己方所有有效目标选择列表
			if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget()) then
				protectList[protectListCount] = actor:GetIndex();
				protectListCount = protectListCount + 1;
			end									
		end
		
		local Rate = math.random(1, 100);
		if actorListCount1 > 0 then
			local R = math.random(0, actorListCount1 - 1);
			local S = math.random(0, actorListCount - 1);
			if Rate <= AtkRate then
				if Char:HasSkill(5300) then
					if math.random(1, 100) <= 90 then
						Char:InputCommand(LuaI.BATCMD_ATTACK, actorList1[R], 0, 0);
					else
						Char:InputCommand(LuaI.BATCMD_ATTACK, actorListList[S], 0, 0);
					end
				else
					if math.random(1, 100) <= 25 then
						Char:InputCommand(LuaI.BATCMD_ATTACK, actorList1[R], 0, 0);
					else
						Char:InputCommand(LuaI.BATCMD_ATTACK, actorListList[S], 0, 0);
					end
				end
			elseif Rate > AtkRate and Rate <= SkillRate then				
				local T = math.random(0, actorListCount1 - 1);
				local U = math.random(0, actorListCount - 1); 
				local randomSkill = Char:GetRandomSkill();	
				if randomSkill ~= 0 then
					if Char:HasSkill(5300) then
						if math.random(1, 100) <= 90 then
							Char:InputCommand(LuaI.BATCMD_SKILL, actorList1[T], randomSkill, 0);
						else
							Char:InputCommand(LuaI.BATCMD_SKILL, actorList[U], randomSkill, 0);
						end
					else
						if math.random(1, 100) <= 25 then
							Char:InputCommand(LuaI.BATCMD_SKILL, actorList1[T], randomSkill, 0);
						else
							Char:InputCommand(LuaI.BATCMD_SKILL, actorList[U], randomSkill, 0);
						end
					end
				else
					if Char:HasSkill(5300) then
						if math.random(1, 100) <= 90 then
							Char:InputCommand(LuaI.BATCMD_ATTACK, actorList1[T], 0, 0);
						else
							Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[U], 0, 0);
						end
					else
						if math.random(1, 100) <= 25 then
							Char:InputCommand(LuaI.BATCMD_ATTACK, actorList1[T], 0, 0);
						else
							Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[U], 0, 0);
						end
					end
				end
			else
				Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			end 
		elseif actorListCount > 0 then
			local V = math.random(0, actorListCount - 1);
			if Rate <= AtkRate then
				Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[V], 0, 0);
			elseif Rate > AtkRate and Rate <= SkillRate then	
				local randomSkill = Char:GetRandomSkill();	
				if randomSkill ~= 0 then
					Char:InputCommand(LuaI.BATCMD_SKILL, actorList[V], randomSkill, 0);
				else
					Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[V], 0, 0);
				end
			else
				Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			end 
		else
			Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);		
		end 
	end
end
