function item11084CanUse(Atk, Target)
end

function item11084Use(Atk, Target, item)
	if Target:GetHP() == 0 then
		Target:ChangeHp(300);
		Target:ChangeMHp(300);
	else
		Atk:ItemFail("����Ʒ��δ����Ŀ����Ч");
	end
end
