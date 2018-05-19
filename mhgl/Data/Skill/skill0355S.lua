--»îÑªÊõ

function skill0355Attri(Char, skillLv, Attri) 
	local StaValue = 0; 	
	if Char:GetCclass() == 1 then
		StaValue = 6.8;
	elseif Char:GetCclass() == 2 then
		StaValue = 7.4;	
	elseif Char:GetCclass() == 3 then
		StaValue = 7.5;	
	else
		StaValue = 8.5;	
	end		
	local MaxHpValue = (Char:GetSTA()*StaValue+100)*skillLv/100;
	Attri:SetMaxHp(Attri:GetMaxHp() + MaxHpValue);
end
