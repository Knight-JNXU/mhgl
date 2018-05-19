function buff3126Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING_ATTACKER then
	
		Char:AddBuff(3127,Other:GetMob_id(),0,0,120,100);
	end
end
