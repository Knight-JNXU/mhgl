--偏差(天地皆哭)

function buff0024Active(buff, Char, Other, Type) 
	
	if Type == DO_ACTION then
		if math.random(1, 10) <= 4 then
			
			local battle = Char:GetBattle();
			local actorCount = battle:GetActorCount();
			local r = math.random(1, actorCount - 1);
			local index = Char:GetIndex();		
			
			for i = 0, actorCount - 1 do
				local actor = battle:GetActor(math.fmod((index + r + i) , actorCount));
				if actor:GetTeam() ~= Char:GetTeam() and
					actor:IsValidTarget() and
					actor:IsVisibleToOthers() then
					
					Char:ChangeTarget(actor:GetIndex());
					break
				end			
			end		
		end
	end
end
