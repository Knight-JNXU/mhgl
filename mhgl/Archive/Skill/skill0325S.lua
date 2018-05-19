-- 嫁衣神功 金色同伴燕南天专属技能

function skill0325CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	if Atk:IsBuffExist(602) then
		Atk:SkillFail("\#W[战斗讯息]：处于技能调息状态，无法继续使用");
	end	
end

function skill0325Use(Atk, Target, battle, skillLv)

	local lv = Atk:GetLevel();
	local consumeSp = 100;
	
	local Msg = string.format("內力不足%d，无法施展此招式",consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(600) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处在嫁衣神功状态");
		do return end
	end 
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	if  Target:GetHP() ~= 0 then 
		Target:AddBuff(600, 0, 0, 0, 3, 100);
	end
	Atk:AddBuff(602,0,0,0,5,100)
	battle:PushReactionActor(Target);
end