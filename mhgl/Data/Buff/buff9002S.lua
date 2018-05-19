--MOB增加命中BUFF

function buff9006Attri(Char, buff, Attri) 
	
	Attri:SetHit(Attri:GetHit() * buff:GetBuffValue1() / 100);
end
