function item11038CanUse(Atk, Target) 
end

function item11038Use(Atk, Target, item)
	if Target:GetHP() ~= 0 then
		if math.random(1, 100) <= 20 then
			Target:AddBuff(225, 0, 0, 0, 2, 100);
		end
	end
end
