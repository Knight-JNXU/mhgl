-----千叶渡劫指

function buff1902Active(buff, Char, Other, Type) 
	
	if (Type == DO_HITTING or Type == DO_PROTECTTING) and Char:GetOwner():GetSkillHide(2651) == 0 then
		local reDam = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDMHP();
		local Rate = math.random(1, 100);
		
		if reDam > 0 and Char:GetHP() == 0 and 
			Rate <= 15 then
			
			local rec = 0.1 * Char:GetMaxHP() + 2 * Char:GetSkillLv(2650);
			Char:ChangeMHp(reDam2, false);
			Char:ChangeHp(rec);
		end		
	end
end
