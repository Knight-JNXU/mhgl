function item11079CanUse(Atk, Target) 
end

function item11079Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 5 + 200;
		Target:ChangeHp(rec);
	end
end
