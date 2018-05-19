--减血内毒(MOB,满天花雨,漫雪飘飞)
function buff3096Add(buff, Char) 
	local AI = "Confusion";
	Char:SetAIType(AI);
	Char:IgnoreTeam(true);
end

function buff3096Remove(buff, Char) 
	local AI = "";
	Char:SetAIType(AI);
	Char:IgnoreTeam(false);
end

function buff3096Attri(Char, buff, Attri) 
	Attri:SetAtk(Attri:GetAtk() * 1.2);
	Attri:SetDef(Attri:GetDef() * 0.9);
end

function buff3096Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		if Char:GetHP() ~= 0 then
			
			local DotDam1 = Char:GetHP() * 0.1;
			local DotDam2 = Char:GetSP() * 0.1;
			local DotLv = 15 * buff:GetBuffValue1();
			if DotDam1 <= 1 then
				DotDam1 = 1;
			end
			if DotDam2 <= 1 then
				DotDam2 = 1;
			end
			if DotDam1 > DotLv then
				DotDam1 = DotLv;
			end
			
			Char:ChangeHp(-1 * DotDam1);
			Char:ChangeSp(-1 * DotDam2);
			Char:BuffActive();
		end
	end
end
