--高级5回合后自动复活

function buff2053Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING or Type == DO_PROTECTTING then
		if Char:GetHP() == 0 then
			Char:AddBuff(2067, 0, 0, 0, 5, 100);
		end
	end
end
