


function buff0603Attri(Char, buff, Attri) 
	
	local value = buff:GetBuffValue2()
	if value > 3 then
		value = 3 
	end	
	if value <= 3 then
		Attri:SetAtk(Attri:GetAtk() * (1.0+0.03*value))
		Attri:SetPow(Attri:GetPow() * (1.0+0.03*value))
	end
end	
