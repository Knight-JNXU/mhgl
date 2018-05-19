--幻银地刺

function skill0094CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需迷踪七变修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill0094Use(Atk, Target, battle, skillLv)

	local consumeSp = 0.5 * skillLv + 5;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法布设幻银地刺", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 1 + math.floor((skillLv - 30) / 30);
	if turn < 1 then
		turn = 1;
	elseif turn > 3 then
		trun = 3;
	end
	
	local ReAtkCount = 1; 
	
	Target:AddBuff(31, skillLv, ReAtkCount, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

