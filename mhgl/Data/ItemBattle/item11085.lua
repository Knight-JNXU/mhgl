function item11085CanUse(Atk, Target) 
end

function item11085Use(Atk, Target, item)
	if Target:GetHP() == 0 then
		local rec1 = item:GetItem_quality() * 3;
		local rec2 = item:GetItem_quality() * 4;
		Target:ChangeHp(rec1);
		Target:ChangeMHp(rec2);
	else
		Atk:ItemFail("����Ʒ��δ����Ŀ����Ч");
	end
end
