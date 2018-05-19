function item11084CanUse(Atk, Target)
end

function item11084Use(Atk, Target, item)
	if Target:GetHP() == 0 then
		Target:ChangeHp(300);
		Target:ChangeMHp(300);
	else
		Atk:ItemFail("此物品对未死亡目标无效");
	end
end
