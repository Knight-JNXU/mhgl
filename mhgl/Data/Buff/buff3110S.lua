--Char万毒萦绕反馈一个随机敌方单位

function buff3110Active(buff, Char, Other, Type) 
	
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
		
		for i = 0, actorCount - 1 do
			local actor = battle:GetActor(i);
			
			--敌方所有有效目标选择列表
			if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget()) then
				actorList[actorListCount] = actor:GetIndex();
				actorListCount = actorListCount + 1;
			end
			
			--敌方同伴有效目标选择列表
			if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget() and actor:IsParnter()) then
				actorList1[actorListCount1] = actor:GetIndex();
				actorListCount1 = actorListCount1 + 1;
			end
			
			--己方所有有效目标选择列表
			if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget()) then
				protectList[protectListCount] = actor:GetIndex();
				protectListCount = protectListCount + 1;
			end	
			
			--攻击睡眠目标选择列表
			if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget() and actor:IsBuffExist(1111)) then
				protectList1[protectListCount1] = actor:GetIndex();
				protectListCount1 = protectListCount1 + 1;
			end				
		end
		
		
		if protectListCount1 > 0 then
			local R = math.random(0, protectListCount1 - 1);
			Char:InputCommand(LuaI.BATCMD_ATTACK, protectList1[R], 0, 0);
		elseif actorListCount1 > 0 then
			local S = math.random(0, actorListCount1 - 1);
			Char:InputCommand(LuaI.BATCMD_ATTACK, actorList1[S], 0, 0);				
		elseif actorListCount > 0 then
			local T = math.random(0, actorListCount - 1);
			Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[T], 0, 0);
		else
			Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end 
	end
end
