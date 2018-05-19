function item11086CanUse(Atk, Target)
end

function item11086Use(Atk, Target, item)
	if Target:GetHP() == 0 then
		local rec1 = item:GetItem_quality() * 8;
		local rec2 = item:GetItem_quality() * 8;
		Target:ChangeHp(rec1);
		Target:ChangeMHp(rec2);
	else
		Atk:ItemFail("此物品对未死亡目标无效");
	end
end
