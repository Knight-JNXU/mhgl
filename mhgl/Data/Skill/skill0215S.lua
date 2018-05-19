--MOB云体风身

function skill0215CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill0215Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 0.5 * Lv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：法力不足\#G%d\#W，无法施展灵能激发", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	--local AttriAtk = 0.5 * (skillLv + Atk:GetLevel());
	Target:AddBuff(1955, (Lv + 10), 0, 0, 5, 100);
	battle:PushReactionActor(Target);
	
end
