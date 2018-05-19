--自身攻击增益(云体风身)

function buff1502Attri(Char, buff, Attri)
if Char:HasSkill(64150) then
	Attri:SetAtk(Attri:GetAtk() + Char:GetLevel() - 10);
end	
	Attri:SetAtk(Attri:GetAtk() + buff:GetBuffValue2());
end





