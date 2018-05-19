function buff8025Attri(Char, buff, Attri) 
  local eq_MaxHP = 10;
  local eq = Char:GetBag():GetItem(120);
	if eq then
	eq_MaxHP = (eq_MaxHP + eq:GetHIT())	/3;
	end

	Attri:SetAtk(Attri:GetAtk() +  eq_MaxHP);
end