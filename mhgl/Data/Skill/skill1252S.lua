--无极潜渊式--集气

function skill1252CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需十二无双心法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1312) then
		local Msg = "\#W[战斗讯息]：招式已集满三回合大地灵气，无须再集气，可立马施放";
		Atk:SkillFail(Msg);
	end	
end

function skill1252Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.3 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展无极潜渊式", consumeSp);

	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	--Atk:SetPostSkill(1253, Target:GetIndex(), 1, skillLv);
	if not Atk:IsBuffExist(1306) and not Atk:IsBuffExist(1311) and 
		not Atk:IsBuffExist(1312) then
		Atk:AddBuff(1306, skillLv, 0, 0, 120, 100);
	elseif  not Atk:IsBuffExist(1311) and not Atk:IsBuffExist(1312) then
		Atk:AddBuff(1311, skillLv, 0, 0, 120, 100);
	elseif not Atk:IsBuffExist(1312) then
		Atk:AddBuff(1312, skillLv, 0, 0, 120, 100);
	end
	battle:PushReactionActor(Target);
end
