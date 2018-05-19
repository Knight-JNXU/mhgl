--顽皮的雪人AI

function buff5011Active(buff, Char, Other, Type)
	
	if Type == DO_ACTION then
		if not Char:IsBuffExist(1113) and not Char:IsBuffExist(1114) then
			local battle = Char:GetBattle();
			local actorCount = battle:GetActorCount();
			local actorList = {};
			local actorListCount = 0;
			local actorList1 = {};
			local actorListCount1 = 0;
			local actorList2 = {};
			local actorListCount2 = 0;
			local protectList = {};
			local protectListCount = 0;
			local protectList1 = {};
			local protectListCount1 = 0;
			local protectList2 = {};
			local protectListCount2 = 0;
			
			for i = 0, actorCount - 1 do
				local actor = battle:GetActor(i);
				
				--敌方Char目标选择列表
				if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget()) then
					actorList[actorListCount] = actor:GetIndex();
					actorListCount = actorListCount + 1;
				end
					
				--己方目标选择列表
				if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget()) then
					protectList[protectListCount] = actor:GetIndex();
					protectListCount = protectListCount + 1;
				end	
				
				--天佑苍生目标选择列表
				if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsDead()) then
					protectList1[protectListCount1] = actor:GetIndex();
					protectListCount1 = protectListCount1 + 1;
				end								
			end
			
			if Char:IsBuffExist(3140) and not Char:IsBuffExist(3141) then
				if protectListCount1 >= 4 then
					local R = math.random(0, protectListCount1 - 1);
					Char:InputCommand(LuaI.BATCMD_SKILL, protectList1[R], 6209, 0);
				else
					local S = math.random(0, actorListCount - 1);
					Char:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 6251, 0);
				end
			elseif Char:IsBuffExist(3140) and Char:IsBuffExist(3141) then
				Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			elseif Char:IsBuffExist(3139) and not Char:IsBuffExist(3141) then
				if actorListCount >= 0 then
					local T = math.random(0, actorListCount - 1);
					Char:InputCommand(LuaI.BATCMD_SKILL, actorList[T], 6254, 0);
				else
					Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
				end 	
			elseif Char:IsBuffExist(3139) and Char:IsBuffExist(3141) then 	
				if protectListCount1 >= 5 then
					local U = math.random(0, protectListCount1 - 1);
					Char:InputCommand(LuaI.BATCMD_SKILL, protectList1[U], 6209, 0);
				elseif protectListCount >= 0 then
					local V = math.random(0, actorListCount - 1);
					Char:InputCommand(LuaI.BATCMD_SKILL, protectList[V], 5182, 0);
				end
			else
				if actorListCount >= 0 then
					local W = math.random(0, actorListCount - 1);
					Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[W], 0, 0);
				else
					Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
				end 	
			end			
		end
	end
end
