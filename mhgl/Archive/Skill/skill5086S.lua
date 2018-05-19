--MOB云体风身

function skill5086CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
    if Atk:IsBuffExist(1502) then
		Atk:SkillFail("\#W[战斗讯息]：已经处在云体风身状态");
		do return end
    end
end

function skill5086Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 0.2 * Lv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展云体风身", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	Target:AddBuff(1502, 1, 0, 0, 6, 100);
	battle:PushReactionActor(Target);
	
end
