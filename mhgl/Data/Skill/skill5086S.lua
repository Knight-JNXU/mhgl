--MOB云体风身

function skill5086CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill5086Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	--[[local consumeSp = 0.1 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展云体风身", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);]]
	
	--local AttriAtk = 0.5 * (skillLv + Atk:GetLevel());
	Target:AddBuff(1502, (Lv + 10), 0, 0, 6, 100);
	battle:PushReactionActor(Target);
	
end
