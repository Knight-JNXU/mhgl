--白云城叶孤城（假）AI

function buff5010Active(buff, Char, Other, Type)
	
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
					
				--敌方是否有隐身单位判定
				if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget() and (actor:IsBuffExist(1700) or
					actor:IsBuffExist(1701) or actor:IsBuffExist(2005) or actor:IsBuffExist(2038))) then
					actorList1[actorListCount1] = actor:GetIndex();
					actorListCount1 = actorListCount1 + 1;
				end
					
				--己方目标选择列表
				if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget()) then
					protectList[protectListCount] = actor:GetIndex();
					protectListCount = protectListCount + 1;
				end	
				
				--云寂术目标选择列表
				if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget()) then
					protectList1[protectListCount1] = actor:GetIndex();
					protectListCount1 = protectListCount1 + 1;
				end	
				
				--达摩圣意目标选择列表
				if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget() and actor:IsBuffExist(3113) and (actor:IsBuffExist(1100) or actor:IsBuffExist(1101) or actor:IsBuffExist(1102) 
					or actor:IsBuffExist(1103) or actor:IsBuffExist(1104) or actor:IsBuffExist(1105) or actor:IsBuffExist(1106) or actor:IsBuffExist(1107) or actor:IsBuffExist(1108) 
					or actor:IsBuffExist(1109) or actor:IsBuffExist(1110) or actor:IsBuffExist(1111) or actor:IsBuffExist(1112) or actor:IsBuffExist(1113) or actor:IsBuffExist(1114)
					or actor:IsBuffExist(1115) or actor:IsBuffExist(1116))) then
					protectList2[protectListCount2] = actor:GetIndex();
					protectListCount2 = protectListCount2 + 1;
				end
			end
			
			if Char:IsBuffExist(4000) or battle:GetCurTurn() <= 3 then
				Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);										
			elseif protectListCount2 >= 3 then
				local S = math.random(0, protectListCount2 - 1);
				Char:InputCommand(LuaI.BATCMD_SKILL, protectList2[S], 5280, 0);								
			elseif actorListCount1 > 0 then
				if protectListCount1 > 0 then
					local R = math.random(0, protectListCount1 - 1);
					Char:InputCommand(LuaI.BATCMD_SKILL, protectList1[R], 5222, 0);
				else
					Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
				end	
			elseif protectListCount <= 5 then
				local T = math.random(0, actorListCount - 1);
				Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);	
			else			
				Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);				
			end			
		end
	end
end
