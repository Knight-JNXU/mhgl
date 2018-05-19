--滞后扣血1

function buff3098Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		local Dam1 = Char:GetMaxHP();
		local Dam2 = Char:GetMaxSP();
		local charhp = Char:GetHP();
		if Char:GetHP() ~= 0 and not Char:IsBuffExist(3099) then
			--if Char:GetHP() < nDot then
			--	nDot = Char:GetHP();			
			Char:ChangeHp(-0.5 * Dam1);
			Char:ChangeSp(-0.8 * Dam2);
			if (Char:IsBuffExist(2020) or Char:IsBuffExist(2053)) and Dam1 >= charhp then
				Char:AddBuff(2066, 0, 0, 0, 5, 100);
			end
			Char:BuffActive();
		end
	end
end
