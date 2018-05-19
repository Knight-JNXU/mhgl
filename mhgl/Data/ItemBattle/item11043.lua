function item11043CanUse(Atk, Target) 
end

function item11043Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 0.6;		
		Target:ChangeDp(rec);
		Target:ChangeWc(60);
		
		local i = math.random(1, 100);
		if i <= 20 then
			Target:AddBuff(226, 0, 0, 0, 2, 100);
		elseif i > 20 and i <= 40 then
			Target:AddBuff(224, 0, 0, 0, 2, 100);
		end
	end
end
