 
--天机老人
function buff20035Active(buff, Char, Other, Type) 

end

function buff20035Add(buff, Char) 
	Char:SetSpeed(175)
end


function buff20035Attri(Char, buff, Attri)

	
	Attri:SetAtk(Attri:GetAtk()+130) --攻击
    local HP = Attri:GetMaxHp()-400
	if HP > 100 then
		Attri:SetMaxHp(HP) 
	elseif HP <= 100 then
		Attri:SetMaxHp(100) 
	end
	Attri:SetHit(Attri:GetHit()+40) --命中
	
end

function buff20035Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
	Char:SetSpeed(150)
end
