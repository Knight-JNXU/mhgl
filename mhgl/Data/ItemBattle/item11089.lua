function item11089CanUse(Atk, Target) 
end

function item11089Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 5 + 30;
		Target:ChangeSp(rec);
	end
end
