function item11087CanUse(Atk, Target)
end

function item11087Use(Atk, Target, item)
	if Target:GetHP() == 0 then
		local rec1 = item:GetItem_quality() * 6;
		local rec2 = item:GetItem_quality() * 10;
		Target:ChangeHp(rec1);
		Target:ChangeMHp(rec2);
	else
		Atk:ItemFail("����Ʒ��δ����Ŀ����Ч");
	end
end
