--白云城辅助喽啰AI

function buff5001Active(buff, Char, Other, Type)
	
	if Type == DO_ACTION then
		if not Char:IsBuffExist(1113) and not Char:IsBuffExist(1114) then
			local battle = Char:GetBattle();
			local actorCount = battle:GetActorCount();
			local actorList = {};
			local actorListCount = 0;
			local protectList = {};
			local protectListCount = 0;
			local protectList1 = {};
			local protectListCount1 = 0;
			
			for i = 0, actorCount - 1 do
				local actor = battle:GetActor(i);
				
				--敌方Char目标选择列表
				if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget()) then
					actorList[actorListCount] = actor:GetIndex();
					actorListCount = actorListCount + 1;
				end
				
				--己方Char目标选择列表
				if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget() --and 
					--actor:GetIndex() ~= Char:GetIndex()
					) then
					protectList[protectListCount] = actor:GetIndex();
					protectListCount = protectListCount + 1;
				end
				
				--三属性加成目标选择列表
				if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget() and not actor:IsBuffExist(1505) and actor:HasSkill(5645) or actor:HasSkill(306)) then
					protectList1[protectListCount1] = actor:GetIndex();
					protectListCount1 = protectListCount1 + 1;
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
				if math.fmod(battle:GetCurTurn(), 3) == 1 then
					if protectListCount1 > 0 then
						local R = math.random(0, protectListCount1 - 1); 
						Char:InputCommand(LuaI.BATCMD_SKILL, protectList1[R], 5292, 0);
					elseif actorListCount > 0 then
						local S = math.random(0, actorListCount - 1);
						local dijiwuxing1 = math.random(1, 100);
						if dijiwuxing1 <= 15 then
							Char:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5240, 0);
						elseif dijiwuxing1 <= 30 then
							Char:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5241, 0);
						elseif dijiwuxing1 <= 45 then
							Char:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5242, 0);
						elseif dijiwuxing1 <= 60 then
							Char:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5243, 0);
						elseif dijiwuxing1 <= 75 then
							Char:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5244, 0);
						else
							Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[S], 0, 0);
						end
					else
						Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
					end
				else
					if actorListCount > 0 then
						local T = math.random(0, actorListCount - 1);
						local dijiwuxing2 = math.random(1, 100); 
						if dijiwuxing2 <= 15 then
							Char:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5240, 0);
						elseif dijiwuxing2 <= 30 then
							Char:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5241, 0);
						elseif dijiwuxing2 <= 45 then
							Char:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5242, 0);
						elseif dijiwuxing2 <= 60 then
							Char:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5243, 0);
						elseif dijiwuxing2 <= 75 then
							Char:InputCommand(LuaI.BATCMD_SKILL, actorList[S], 5244, 0);
						else
							Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);
						end
					else
						Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);						
					end
				end
			end
		end	
	end
end
