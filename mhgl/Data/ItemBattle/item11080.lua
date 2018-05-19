function item11080CanUse(Atk, Target) 
end

function item11080Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local buffID = {19, 20, 21, 24, 26, 27, 28, 29, 30, 45, 46, 47,	48, 49, 50, 51, 58, 59, 60, 61, 62, 63, 
						64, 65, 66, 67, 68, 69, 73, 76, 77, 225, 226}			
		Char:RemoveBuff(buffID[i]);			
	end
end
