function item11047CanUse(Atk, Target) 
end

function item11047Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 0.1;		
		Target:ChangeDp(10);
		Target:ChangeWc(rec);
	end
end
