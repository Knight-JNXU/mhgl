
--楚留香 变身效果
function buff20010Active(buff, Char, Other, Type)  

end

function buff20010Add(buff, Char) 
	Char:SetSpeed(195)
end

function buff20010Attri(Char, buff, Attri)

	Attri:SetDef(Attri:GetDef()+103)
	Attri:SetMaxHp(Attri:GetMaxHp()+303)    
	Attri:SetMaxSp(Attri:GetMaxSp()+152)
	
end


function buff20010Remove(buff, Char)

		Char:ChangeToMob(0,1)
		Char:SetSpeed(150)
end
