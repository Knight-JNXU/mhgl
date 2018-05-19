--玩偶标记

function buff1708Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then		
		local reDam = -1 * Char:GetDHP()
		if Char:GetTeam() ~= Other:GetTeam() then 
			if Other:GetAction() == LuaI.BATCMD_ITEM and reDam == 108 and Char:GetReaction() ~= LuaI.BATCMD_MISS then
				Char:ResetHP()
				Char:ChangeHp(-reDam)				
				if Char:GetHP() == 0 then
					if Char:GetMob_id() == 32013 or Char:GetMob_id() == 32014 and Char:IsMob() then
						Other:AddBuff(4000,0,0,0,200,100)
					end
					if Char:GetMob_id() == 32015 or Char:GetMob_id() == 32017 and Char:IsMob() then
						Other:AddBuff(4001,0,0,0,200,100)
					end
					if Char:GetMob_id() == 32016 or Char:GetMob_id() == 32018 and Char:IsMob() then
						Other:AddBuff(4002,0,0,0,200,100)
					end
				end
			end	
		end
	end
end
