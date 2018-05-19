--µ÷Ï¢Êõ

function skill0356Attri(Char, skillLv, Attri) 
	local SprValue = 0; 	
	if Char:GetCclass() == 1 then
		SprValue = 4.6;
	elseif Char:GetCclass() == 2 then
		SprValue = 4;	
	elseif Char:GetCclass() == 3 then
		SprValue = 4.2;	
	else
		SprValue = 3.5;	
	end		
	local MaxSpValue = (Char:GetSPR()*SprValue+80)*skillLv/100;
	Attri:SetMaxSp(Attri:GetMaxSp() + MaxSpValue);
end
