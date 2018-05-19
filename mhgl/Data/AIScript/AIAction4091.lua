--×Ï½ûÖ®áÛ£¬¡°ÁãÁã·¢¡±AI

function AIAction4091(battle, mob)
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;	
	local protectList = {};
	local protectListCount = 0;
	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);
		if (actor ~= nil and actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			actorList[actorListCount] = actor:GetIndex();
			actorListCount = actorListCount + 1;			
		end
		
		if (actor ~= nil and actor:GetTeam() == mob:GetTeam() and actor:IsValidTarget() and actor:GetIndex() ~= mob:GetIndex()) then
			protectList[protectListCount] = actor:GetIndex();
			protectListCount = protectListCount + 1;		
		end					
	end
	
	if not mob:IsBuffExist(3159) then
		mob:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
	else
		if actorListCount > 0 then
			local R = math.random(0, actorListCount - 1);
			mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
		else
			mob:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		end
	end
end 