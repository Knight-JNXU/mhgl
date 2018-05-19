--自身攻击和速度增益(跑镖MOB组合技能准备)

function buff1515Attri(Char, buff, Attri)
	Attri:SetAtk(Attri:GetAtk() + buff:GetBuffValue2());
	Attri:SetSpd(Attri:GetSpd() + buff:GetBuffValue3());
end
