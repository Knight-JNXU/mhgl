function buff3130Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		if not Char:IsDead() then
			local battle=Other:GetBattle()
			for i=0,battle:GetCharacterCount()-1 do
				actor=battle:GetCharacter(i)
				if actor and  not actor:IsDead() then
					if actor:HasBuff(3150) then
						buff=actor:FindBuff(3150)
						number = buff:GetBuffValue1()
						buff:SetBuffValue1(number+1)
					else 
						actor:AddBuff(3150,1,0,0,120,100)
					end
				end
			end
			MobList={3217,3218,3219,3220,3221,3222,3223,3224}
			local Mob_1=RandTable(MobList)
			battle:AddMob(Mob_1,1)
		end
	end
end
