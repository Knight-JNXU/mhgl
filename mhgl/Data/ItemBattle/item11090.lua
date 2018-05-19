function item11090CanUse(Atk, Target) 
end

function item11090Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 6;
		Target:ChangeSp(rec);
	end
end
