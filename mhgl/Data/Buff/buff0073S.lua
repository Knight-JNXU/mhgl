--失神(勾魂摄心大法)

function buff0073Add(buff, Char) 
	local AI = "LoseMind";
	Char:SetAIType(AI);
	Char:IgnoreTeam(true);
end

function buff0073Remove(buff, Char) 
	local AI = "";
	Char:SetAIType(AI);
	Char:IgnoreTeam(false);
end
