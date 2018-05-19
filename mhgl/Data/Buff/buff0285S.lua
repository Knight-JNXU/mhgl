--回归增加经验

function buff0285Repeat(buff, Char, finish)
	if finish == 0 then
		local lv = Char:GetLevel();
		if lv >= 30 then
			local value = buff:GetBuffValue2();
			local Exp = 0;
			if lv >= 30 and lv <= 59 then
				if value == 1 then
					Exp = Char:GetNextLvExp() / 12;
				else
					Exp = Char:GetNextLvExp() / 6;
				end
			elseif lv >= 60 and lv <= 79 then
				if value == 1 then
					Exp = 0.75 * Char:GetNextLvExp() / 14;
				else
					Exp = 1.5 * Char:GetNextLvExp() / 14;
				end
			elseif lv >= 80 and lv <= 99 then
				if value == 1 then
					Exp = 0.25 * Char:GetNextLvExp() / 16;
				else
					Exp = 0.4 * Char:GetNextLvExp() / 16;
				end
			elseif lv >= 100 and lv <= 109 then
				if value == 1 then
					Exp = 0.1 * Char:GetNextLvExp() / 18;
				else
					Exp = 0.15 * Char:GetNextLvExp() / 18;
				end
			elseif lv >= 110 and lv <= 119 then
				if value == 1 then
					Exp = 0.04 * Char:GetNextLvExp() / 18;
				else
					Exp = 0.06 * Char:GetNextLvExp() / 18;
				end
			end
			
			Char:ChangeExpForScript(Exp, 8);
			local msg = string.format("\#W重出江湖，获赠经验值%d",Exp);
			Char:ShowAwardMsg(msg);
			ShowError(msg);
		end
  	end
end
