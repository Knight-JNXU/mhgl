--MOB探花截脉手

function skill5188CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill5188Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	--[[local consumeSp = 0.3 * Lv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展探花截脉手", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1709) then
		Atk:SkillFail("\#W[战斗讯息]：对方已经处于探花截脉手状态");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);]]
	
	local turn = 2;
	
	Target:AddBuff(1709, Lv + 10, 0, 0, turn, 100);
	--Atk:AddBuff(1307, Lv + 10, 0, 0, turn, 100);
	
	battle:PushReactionActor(Target);
	
end
