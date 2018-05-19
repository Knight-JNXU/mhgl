--十二侠客剑阵(七巧锁心剑)

function buff1800Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		
		--local animation = 0;
		--local csv = Other:GetSkillCsvData(Other:GetSubType());
		--if csv ~= nil then
		--	animation = csv.animation_Type;
		--end
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		local NowReAtkCount = buff:GetBuffValue2();			
		local Rate = 0;
		
		if buff:GetBuffValue1() > Other:GetLevel() then
			Rate = 70 + 2 * (buff:GetBuffValue1() - Other:GetLevel()) ^ 0.5;
		else
			Rate = 70 + 2.2 * (buff:GetBuffValue1() - Other:GetLevel());
		end
		
		if Rate < 20 then
			Rate = 20;
		elseif Rate > 95 then
			Rate = 95;
		elseif Other:IsMob() then
			if Other:GetMob_id() == 10493 then
				Rate = 100;
			end
		end
		
		if Char:GetTeam() ~= Other:GetTeam() then
			
			if (Other:GetAction() == LuaI.BATCMD_ATTACK or
				Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK ) and
				(reDam1 > 0 or reDam2 > 0 or reDam3 > 0 ) and
				Char:GetReaction() ~= LuaI.BATCMD_MISS then	
				
				if math.random(1, 100) <= Rate then
					Other:AddBuff(1107, 0, 0, 0, 3, 100);
					buff:SetBuffValue2(NowReAtkCount - 1);
				--else 
					--Char:SetTempReaction(LuaI.BATCMD_MISS);
				end
				
				if buff:GetBuffValue2() <= 0 then
					Char:RemoveBuff(1800);
				end
			end
		end
	end	
	
end
