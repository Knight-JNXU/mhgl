--获取融合状态

function buff3143Active(buff, Char, Other, Type) 
	
	if Type == TURN_END then		
		if not Char:IsBuffExist(3142) then
			if math.random(1, 10) <= 2 then
				Char:AddBuff(3142, 1, 0, 0, 120, 100);
			end
		end
	end	
	Char:BuffActive();
end 