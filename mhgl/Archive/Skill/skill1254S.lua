--无极潜渊式--集气3

function skill1254Use(Atk, Target, battle, skillLv)
	if Atk:HasBuff(1311) then
		Atk:RemoveBuff(1311);
		Atk:AddBuff(1312, skillLv, 0, 0, 1, 100);
		Atk:SetPostSkill(1255, Target:GetIndex(), 1, skillLv);
		battle:PushReactionActor(Target);
	else
		Atk:SkillFail("集气期间被打断，无法继续施展无极潜渊式");
		do return end
	end
end
