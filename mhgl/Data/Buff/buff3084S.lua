--高级2回合后自动复活

function buff3084Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		if Char:GetHP() == 0 then
			Char:AddBuff(3085, 0, 0, 0, 2, 100);
		end
	end
end
