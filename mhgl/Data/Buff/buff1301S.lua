--–È»ı(∑Á¿◊∆ﬂ–«’∂)

function buff1301Attri(Char, buff, Attri) 
	
	local DefEffect = 0.8 + math.floor(Char:GetSkillLv(1650) / 10) / 100;
	local PowEffect = 0.8 + math.floor(Char:GetSkillLv(1650) / 10) / 100;
	Attri:SetDef(Attri:GetDef() * DefEffect);
	Attri:SetPow(Attri:GetPow() * PowEffect);
	
end
