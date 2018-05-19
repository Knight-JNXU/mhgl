--½µÄÚ¹¦(Åü¿ÕÕÆ)

function buff1409Attri(Char, buff, Attri) 
--	local i = buff:GetBuffValue2();
   Attri:SetPow(Attri:GetPow() + Char:GetLevel() - 10);



--[[
	if i >= 3 then
	    Attri:SetPow(Attri:GetPow() + Char:GetLevel() - 10);
	  else
	    Char:RemoveBuff(1409);
	  end--]]
end
--73708


