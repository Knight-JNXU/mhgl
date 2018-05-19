function item11046CanUse(Atk, Target) 
end

function item11046Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 0.4;		
		Target:ChangeDp(rec);
		Target:ChangeWc(40);
		
		local i = math.random(1, 100);
		if i <= 20 then
			local recHp = Target:GetMaxHP() * 0.05;
			Target:ChangeHp(recHp);
		elseif i > 20 and i <= 40 then
			Target:RemoveBuff(225);
		end
	end
end
