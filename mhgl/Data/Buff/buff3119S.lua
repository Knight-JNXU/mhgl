

function buff3119Active(buff, Char, Other, Type) 	
	
	if Type == TURN_START then
		local battle = Char:GetBattle()
		local actorCount = battle:GetActorCount();
		local HP = Char:FindBuff(3119):GetBuffValue1()
		local HP1 = Char:GetHP()
		--[[for i = 0, actorCount - 1 do
			local actor = battle:GetActor(i);
			if actor ~= nil and actor:GetTeam() == Char:GetTeam() then
				if HP1 == 0 then
					HP1 = actor:GetHP()
				elseif HP2 == 0 then
					HP2 = actor:GetHP()
				elseif HP3 == 0 then
					HP3 = actor:GetHP()
				end
			end
		end
		if not battle:GetActor(0):IsDead() then
			HP = battle:GetActor(0):GetMaxHP()
		end
		if HP1 > 0.2*HP and HP2 > 0.2*HP and HP3 > 0.2*HP and HP ~= 0 then
			HP = (HP1 + HP2 + HP3)/3
			for i = 0, actorCount - 1 do
			local actor = battle:GetActor(i);
			if actor ~= nil and actor:GetTeam() == Char:GetTeam()  then
				if X == 0 then
					actor:ChangeHp(HP - HP1)
					actor:ResetHP();
					X = X + 1
				elseif X == 1 then
					actor:ChangeHp(HP - HP2)
					actor:ResetHP();
					X = X + 1
				elseif X == 2 then
					actor:ChangeHp(HP - HP3)
					actor:ResetHP();
					X = X + 1
				end
			end
		end]]
		Char:ResetHP();
		Char:ChangeHp(HP - HP1,false)
	end	
end
