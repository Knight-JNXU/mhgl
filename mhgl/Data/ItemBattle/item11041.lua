function item11041CanUse(Atk, Target) 
end

function item11041Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 0.1;		
		Target:ChangeDp(rec);
		Target:ChangeWc(10);
	end
end
