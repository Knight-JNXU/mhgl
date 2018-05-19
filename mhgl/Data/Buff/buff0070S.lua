--翠烟遁形(遁形)

function buff0070Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		local consumeSp = 0.2 * buff:GetBuffValue1() + 5;
		if  Char:GetSP() < consumeSp then
			Char:RemoveBuff(70);
			Char:BuffActive();
		else
			Char:ChangeSp(-1 * consumeSp, false);
		end
	end	
	
	if Type == DO_ACTION then
		--判断DP有否增加      待程序suport
		if Char:GetAction() == LuaI.BATCMD_SKILL or
			Char:GetAction() == LuaI.BATCMD_SPECIAL then
			Char:RemoveBuff(70);
		end
	end
	
end
