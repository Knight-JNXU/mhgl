 
--วเวเ
function buff20097Add(buff, Char) 

end




function buff20097Remove(buff, Char)
	if Char:GetMobID() ~= 0 then
		Char:ChangeToMob(0,1)
	end
end
