--¾Æñ«(¾ÆÒâÏµÍ³)

function buff1703Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING or Type == DO_PROTECTTING then
		
		local reDam = -1 * Char:GetDHP();
		
		if reDam > 0 and Char:GetReaction() ~= LuaI.BATCMD_MISS then 
			
			local damDp = Char:GetDP();
			local MaxDam = Char:GetMaxHP();
			if Char:GetHP() < 1 then
				Char:ChangeDp(-0.5 * damDp, false);
			else
				local perDam = 100 * reDam / MaxDam;
				if perDam > 81 then
					Char:ChangeDp(56);
				elseif perDam > 51 then
					Char:ChangeDp(41);
				elseif perDam > 31 then
					Char:ChangeDp(26);
				elseif perDam > 21 then
					Char:ChangeDp(16);
				elseif perDam > 11 then
					Char:ChangeDp(11);
				elseif perDam > 4 then
					Char:ChangeDp(4);
				else
					Char:ChangeDp(1);
				end
			end
		end
	end	
end
