--日焰灼灼

function skill8044CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if Atk:IsBuffExist(1801) then
		Atk:SkillFail("\#W[战斗讯息]：已经处在日焰灼灼状态");
	end
	
end

function skill8044Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.5 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展日焰灼灼", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 5;
	
	Atk:AddBuff(1814, 1, 0, 0, turn, 100);
	battle:PushReactionActor(Target);	
end

