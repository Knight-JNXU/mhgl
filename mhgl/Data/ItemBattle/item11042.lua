function item11042CanUse(Atk, Target) 
end

function item11042Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 0.4;		
		Target:ChangeDp(rec);
		Target:ChangeWc(40);
		
		if math.random(1, 100) <= 20 then
			Target:AddBuff(226, 0, 0, 0, 2, 100);
		end		
	end
end
