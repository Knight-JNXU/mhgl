--MOB迎风一刀斩

function skill5061CanUse(Atk, skillLv, reqSkillLv, reqCharLv)	
end

function skill5061Use(Atk, Target, battle, skillLv)
    local Lv = Atk:GetLevel();
	local consumeSp = 0.25 * Lv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展迎风一刀斩", consumeSp);

	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	Atk:SetPostSkill(5062, Target:GetIndex(), 1, (Lv+10));
	Atk:AddBuff(1302, (Lv+10), 0, 0, 2, 100);
	battle:PushReactionActor(Target);
end
