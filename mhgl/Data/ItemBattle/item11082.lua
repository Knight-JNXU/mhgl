function item11082CanUse(Atk, Target) 
end

function item11082Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 12;
		Target:ChangeHp(rec);
	end
end
