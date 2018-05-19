--被李大嘴攻击后死亡

function buff1539Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		
		local hp = Char:GetHP()
		local hp1 = Other:GetMaxHP()
		if (Other:GetAction() == LuaI.BATCMD_ATTACK or Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK ) and 
			Other:HasSkill(5300) and Char:GetReaction() ~= LuaI.BATCMD_MISS and Char:GetHP() ~= 0 then 
			
			Char:ChangeHp(-hp)
			if Other:GetHP() + 1/5*hp1 < hp1 then
				Other:ChangeHp(1/5*hp1)
			else 
				Other:ChangeHp(hp1 -  Other:GetHP())
			end
		end
	end
end
