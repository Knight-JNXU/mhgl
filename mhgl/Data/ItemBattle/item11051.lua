function item11051CanUse(Atk, Target) 
end

function item11051Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 0.2;		
		Target:ChangeDp(20);
		Target:ChangeWc(rec);
		
		local i = math.random(1, 100);
		if i <= 20 then
			local recHp = Target:GetMaxHP() * 0.05;
			Target:ChangeHp(recHp);
		end
	end
end
