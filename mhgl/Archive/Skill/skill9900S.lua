--月煌虚引

function skill9900CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if Atk:IsBuffExist(1525) then
		Atk:SkillFail("\#W[战斗讯息]：已经处在月煌虚引状态");
	end
end

function skill9900Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = (0.1 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展月煌虚引", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	Target:AddBuff(1525, 1, 0, 0, 6, 100);
	battle:PushReactionActor(Target);
	
end
