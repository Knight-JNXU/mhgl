--被屠戮目标

function buff3138Active(buff, Char, Other, Type) 
	
	if Type == TURN_END then		
		if math.random(1, 2) == 1 then
			Char:AddBuff(3139, 1, 0, 0, 1, 100);	
		else
			Char:AddBuff(3140, 1, 0, 0, 1, 100);	
		end
		if Char:IsBuffExist(3141) then
			Char:RemoveBuff(3141)
		end
	end
	Char:BuffActive();
end 