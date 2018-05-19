function item11078CanUse(Atk, Target) 
end

function item11078Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 3.5 + 150;
		Target:ChangeHp(rec);
	end
end
