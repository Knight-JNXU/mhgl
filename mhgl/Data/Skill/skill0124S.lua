--翠烟遁形

function skill0124CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需灵龙出云修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end	
	elseif Atk:IsBuffExist(74) then
		Atk:SkillFail("\#W[战斗讯息]：此招式已被鬼眼识破，无法再次施展");
		do return end
	elseif Atk:IsBuffExist(70) then
		Atk:SkillFail("\#W[战斗讯息]：不能重复施展遁形");
	end
	
end

function skill0124Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.3 * skillLv + 5;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展翠烟遁形", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = math.floor((skillLv - 20) / 30);
	
	Target:AddBuff(70, skillLv, 0, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

