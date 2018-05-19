--白云城复活喽啰AI

function buff5008Active(buff, Char, Other, Type)
	
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
					
				--己方Char目标选择列表
				if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget() and actor:GetIndex() ~= Char:GetIndex()) then
					protectList[protectListCount] = actor:GetIndex();
					protectListCount = protectListCount + 1;
				end	
				
				--复活目标选择列表
				if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:HasSkill(5645) and actor:GetHP() == 0) then
					protectList1[protectListCount1] = actor:GetIndex();
					protectListCount1 = protectListCount1 + 1;
				end	
				
				--解封目标选择列表
				if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget() and (actor:IsBuffExist(1100) or actor:IsBuffExist(1101) or actor:IsBuffExist(1102)
					or actor:IsBuffExist(1103) or actor:IsBuffExist(1104) or actor:IsBuffExist(1105) or actor:IsBuffExist(1106) or actor:IsBuffExist(1107) or actor:IsBuffExist(1108) 
					or actor:IsBuffExist(1109) or actor:IsBuffExist(1110) or actor:IsBuffExist(1111) or actor:IsBuffExist(1112) or actor:IsBuffExist(1113) or actor:IsBuffExist(1114) 
					or actor:IsBuffExist(1115) or actor:IsBuffExist(1116))) then
					protectList2[protectListCount2] = actor:GetIndex();
					protectListCount2 = protectListCount2 + 1;
				end				
			end
			
			if Char:IsBuffExist(4000) then
				Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			elseif Char:IsBuffExist(1103) or Char:IsBuffExist(1104) or Char:IsBuffExist(1105) or Char:IsBuffExist(1116) then 
				if actorListCount > 0 then
					local U = math.random(0, actorListCount - 1); 
					Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[U], 0, 0);
				end
			elseif Char:IsBuffExist(1106) or Char:IsBuffExist(1107) or Char:IsBuffExist(1108) or Char:IsBuffExist(1109) or Char:IsBuffExist(1110) then
				Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			else
				if protectListCount1 > 0 then
					local R = math.random(0, protectListCount1 - 1);					
					Char:InputCommand(LuaI.BATCMD_SKILL, protectList1[R], 5186, 0);
				else
					local actionform = math.random(1, 100);
					if actionform <= 25 then
						if protectListCount2 > 0 then
							local S = math.random(0, protectListCount2 - 1); 
							Char:InputCommand(LuaI.BATCMD_SKILL, protectList2[S], 5297, 0);
						elseif actorListCount > 0 then
							local T = math.random(0, actorListCount - 1); 
							Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);
						else
							Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
						end
					else
						if actorListCount > 0 then
							local V = math.random(0, actorListCount - 1); 
							Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[V], 0, 0);
						else
							Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
						end
					end
				end
			end
		end
	end
end
