--九霄惊神

function skill8042CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

end

function skill8042Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.25 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展九霄惊神", consumeSp);

	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	Atk:SetPostSkill(8043, Target:GetIndex(), 1, Lv);
	Atk:AddBuff(1704, 1, 0, 0, 2, 100);
	battle:PushReactionActor(Target);
end
