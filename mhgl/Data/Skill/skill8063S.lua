--粉石碎玉

function skill8063CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8063Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.2 * Lv + 5);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展粉石碎玉", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1400) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处于粉石碎玉状态");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 3;
	Target:AddBuff(1702, 1, 0, 0, turn, 100);	
	battle:PushReactionActor(Target);
	
end
