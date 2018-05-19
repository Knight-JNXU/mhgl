--神行身法

function skill60010Attri(Char, skillLv, Attri) 
	local StaValue = 0; 	
	if Char:GetCclass() == 1 then
		StaValue = 200;
	elseif Char:GetCclass() == 2 then
		StaValue = 200;	
	elseif Char:GetCclass() == 3 then
		StaValue = 200;	
	else
		StaValue = 200;	
	end		
	local MaxHpValue = StaValue+800;
	Attri:SetMaxHp(Attri:GetMaxHp() + MaxHpValue);

end
