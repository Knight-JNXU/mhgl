function item11088CanUse(Atk, Target)
end

function item11088Use(Atk, Target, item)
	if Target:GetHP() == 0 then
		local rec = item:GetItem_quality() * 4 + 10;
		Target:ChangeSp(rec);
	else
		Atk:ItemFail("����Ʒ��δ����Ŀ����Ч");
	end
end
