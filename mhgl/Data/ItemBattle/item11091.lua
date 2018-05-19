function item11091CanUse(Atk, Target) 
end

function item11091Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 7 + 50;
		Target:ChangeSp(rec);
	end
end
