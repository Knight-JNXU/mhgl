--白云城生存喽啰AI

function buff5004Active(buff, Char, Other, Type)
	
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
			
			for i = 0, actorCount - 1 do
				local actor = battle:GetActor(i);
				
				--敌方Char目标选择列表
				if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget()) then
					actorList[actorListCount] = actor:GetIndex();
					actorListCount = actorListCount + 1;
				end
				
				--闭穴绝手目标选择列表
				if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget() and actor:IsParnter() and (not actor:IsBuffExist(1100) and not actor:IsBuffExist(1101) and
					not actor:IsBuffExist(1102) and not actor:IsBuffExist(1103) and not actor:IsBuffExist(1104) and not actor:IsBuffExist(1105) and not actor:IsBuffExist(1106) and
					not actor:IsBuffExist(1107) and not actor:IsBuffExist(1108) and not actor:IsBuffExist(1109) and not actor:IsBuffExist(1110) and not actor:IsBuffExist(1111) and
					not actor:IsBuffExist(1112) and not actor:IsBuffExist(1113) and not actor:IsBuffExist(1114) and not actor:IsBuffExist(1115) and not actor:IsBuffExist(1116))) then
					actorList1[actorListCount1] = actor:GetIndex();
					actorListCount1 = actorListCount1 + 1;
				end
				
				--点穴截脉目标选择列表
				if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget() and actor:IsPlayer() and (not actor:IsBuffExist(1100) and not actor:IsBuffExist(1101) and
					not actor:IsBuffExist(1102) and not actor:IsBuffExist(1103) and not actor:IsBuffExist(1104) and not actor:IsBuffExist(1105) and not actor:IsBuffExist(1106) and
					not actor:IsBuffExist(1107) and not actor:IsBuffExist(1108) and not actor:IsBuffExist(1109) and not actor:IsBuffExist(1110) and not actor:IsBuffExist(1111) and
					not actor:IsBuffExist(1112) and not actor:IsBuffExist(1113) and not actor:IsBuffExist(1114) and not actor:IsBuffExist(1115) and not actor:IsBuffExist(1116))) then
					actorList2[actorListCount2] = actor:GetIndex();
					actorListCount2 = actorListCount2 + 1;
				end
				
				--己方Char目标选择列表
				if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget() --and 
					--actor:GetIndex() ~= Char:GetIndex()
					) then
					protectList[protectListCount] = actor:GetIndex();
					protectListCount = protectListCount + 1;
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
				if actorListCount2 > 0 then
					local R = math.random(0, actorListCount2 - 1); 
					Char:InputCommand(LuaI.BATCMD_SKILL, actorList2[R], 5163, 0);
				else
					local a = math.random(1, 100);
					if a <= 25 and actorListCount1 > 0 then
						local S = math.random(0, actorListCount1 - 1);
						Char:InputCommand(LuaI.BATCMD_SKILL, actorList1[S], 5160, 0);
					else
						if actorListCount > 0 then
							local T = math.random(0, actorListCount - 1); 
							Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);
						end
					end
				end
			end
		end
	end
end
