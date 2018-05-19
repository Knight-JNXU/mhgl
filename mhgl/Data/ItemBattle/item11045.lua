function item11045CanUse(Atk, Target) 
end

function item11045Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 0.2;		
		Target:ChangeDp(rec);
		Target:ChangeWc(20);
		
		local i = math.random(1, 100);
		if i <= 20 then
			local recSp = Target:GetMaxSP() * 0.05;
			Target:ChangeSp(recSp);
		end
	end
end
