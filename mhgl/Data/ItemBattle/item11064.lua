function item11064CanUse(Atk, Target) 
	if Atk:IsBuffExist(36) then
		Atk:ItemFail("buff 36 exist");
	end
end

function item11064Use(Atk, Target, item)
	Target:ChangeHp(999);
	Atk:UseItemMsg("item 11064 used");
end
