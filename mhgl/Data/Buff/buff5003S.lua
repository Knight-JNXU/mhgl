--白云城隐身喽啰AI

function buff5003Active(buff, Char, Other, Type)
	
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
				
				--魅影目标选择列表
				if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget() and not actor:IsBuffExist(1701) and
					actor:GetIndex() == Char:GetIndex()
					) then
					protectList1[protectListCount1] = actor:GetIndex();
					protectListCount1 = protectListCount1 + 1;
				end	
			end
			
			if Char:IsBuffExist(4000) then
				Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			elseif Char:IsBuffExist(1103) or Char:IsBuffExist(1104) or Char:IsBuffExist(1105) or Char:IsBuffExist(1116) or Char:IsBuffExist(1701) then 
				if actorListCount > 0 then
					local U = math.random(0, actorListCount - 1); 
					Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[U], 0, 0);
				end
			elseif Char:IsBuffExist(1106) or Char:IsBuffExist(1107) or Char:IsBuffExist(1108) or Char:IsBuffExist(1109) or Char:IsBuffExist(1110) then
				Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
			else
				if protectListCount1 > 0 then
					local R = math.random(0, protectListCount1 - 1); 
					Char:InputCommand(LuaI.BATCMD_SKILL, protectList1[R], 5105, 0);
				elseif actorListCount > 0 then
					local S = math.random(0, actorListCount - 1);
					Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[S], 0, 0);
				else
					Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
				end				
			end
		end
	end
end
