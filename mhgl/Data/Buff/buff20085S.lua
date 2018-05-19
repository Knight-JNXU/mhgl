 
--Ã∆ ÿ∑Ω
function buff20085Add(buff, Char) 

end



function buff20085Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
