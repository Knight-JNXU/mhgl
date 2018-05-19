--π¥ªÍ(π¥ªÍ…„–ƒ¥Û∑®)

function buff1114Add(buff, Char) 
	local AI = "LoseMind";
	Char:SetAIType(AI);
	Char:IgnoreTeam(true);
end

function buff1114Remove(buff, Char) 
	local AI = "";
	Char:SetAIType(AI);
	Char:IgnoreTeam(false);
end
