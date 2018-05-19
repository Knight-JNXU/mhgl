--大慈无悔

function skill0198CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需宁神静气修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	end
end
function skill0198Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 2 * skillLv ;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法大慈无悔", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local effectAtk = 0.7 * Atk:GetATK();
		
		if effectAtk <= 1 then
			effectAtk = 1;
		end
	Target:AddBuff(80, skillLv, effectAtk, 0, 2, 100);
	Target:AddBuff(79, skillLv, 0, 0, 2, 100);
	battle:PushReactionActor(Target);
	
end