function item11050CanUse(Atk, Target) 
end

function item11050Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 0.7;		
		Target:ChangeDp(rec);
		Target:ChangeWc(70);
		
		local i = math.random(1, 100);
		if i <= 20 then
			Target:AddBuff(226, 0, 0, 0, 2, 100);
		elseif i > 20 and i <= 40 then
			Target:AddBuff(224, 0, 0, 0, 2, 100);
		elseif i > 40 and i <= 60 then
			Target:AddBuff(225, 0, 0, 0, 2, 100);
		end
	end
end
