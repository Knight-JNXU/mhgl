--»ìÂÒ(Æøº³¾ÅÖØÌì)

function buff1113Add(buff, Char) 
	local AI = "Confusion";
	Char:SetAIType(AI);
	Char:IgnoreTeam(true);
end

function buff1113Remove(buff, Char) 
	local AI = "";
	Char:SetAIType(AI);
	Char:IgnoreTeam(false);
end

function buff1113Attri(Char, buff, Attri) 
	Attri:SetAtk(Attri:GetAtk() * 1.2);
	Attri:SetDef(Attri:GetDef() * 0.9);	
end
