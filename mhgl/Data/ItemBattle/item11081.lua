function item11081CanUse(Atk, Target) 
end

function item11081Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 7 + 50;
		Target:ChangeHp(rec);
	end
end
