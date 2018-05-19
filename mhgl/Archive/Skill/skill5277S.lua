--跑镖MOB组合技能准备

function skill5277CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill5277Use(Atk, Target, battle, skillLv)
	
	--[[local consumeSp = 0.1 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展云体风身", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);]]
	local Lv = Atk:GetLevel();
	local AttriAtk = 8 * Atk:GetLevel();
	local AttriSpd = 3000;
	Target:AddBuff(1515, (Lv + 10), AttriAtk, AttriSpd, 1, 100);
	battle:PushReactionActor(Target);
	
end
