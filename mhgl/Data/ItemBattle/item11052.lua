function item11052CanUse(Atk, Target) 
end

function item11052Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		local rec = item:GetItem_quality() * 0.4;		
		Target:ChangeDp(40);
		Target:ChangeWc(rec);
		
		local i = math.random(1, 100);
		if i <= 20 then
			local recHp = Target:GetMaxSP() * 0.05;
			Target:ChangeSp(recSp);
		elseif i > 20 and i <= 40 then
			Target:RemoveBuff(225);
		end
	end
end
